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
