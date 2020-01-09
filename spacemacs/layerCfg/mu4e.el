;; mu4e common

(global-set-key (kbd "C-c m") 'mu4e)

;; use 'fancy' non-ascii characters in various places in mu4e
(setq mu4e-use-fancy-chars t)

;; attempt to show images when viewing messages
(setq mu4e-view-show-images t)

(setq mu4e-enable-notifications t)

;; (setq
;;       message-send-mail-function 'smtpmail-send-it
;;       mu4e-maildir "~/.mail/"
;;       mu4e-sent-folder "/~local/Sent Messages/"
;;       mu4e-drafts-folder "/~local/Drafts/"
;;       mu4e-trash-folder "/~local/trash/"
;;       )

;; (defvar my-mu4e-account-alist
;;   '(("qqmail"
;;      ;; (mu4e-sent-folder "/qqmail/Sent Messages/")
;;      ;; (mu4e-drafts-folder "/qqmail/Drafts/")
;;      ;;       (mu4e-refile-folder "/Archive")
;;      (user-mail-address "renshuoo@qq.com")
;;      (smtpmail-local-domain "qq.com")
;;      (smtpmail-smtp-server "smtp.qq.com")
;;      (smtpmail-smtp-user "renshuoo@qq.com")
;;      (smtpmail-stream-type starttls)
;;      (smtpmail-smtp-service 587)
;;      )
;;     ;; ("189mail"
;;     ;;  ;; (mu4e-sent-folder "/189/Sent Messages/")
;;     ;;  ;; (mu4e-drafts-folder "/189/Drafts/")
;;     ;;  (user-mail-address "srens@189.cn")
;;     ;;  (smtpmail-smtp-server "smtp.189.cn")
;;     ;;  (smtpmail-smtp-user "srens@189.cn")
;;     ;;  (smtpmail-stream-type starttls)
;;     ;;  (smtpmail-smtp-service 587)
;;     ;;  )
;;     ("163mail"
;;      ;; (mu4e-sent-folder "/189/Sent Messages/")
;;      ;; (mu4e-drafts-folder "/189/Drafts/")
;;      (user-mail-address "18092099708@163.com")
;;      (smtpmail-local-domain "163.com")
;;      (smtpmail-smtp-server "smtp.163.com")
;;      (smtpmail-smtp-user "18092099708@163.com")
;;      (smtpmail-stream-type ssl)
;;      (smtpmail-smtp-service 994)
;;      )
;;     )
;;   )

;; (defun my-mu4e-set-account ()
;;   "Set the account for composing a message."
;;   (let* ((account
;;           (if mu4e-compose-parent-message
;;               (let ((maildir (mu4e-message-field mu4e-compose-parent-message :maildir)))
;;                 (string-match "/\\(.*?\\)/" maildir)
;;                 (match-string 1 maildir))
;;             (completing-read (format "Compose with account: (%s) "
;;                                      (mapconcat #'(lambda (var) (car var))
;;                                                 my-mu4e-account-alist "/"))
;;                              (mapcar #'(lambda (var) (car var)) my-mu4e-account-alist)
;;                              nil t nil nil (caar my-mu4e-account-alist))))
;;          (account-vars (cdr (assoc account my-mu4e-account-alist))))
;;     (if account-vars
;;         (mapc #'(lambda (var)
;;                   (set (car var) (cadr var)))
;;               account-vars)
;;       (error "No email account found"))))

;; (add-hook 'mu4e-compose-pre-hook 'my-mu4e-set-account)



(setq mu4e-maildir "~/.mail/"
      ;; mu4e-sent-folder "/local/Sent Messages/"
      ;; mu4e-drafts-folder "/local/Drafts/"
      ;; mu4e-trash-folder "/local/Deleted Messages/"
      ;; mu4e-refile-folder "/local/Archive/"
      mu4e-get-mail-command "mbsync -a"
      mu4e-update-interval nil
      mu4e-compose-signature-auto-include nil
      mu4e-view-show-images t
      mu4e-view-show-addresses t
      mu4e-change-filenames-when-moving t ;; for fix UID is 3 beyond highest assigned UID 1,
      ;; see https://stackoverflow.com/questions/39513469/mbsync-error-uid-is-beyond-highest-assigned-uid

      message-send-mail-function 'smtpmail-send-it
      smtpmail-default-smtp-server "smtp.qq.com"
      smtpmail-smtp-server "smtp.qq.com"
      smtpmail-smtp-user "renshuoo@qq.com"
      smtpmail-stream-type 'starttls
      smtpmail-smtp-service 587
      )






