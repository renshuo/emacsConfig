;; cedet 在emcas包中已经有了，不需要单独下载了，只需要在这里配置即可
;;(setq cedet-file (concat emacs-plugin-dir "cedet-1.1/common/" "cedet.el"))
;;(load cedet-file)
;;(global-ede-mode 1)
;;(semantic-load-enable-code-helpers)
;;(global-srecode-minor-mode 1)


(require 'cedet)
(global-ede-mode t)

;;(custom-set-variables
;;   '(semantic-default-submodes

;;;;  Helper tools.
(custom-set-variables
 '(semantic-default-submodes 
   (quote (global-semantic-decoration-mode 
		   global-semantic-idle-completions-mode 
		   global-semantic-idle-scheduler-mode 
		   global-semanticdb-minor-mode
		   global-semantic-idle-summary-mode 
		   global-semantic-mru-bookmark-mode)))
 '(semantic-idle-scheduler-idle-time 3))

(semantic-mode)


;;;; 集成imenu，展示访问的目标
;;;; TAGS Menu
(defun my-semantic-hook ()
  (imenu-add-to-menubar "TAGS"))
(add-hook 'semantic-init-hooks 'my-semantic-hook)

;;;; Semantic DataBase存储位置
(setq semanticdb-default-save-directory
      (expand-file-name "~/.emacs.d/semanticdb"))
