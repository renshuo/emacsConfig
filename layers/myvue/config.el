;; srenconfig

;; recent file, set key for recentf-open-file
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; tab width/indent
(setq default-tab-width 2)
(setq indent-tabs-mode nil
      js-indent-level 2)
(setq indent-tabs-mode nil
      css-indent-level 2)
(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-attr-indent-offset 2)

;; menu
(menu-bar-mode t)

;; line number
(setq-default dotspacemacs-line-numbers 'relative)

;;; 闪烁光标
(setq blink-cursor-mode t)

;; todo
;;; 设置光标为竖线（未生效）
(setq-default cursor-type 'bar)
;; (setq dotsapcemacs-cursor-type 'bar)
;;;(setq cursor-type nil)

;; 设置 删除选择的部分， 当有选择内容时，键入任何字符将替换所选部分
(delete-selection-mode t)

;; todo
;;防止页面滚动时跳动， scroll-margin 3 可以在靠近屏幕边沿3行时
;;就开始滚动，可以很好的看到上下文。
(setq-default scroll-step 1
      scroll-margin 3
      scroll-conservatively 10000)


;;标题栏显示 ;; %f 缓冲区完整路径 
(setq frame-title-format "%f")

;; org-mode export markdown
(setq org-export-backends (quote (ascii html icalendar latex md)))


;; 有道词典key绑定
(spacemacs/set-leader-keys "o y" 'youdao-dictionary-search-at-point+)


;; vue config
;; (use-package lsp-vue :ensure)
;; (use-package lsp-mode :ensure)
;; (use-package company-quickhelp-mode :ensure)
;; (use-package company-lsp
;;   :ensure
;;   :config
;;   (setq company-lsp-enable-snippet t))

;; (use-package company
;;   :ensure
;;   :config
;;   (setq company-minimum-prefix-length 1)
;;   (setq company-dabbrev-downcase nil)
;;   (setq company-idle-delay 0.5)
;;   (add-hook 'company-mode-hook 'company-quickhelp-mode)
;;   (add-to-list 'company-backend 'company-lsp))

;; (use-package web-mode
;;   :ensure
;;   :init
;;   (add-to-list 'auto-mode-alist '("\\.js\\" . web-mode))
;;   (add-to-list 'auto-mode-alist '("\\.vue\\" . web-mode))
;;   :config
;;   (add-hook 'web-mode-hook 'company-mode)
;;   (add-hook 'web-mode-hook 'lsp-vue-enable))

