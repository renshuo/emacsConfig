(autoload 'mew "mew" nil t)
(autoload 'mew-send "mew" nil t)

;;Optional setup (Read Mail menu):
(setq read-mail-command 'mew)

;; Optional setup (e.g. C-xm for sending a message):
(autoload 'mew-user-agent-compose "mew" nil t)
(if (boundp 'mail-user-agent)
    (setq mail-user-agent 'mew-user-agent))
(if (fboundp 'define-mail-user-agent)
    (define-mail-user-agent
      'mew-user-agent
      'mew-user-agent-compose
      'mew-draft-send-message
      'mew-draft-kill
      'mew-send-hook))

;; set my name and email
(setq mew-name "sren") ;; (user-full-name)
(setq mew-user "renshs@gmail.com") ;; (user-login-name)
(setq mew-mail-domain "mail.google.com")


;;
(setq mew-smtp-server "smpt.gmail.com")  ;; if not localhost


;; To use local mailbox "mbox" or "maildir" instead of POP
(setq mew-mailbox-type 'maildir)
(setq mew-mbox-command "incm")
(setq mew-mbox-command-arg "-u -d ~/.mail")
;; If /path/to/mbox is a file, it means "mbox".
;; If /path/to/mbox is a directory, it means "maildir".


(setq mew-use-cached-passwd t)

(setq mew-use-master-passwd t)

