;; ----------------------------- org-mode common
(provide 'orgmode-cfg)
;; agender file
(setq org-agenda-files (quote ("~/task/work")))

;; org-mode export markdown
(setq org-export-backends '(html icalendar latex md))

;; ---------------------------- org for task
(setq myorgdir "~/task/")
;; capture
(setq org-capture-templates
      (quote (
              ("t" "todo" entry (file (concat myorgdir "/work.org"))
               "* TODO %?\n%U\n%a\n" :clock-in t :clock-resume t)

              ("n" "note" entry (file (concat myorgdir "/note.org"))
               "* %? :NOTE:\n%U\n%a\n" :clock-in t :clock-resume t)

              ("d" "diary" entry (file (concat myorgdir "/diary.org"))
               "* %?\n%U\n" :clock-in t :clock-resume t)
              ))
      )

;;(message (concat orgdir "b"))

;; ---------------------------- org for diary and blog
;; config for org-mode to blog
;; (setq blognotedir (concat myblogdir "/notes"))
(setq myblogdir "~/blog")
(with-eval-after-load 'org
  (require 'ox-publish)
  (setq org-publish-project-alist
        '(
          ("blog-notes"
           :org-publish-use-timestamps-flag f
           ;; :base-directory blognotedir
           :base-directory "~/blog/notes"
           :base-extension "org\\|md"
           :publishing-directory "~/blog/public_html"
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
           :html-head "<link rel=\"stylesheet\" type=\"text/css\" href=\"/blog/public_html/theme/css/worg.css\"/>
                       <link rel=\"stylesheet\" type=\"text/css\" href=\"/gitPage/public_html/theme/css/worg.css\"/>
                       <link rel=\"stylesheet\" type=\"text/css\" href=\"theme/css/worg.css\"/>
                      ")
          ("blog-static"
           :base-directory "~/blog/notes"
           :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
           :publishing-directory  "~/blog/public_html/"
           :recursive t
           :publishing-function org-publish-attachment
           )
          ("blog-theme"
           :base-directory "~/blog/theme/"
           :base-extension "css\\|js\\|png\\|jpg\\|gif"
           :publishing-directory "~/blog/public_html/theme/"
           :recursive t
           :publishing-function org-publish-attachment
           )

          ("blog"
           :components ("blog-notes" "blog-static" "blog-theme")
           )
          )
        )
  )
