(provide 'julia-cfg)

(defun linum-mode-on ()
  (linum-mode t)
  )
(add-hook 'julia-mode-hook 'linum-mode-on )
