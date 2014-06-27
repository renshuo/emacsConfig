(setq mew-prog-ssl "/usr/bin/stunnel")

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

(setq mew-mail-path "~/mewBox")

  (setq mew-config-alist
  	  '(
  		("mailbox"
           (mailbox-type          'mbox)
           (proto                 "+")
           (name                  "RenShuo")
           (user                  "renshs")
           (mail-domain           "gmail.com")
		   (mbox-command "incm")
		   (mbox-command-arg "-u -a -d ~/maillocal")
          )
  		("gmail"
           (mailbox-type          imap)
           (proto                 "%")
           (name                  "RenShuo")
           (user                  "renshs")
           (mail-domain           "gmail.com")
           (imap-user             "renshs@gmail.com")
           (imap-server           "imap.gmail.com")
		   (imap-ssl t)
		   (imap-ssl-port "993")
		   (imap-auth nil)
           (smtp-auth-list        ("PLAIN" "LOGIN" "CRAM-MD5")) 
           (smtp-user             "renshs@gmail.com")
           (smtp-server           "smtp.gmail.com")
          )
		("163"
           (mailbox-type          imap)
           (proto                 "%")
           (name                  "Renshuo-163")
           (user                  "13324568725")
           (mail-domain           "163.com")
           (imap-user             "13324568725")
           (imap-server           "imap.163.com")
           (smtp-auth-list        ("PLAIN" "LOGIN" "CRAM-MD5")) 
           (smtp-user             "13324568725@163.com")
           (smtp-server           "smtp.163.com")
          )
		("qq"
           (mailbox-type          imap)
           (proto                 "%")
           (name                  "Renshuo-qq")
           (user                  "17663204")
           (mail-domain           "qq.com")
           (imap-user             "17663204")
           (imap-server           "imap.qq.com")
           (smtp-auth-list        ("PLAIN" "LOGIN" "CRAM-MD5")) 
           (smtp-user             "17663204")
           (smtp-server           "smtp.qq.com")
		   )
))
;;; summary模式下用 C 切换目录，可以使用不同的name以及smtp配置作为发送方
(setq mew-case "163") ;; 设置默认模式

(setq mew-use-cached-passwd t)
(setq mew-passwd-timer-unit 1000)
(setq mew-passwd-alist 
	  '(
		("13324568725@imap.163.com:imap" "831130ren" 0)
		("13324568725@smtp.163.com:smtp" "831130ren" 0)
		("17663204@imap.qq.com:imap" "831130ren" 0)
		("17663204@smtp.qq.com:smtp" "831130ren" 0)
))


;; 定制summary界面格式
(setq mew-summary-form
	  '(type " " (5 date) " " (5 time) "  " (30 from) " " t (0 subj)))
(setq mew-summary-form-extract-rule '(name)) ;; 指定From列显示发件人姓名

(setq mew-use-full-window t)
(setq mew-use-unread-mark t)


;; 用w3m看html邮件，需要安装w3m, emacs-w3m
(condition-case nil
    (require 'mew-w3m)
  (file-error nil))

;; 指定回复时如何引用原邮件
(setq mew-cite-fields '("From:" "Date:")) ;; 引用原邮件的日期和来源
(setq mew-cite-format "\n\n From: %s at %s") 


;; 设置回复为上回复（引文在下方）
(setq mew-summary-reply-with-citation-position "body")
