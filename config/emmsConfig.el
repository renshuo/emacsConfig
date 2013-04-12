;; emms: emacs media system
(require 'emms-setup)
(emms-standard)
;; no cli volume setup tools in windows
(require 'emms-volume)
(require 'emms-score)
(emms-score 1)
;; autodetect musci files id3 tags encodeing
(require 'emms-i18n)
;; auto-save and import last playlist
(require 'emms-history)


;;emacs启动时不播放，除非手动启动播放
(add-hook 'emms-player-started-hook 'check-if-first-play)
(setq emms-first-play t)
(defun check-if-first-play ()
  (if emms-first-play
	  (progn 
		(setq emms-first-play nil)
		(emms-stop))))


;; 用mplayer替代mpg123
(setq emms-player-mplayer-command-name "mplayer"
emms-player-mplayer-parameters '("-slave")
emms-player-mpg321-command-name "mpg123"
emms-player-list
'(emms-player-mplayer
emms-player-mplayer-playlist
emms-player-mpg321
emms-player-ogg123))

(defun ddliu-emms-player-mplayer-volume-up ()
"Depends on mplayer’s -slave mode."
(interactive) 
(process-send-string
emms-player-simple-process-name "volume 1\n"))


(emms-play-directory-tree "/home/backup/ipod")


;;定制playlist显示
(defun bigclean-emms-info-track-desc (track)
  "Return a description of the current track."
  (let ((artist (emms-track-get track 'info-artist))
		(title (emms-track-get track 'info-title))
		(album (emms-track-get track 'info-album))
		(ptime (emms-track-get track 'info-playing-time)))
	(if title
		(format "%-40s %35s %-35s %5s:%-5s"
				(if title title "")
				(if artist artist "")
				(if album album "")
				(/ ptime 60)
				(% ptime 60)))))

(setq emms-track-description-function 'bigclean-emms-info-track-desc)

