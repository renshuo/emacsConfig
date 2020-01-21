(provide 'emms-bilibili-cfg)
(use-package emms-bilibili
   :ensure t
   :commands (emms-bilibili))

;; (use-package emms-player-mpv
;;   :ensure t
;;   :config
;;   (add-to-list 'emms-player-list 'emms-player-mpv))
(add-to-list 'emms-player-list 'emms-player-simple-mpv)
