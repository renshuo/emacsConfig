;; mu4e common

(global-set-key (kbd "C-c m") 'mu4e)

(setq mu4e-maildir "~/.mail/qqmail/"
      mu4e-sent-folder "/Sent Messages"
      mu4e-drafts-folder "/Drafts"
      mu4e-trash-folder "/Deleted Messages"
      mu4e-refile-folder "/Archive"
      mu4e-get-mail-command "mbsync -a"
      mu4e-update-interval nil
      mu4e-compose-signature-auto-include nil
      mu4e-view-show-images t
      mu4e-view-show-addresses t
      mu4e-change-filenames-when-moving t ;; for fix UID is 3 beyond highest assigned UID 1,
      ;; see https://stackoverflow.com/questions/39513469/mbsync-error-uid-is-beyond-highest-assigned-uid

      user-mail-address "renshuoo@qq.com"
      user-full-name "Ren Shuo"

      message-send-mail-function 'smtpmail-send-it
      smtpmail-stream-type 'starttls
      smtpmail-default-smtp-server "smtp.qq.com"
      smtpmail-auth-credentials (expand-file-name "~/.authinfo.gpg")
      smtpmail-smtp-server "smtp.qq.com"
      smtpmail-smtp-service 587
      )

(setq mu4e-enable-notifications t)




