;; ac complete config for python
;;(add-to-list 'load-path "~/.emacs.d/plugins/auto-complete-1.3.1/")
(require 'auto-complete)
;;(add-to-list 'ac-dictionary-directories "./auto-complete-1.3.1/dict")
(require 'auto-complete-config)
(global-auto-complete-mode t)


;; set default ac source list
(setq-default ac-sources 
			  '(ac-source-filename
				ac-source-files-in-current-dir
				ac-source-words-in-same-mode-buffers
				ac-source-words-in-buffer 
				ac-source-yasnippet
				ac-source-dictionary))
;;(ac-config-default)

;;set ac source for emacs-lisp-mode (extends default)
(add-hook 'lisp-interaction-mode-hook 
		  (lambda () (add-to-list 'ac-sources 
								  '(ac-source-abbrev 
									 ac-source-eclim
									 ac-source-features
									 ac-source-functions
									 ac-source-imenu
									 ac-source-symbols 
									 ac-source-variable))))
(add-hook 'emacs-lisp-mode-hook 
		  (lambda () (add-to-list 'ac-sources 
								  '(ac-source-abbrev
									ac-source-eclim
									ac-source-features
									ac-source-functions 
									ac-source-imenu
									ac-source-symbols
									ac-source-variable))))

;;set ac source for python-mode
(add-hook 'python-mode-hook 
		  (lambda () (add-to-list 'ac-sources 
								  '(								   
									))))


;; load other ac plugins
;;(add-to-list 'load-path "~/.emacs.d/plugins/auto-complete-plugin")
;;(require 'ac-python)


;; add ac to those modes
(setq ac-modes
      (append ac-modes '(org-mode objc-mode jde-mode sql-mode
                                  change-log-mode text-mode
                                  makefile-gmake-mode makefile-bsdmake-mo
                                  autoconf-mode makefile-automake-mode)))


