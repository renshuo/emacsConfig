;; emms: emacs media system

(require 'emms)
(require 'emms-source-file)
(require 'emms-source-playlist)
(require 'emms-player-simple)
(require 'emms-player-mplayer)
(require 'emms-playlist-mode)
(require 'emms-info)
;; (require 'emms-info-mp3info)
;; (when (executable-find emms-info-mp3info-program-name)
;;   (add-to-list 'emms-info-functions 'emms-info-mp3info))
;; (require 'emms-info-ogginfo)
;; (when (executable-find emms-info-ogginfo-program-name)
;;   (add-to-list 'emms-info-functions 'emms-info-ogginfo))
(require 'emms-cue)
(add-to-list 'emms-info-functions 'emms-info-cueinfo)
;;(require 'emms-info-libtag)
;;(add-to-list 'emms-info-functions 'emms-info-libtag)
(require 'emms-cache)
(require 'emms-mode-line)
(require 'emms-mark)
(require 'emms-tag-editor)
(require 'emms-streams)
(require 'emms-lyrics)
(emms-lyrics 1)
(require 'emms-playing-time)
(require 'emms-player-mpd)
(require 'emms-player-xine)
(require 'emms-playlist-sort)
(require 'emms-browser)
(require 'emms-mode-line-icon)
(require 'emms-lastfm-client)
(require 'emms-bookmarks)
(require 'emms-last-played)
(require 'emms-history)
(emms-history-load)
(require 'emms-i18n)
(require 'emms-volume)

;; use mplayer to play music
(setq emms-player-list 
	  '(emms-player-mplayer-playlist
		emms-player-mplayer))


;;定制playlist显示
(defun my-emms-track-desc (track)
  "Return a description of the current track."
  (let ((artist (emms-track-get track 'info-artist))
        (title (emms-track-get track 'info-title))
        (album (emms-track-get track 'info-album))
        (ptime (emms-track-get track 'info-playing-time))
		(myear (emms-track-get track 'info-year))
		)
    (cond
	 (nil
        (format 
         "%-50s %20s | %-30s %2s:%-2s %-4s |> %10s"
         (if title
			 title 
		   (progn
			 (setq file-main-name 
		   (progn
			 (setq simple-title (emms-track-simple-description track))
			 (substring simple-title
			  (string-match "[^/]+$" simple-title)
			  (string-match "\\..*$" simple-title)
			  ))
		   )
;;			 (concat (number-to-string (length file-main-name))
;;					 file-main-name)
			 ))
         (if artist artist "") 
         (if album album "")
         (if ptime (/ ptime 60) "00")
         (if ptime 
			 (concat (number-to-string (/ (% ptime 60) 10))
					 (number-to-string (% ptime 10))
					 )
		   "00")
		 (if (and myear (> (string-to-number myear) 0)) myear "")
		 (emms-track-simple-description track)
		 ))
	 (t
	  (format "%-80s" track))
	 )
;;	  (emms-track-simple-description track)))
))
(setq emms-track-description-function 'my-emms-track-desc)
;;(setq emms-track-description-function 'emms-info-track-description)


(setq emms-playlist-default-major-mode 'emms-playlist-mode)
(add-to-list 'emms-track-initialize-functions 'emms-info-initialize-track)
(when (fboundp 'emms-cache)           ; work around compiler warning
  (emms-cache 1))
(emms-mode-line 1)
(emms-mode-line-blank)
(emms-playing-time 1)
(add-to-list 'emms-info-functions 'emms-info-cueinfo)
(add-hook 'emms-player-started-hook 'emms-last-played-update-current)




(setq emms-playlist-buffer-name "*Music*")


;;这是个emms用来保存播放列表以及其他文件的默认目录
(setq emms-source-file-default-directory "/home/backup/music/")


;;;;;;---------------------------------------------------------------------


 


;; --by sren
;;emacs启动时不播放，除非手动启动播放
;;(add-hook 'emms-player-started-hook 'check-if-first-play)
;;(setq emms-first-play t)
;;(defun check-if-first-play ()
;;  (if emms-first-play
;;	  (progn 
;;		(setq emms-first-play nil)
;;		(emms-stop))))


;; 用mplayer替代mpg123
;;(setq emms-player-mplayer-command-name "mplayer"
;;emms-player-mplayer-parameters '("-slave")
;;emms-player-mpg321-command-name "mpg123"
;;emms-player-list
;;'(emms-player-mplayer
;;emms-player-mplayer-playlist
;;emms-player-mpg321
;;emms-player-ogg123))

;;(defun ddliu-emms-player-mplayer-volume-up ()
;;"Depends on mplayer’s -slave mode."
;;(interactive) 
;;(process-send-string
;;emms-player-simple-process-name "volume 1\n"))



(emms-playlist-mode-go)
(emms-add-directory-tree "/home/backup/music/")
