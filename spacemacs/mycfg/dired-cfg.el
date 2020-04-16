(provide 'dired-cfg)

;; dired进入文件夹时，复用当前buffer
(put 'dired-find-alternate-file 'disabled nil)
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
  (require 'dired-x)  ;; for use C-x C-j to jump to current dir
  )

