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


(setq mew-config-alist
      '(
        ;; Default fetch mailbox is IMAP
        (default
         (mailbox-type          imap)
         (proto                 "%")
         (imap-server           "imap.gmail.com")
         (imap-user             "renshs")
		 (imap-ssl              t)
		 (imap-ssl-port         "993")
         (name                  "sren")
         (user                  "renshs")
		 (imap-auth             "031138ner")
  ;       (mail-domain           "gmail.com")
;         (imap-size             0)
;         (imap-delete           t)
;         (imap-queue-folder     "%queue")
 ;        (imap-trash-folder     "%Trash") ;; This must be in concile with your IMAP box setup
  ;       (smtp-auth-list        ("PLAIN" "LOGIN" "CRAM-MD5")) 
  ;       (smtp-user             "renshs@gmail.com")
  ;       (smtp-server           "smtp.gmail.com")
 
        )))





;;(setq mew-use-cached-passwd t)

;;(setq mew-use-master-passwd t)

;;(mew)
