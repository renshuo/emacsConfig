(add-to-list 'load-path "./python-mode.el-6.0.2")
(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

;; config pymacs
;;(add-to-list 'load-path "./pinard-Pymacs-016b0bc")
;;(autoload 'pymacs-apply "pymacs")
;;(autoload 'pymacs-call "pymacs")
;;(autoload 'pymacs-eval "pymacs" nil t)
;;(autoload 'pymacs-exec "pymacs" nil t)
;;(autoload 'pymacs-load "pymacs" nil t)
;;(eval-after-load "pymacs"
;;  '(add-to-list 'pymacs-load-path "./pinard-Pymacs-016b0bc/Pymacs"))

;; config ipython (no effective)
;; use ipython as python shell
;;(add-to-list 'load-path "~/.emacs.d/plugins/ipython")
;;(setq ipython-command "/usr/bin/ipython")
;;(setq python-python-command "ipython")
;;(setq ipython-command "/usr/bin/ipython")
;;(require 'ipython)

;; error? only support python2?
;; (add-to-list 'load-path "~/.emacs.d/plugins/python-mode.el-6.0.2/completion")
;; (require 'pymacs)
;; (setq pymacs-load-path
;; 	  (append pymacs-load-path '("~/.emacs.d/plugins/python-mode.el-6.0.2/completion")))
;; (require 'pycomplete)


;; error? only support python2?
;; config gpython
;; (add-to-list 'load-path "~/.emacs.d/plugins/fgallina-gpycomplete-b30016f")
;; (require 'pymacs)
;; (setq pymacs-load-path
;; 	  (append pymacs-load-path '("~/.emacs.d/plugins/fgallina-gpycomplete-b30016f")))
;; (require 'gpycomplete)
