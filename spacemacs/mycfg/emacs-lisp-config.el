(provide 'emacs-lisp-config)

;; (define-key global-map "\C-c c" 'org-capture)
(add-hook
 'emacs-lisp-mode-hook
 (lambda ()
   (progn (local-set-key (kbd "C-<return>") 'eval-last-sexp)
          )))

;; (add-hook
;;  'c-mode-common-hook
;;  (lambda ()
;;    (define-key c-mode-map (kbd "/C-_")
;;      'complete-tag)))
