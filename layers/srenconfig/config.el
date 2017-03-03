;; set key for recentf-open-file
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(menu-bar-mode t)

;; todo
;;; 设置光标为竖线（未生效）
(setq-default cursor-type 'bar)
(setq cursor-type 'bar)
;;;(setq cursor-type nil)


;;; 闪烁光标
(blink-cursor-mode t)


;; 设置 删除选择的部分， 当有选择内容时，键入任何字符将替换所选部分
(delete-selection-mode t)

;; todo
;;防止页面滚动时跳动， scroll-margin 3 可以在靠近屏幕边沿3行时
;;就开始滚动，可以很好的看到上下文。
(setq scroll-step 1
      scroll-margin 3
      scroll-conservatively 10000)


;;标题栏显示 ;; %f 缓冲区完整路径 
(setq frame-title-format "%f")

;; xml intent

