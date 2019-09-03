;; srenconfig

;; menu
(menu-bar-mode t)

;; recent file, set key for recentf-open-file
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; line number
(setq-default dotspacemacs-line-numbers 'relative)

;;; 闪烁光标
(blink-cursor-mode t)

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
(setq org-export-backends '(ascii html icalendar latex md))


;; ------------------------------ chinese
;; 有道词典key绑定
(spacemacs/set-leader-keys "o y" 'youdao-dictionary-search-at-point+)

;;(spacemacs/set-monospaced-font "Source Code Pro" "WenQuanYi Bitmap Song" 14 16)



;; ------------------------------ latex
;; (add-hook 'doc-view-mode-hook 'auto-revert-mode)
(add-hook 'LaTeX-mode-hook
          (lambda()
            (add-to-list 'TeX-command-list '("XeLaTeX" "xelatex --shell-escape %(mode)  %t" TeX-run-TeX nil (latex-mode)))
            ;; 当有嵌入的metapost脚本时，使用gmp模块需要增加 --shell-escape 参数，则 C-c C-c 然后选择XeLaTeX命令编译，可自动编译metapost
            (setq TeX-engine 'xetex)
            ;; meta+m m b 时，使用xelatex作为engine编译tex
            (setq TeX-command-default “XeLaTeX”)
            (setq TeX-save-query nil )
            (setq TeX-show-compilation nil) ;; 不显示编译窗口
            (setq TeX-PDF-mode t)))



;; org-mode code runner
;; (org-babel-do-load-languages
;;  'org-babel-load-languages
;;  '(
;;    (python . t)

;;    )
;;  )


;; config for org-mode to blog
(with-eval-after-load 'org
  (require 'ox-publish)
  (setq org-publish-project-alist
        '(
          ("blog-notes"
           :org-publish-use-timestamps-flag t
           :base-directory "/home/work/coding/blog/notes"
           :base-extension "org\\|md"
           :publishing-directory "/home/work/coding/blog/public_html/"
           :recursive t
           :publishing-function org-html-publish-to-html
           :headline-levels 4             ; Just the default for this project.
           :auto-preamble t
           :section-numbers nil
           :author "renshuo"
           :email "renshuoo@qq.com"
           :auto-sitemap t                ; Generate sitemap.org automagically...
           :sitemap-filename "sitemap.org"  ; ... call it sitemap.org (it's the default)...
           :sitemap-title "Sitemap"         ; ... with title 'Sitemap'.
           :sitemap-sort-files anti-chronologically
           :sitemap-file-entry-format "%d %t"
           )
          ("blog-static"
           :base-directory "/home/work/coding/blog/notes"
           :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
           :publishing-directory "/home/work/coding/blog/public_html/"
           :recursive t
           :publishing-function org-publish-attachment
           )

          ("blog" :components ("blog-notes" "blog-static"))
          )
        )
  )


