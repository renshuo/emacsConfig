(provide 'emms-cfg)

(require 'emms-setup)
(emms-all)
(require 'emms-i18n)
(require 'emms-history)
(require 'emms-player-simple)
(require 'emms-source-file)
(require 'emms-source-playlist)
(require 'emms-player-mplayer)
(require 'emms-info-libtag)
(setq emms-info-functions '(emms-info-libtag))
(setq emms-music-dir "~/音乐/")

;; 配置播放工具
;; (emms-default-players)
(setq emms-player-list
      '
      (emms-player-mpg321 emms-player-ogg123 emms-player-mplayer-playlist emms-player-mplayer emms-player-mpv)
      ;; (emms-player-mplayer-playlist
      ;;   emms-player-mplayer)
      )

(setq emms-source-file-default-directory emms-music-dir)


;; 设置播放列表基本配置
(setq emms-info-asynchronously nil)
(setq emms-playlist-default-major-mode 'emms-playlist-mode)
(setq emms-source-playlist-default-format 'm3u)
(setq emms-playlist-buffer-name "*Music*")

(setq x 121)
(/ x 60)
(% x 60)

;; 设置播放列表视图
(setq formatstr " %2d | %-60s _ %30s | %-40s %2s [ %02d:%02d ]" )
;;(format formatstr 1 "title" "sren" "album" "01:01:32")
(defun my-emms-mode-playlist-line (track)
  "format the line"
  (let* (
         (empty "...")
         (name (emms-track-name track))
         (short-name (file-name-sans-extension (file-name-nondirectory name)))
         (play-count (or (emms-track-get track 'play-count) 0))
         (trackNum (or (emms-track-get track 'info-tracknumber) ""))
         (time (or (emms-track-get track 'info-playing-time) 0))
         (time-m (/ time 60))
         (time-s (% time 60))
         (artist (or (emms-track-get track 'info-artist) empty))
         (album (or (emms-track-get track 'info-album) empty))
         (title (or (emms-track-get track 'info-title) short-name))
         )
    (format formatstr play-count title artist album trackNum time-m time-s)

    )
  )
(setq emms-track-description-function 'my-emms-mode-playlist-line)
(setq emms-show-format "%s")

;; 初始列表
(defun emms-init-load ()
  (interactive)
  (emms-add-playlist (concat emms-music-dir "/default.m3u"))
  (switch-to-buffer "*Music*")
  )
(global-set-key (kbd "C-c C-e") 'emms-init-load)

