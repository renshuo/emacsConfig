;; ########## common config ##########
(setq current-language-environment "UTF-8")
(setq font-use-system-font t)

;; 在状态栏显示行号


;; key map
;; (global-set-key (kbd "C-c z") (quote eshell))
;; (global-set-key (kbd "C-c s") (quote shell-command "eclipse"))

(require 'color-theme)
;;(color-theme-ahei)
;;(color-theme-clissic t)
(color-theme-sren)

;; set lang
(setq current-language-environment "UTF-8")
;;(current-language-environment "UTF-8")

;;括号匹配时显示另外一边的括号，而不是烦人的跳到另一个括号。
(show-paren-mode t)
(setq show-paren-style 'parentheses)

;;防止页面滚动时跳动， scroll-margin 3 可以在靠近屏幕边沿3行时
;;就开始滚动，可以很好的看到上下文。
(setq scroll-step 1
     scroll-margin 3
    scroll-conservatively 10000)

;;光标靠近鼠标指针时，让鼠标指针自动让开，别挡住视线。
;;(mouse-avoidance-mode 'animate)

;;让 Emacs 可以直接打开和显示图片。
(auto-image-file-mode)

;; 关闭 splash-screen
(setq inhibit-startup-message t)

;; 可以识别中文标点
(setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
;; 中文，标点。测试

;; tab 默认长度
(setq default-tab-width 4)

;;标题栏显示 ;; %f 缓冲区完整路径 %p 页面百分数 %l 行号
(setq frame-title-format "%f")

;;粘贴于光标处，而不是鼠标指针处
(setq mouse-yank-at-point t)

;; 关闭shell时，自动关闭shell buffer
(add-hook 'shell-mode-hook 'wcy-shell-mode-hook-func)
(defun wcy-shell-mode-hook-func  ()
  (set-process-sentinel (get-buffer-process (current-buffer))
                            #'wcy-shell-mode-kill-buffer-on-exit)
)
(defun wcy-shell-mode-kill-buffer-on-exit (process state)
  (message "%s" state)
  (if (or
       (string-match "exited abnormally with code.*" state)
       (string-match "finished" state)
	  )
       (kill-buffer (current-buffer))
  )
)


;; 去掉工具栏，菜单栏
(setq tool-bar-mode nil)
;;(menu-bar-mode nil)

;; 闪烁光标
(blink-cursor-mode t)

;; 显示时间
(setq display-time-format "%Y-%m-%d %A %H:%M")
(display-time-mode t)





;; 在左侧显示行号（M-x linum-mode)
(global-linum-mode t)
;; remove status bar line number
(line-number-mode -1)

;; 全屏
;;(defun my-fullscreen ()
;;        (interactive)
;;        (set-frame-parameter nil 'fullscreen
;;                             (if (frame-parameter nil 'fullscreen) nil 'fullboth)))

;;(run-with-idle-timer 0.1 nil 'my-fullscreen)
