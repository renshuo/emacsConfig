(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

;;键绑定
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda) ;; agenda界面
(global-set-key "\C-cb" 'org-iswitchb) ;;切换buffer

(add-hook 'org-mode-hook 'turn-on-font-lock)
;;(add-hook 'org-mode-hook 'linum-mode)

;; 当所有的子结束的时候，自动将父置为结束
(defun org-summary-todo (n-done n-not-done)
       "Switch entry to DONE when all subentries are done, to TODO otherwise."
         (org-todo (if (= n-not-done 0) "DONE" "TODO")))
(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)


;;解决org-mode下编辑中文不能自动换行的问题
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))


;;将newgtd.org加入到agendar的文件列表，这个可以使agendar能够查询到newgtd.org文件中的内容,否则，在agendar将看不到newgtd.org的内容
(setq org-agenda-files (
		quote ("/home/backup/.scrapbook/emacs_org/diary.org" 
			"/home/backup/.scrapbook/emacs_org/work.org"
			"/home/backup/.scrapbook/emacs_org/life.org")))






