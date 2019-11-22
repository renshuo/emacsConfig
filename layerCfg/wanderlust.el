;; common
(setq elmo-maildir-folder-path "~/.Maildir/")
(setq elmo-localdir-folder-path "~/.Mail/")
;; smtp
;; (setq wl-smtp-connection-type 'starttls
;;       wl-smtp-posting-port 25
;;       wl-smtp-authenticate-type "plain"
;;       wl-smtp-posting-user "renshs@aliyun.com"
;;       wl-smtp-posting-server "smtp.aliyun.com"
;;       wl-local-domain "aliyun.com"
;;       wl-message-id-domain "smtp.aliyun.com"
;;       )

;; (setq wl-smtp-connection-type 'starttls
;;       wl-smtp-posting-port 587
;;       wl-smtp-authenticate-type "plain"
;;       wl-smtp-posting-user "renshuoo"
;;       wl-smtp-posting-server "smtp.qq.com"
;;       wl-local-domain "qq.com"
;;       wl-message-id-domain "smtp.qq.com"
;;       )

;; multi smtp user
(setq wl-user-mail-address-list (quote ("renshs@aliyun.com" "renshuoo@qq.com")))

(setq wl-draft-config-alist
      '(((string-match "aliyun" wl-draft-parent-folder)
         (template . "aliyun"))
        ((string-match "qqMail" wl-draft-parent-folder)
         (template . "qq"))
        ;; auto for replies
        (reply "\\(To\\|Cc\\|Delivered-To\\): .*aliyun.com.*"
               (template . "aliyun"))
        (reply "\\(To\\|Cc\\|Delivered-To\\): .*qq.com.*"
               (template . "qq"))
         )
      )

(setq wl-template-alist
      '(("aliyun"
         ("From" . "renshs@aliyun.com")
         (wl-from . "RenShuo <renshs@aliyun.com>")
         (wl-smtp-posting-user . "renshs@aliyun.com")
         (wl-smtp-posting-server . "smtp.aliyun.com")
         (wl-smtp-authenticate-type . "plain")
         (wl-smtp-connection-type . 'starttls)
         (wl-smtp-posting-port . 25)
         (wl-local-domain . "aliyun.com")
         (wl-message-id-domain . "smtp.aliyun.com"))
        ("qq"
         ("From" . "renshuoo@qq.com")
         (wl-from . "RenShuo <renshuoo@qq.com>")
         (wl-smtp-posting-user . "renshuoo")
         (wl-smtp-posting-server . "smtp.qq.com")
         (wl-smtp-authenticate-type . "plain")
         (wl-smtp-connection-type . 'starttls)
         (wl-smtp-posting-port . 587)
         (wl-local-domain . "qq.com")
         (wl-message-id-domain . "smtp.qq.com"))
        )
      )
