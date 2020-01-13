;; common
(setq elmo-maildir-folder-path "~/.Maildir/")
(setq elmo-localdir-folder-path "~/.Mail/")

(add-hook 'wl-summary-mode-hook
          `(lambda ()
             (pangu-spacing-mode -1)
             )
          )

;; 定制summary界面的行格式
(setq wl-summary-line-format
      "%T %n %P %Y-%M-%D(%W) %h:%m | %t%25(%c %f%) | %s")
(setq wl-summary-width 160)

;; multi smtp user
(setq wl-user-mail-address-list (quote ("renshs@aliyun.com" "renshuoo@qq.com")))


;; 邮件的发件信息 C-c C-j , 用 n,p 选择
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


;; 去掉邮件头中的一些不重要信息
;; (setq wl-message-ignored-field-list
;;       '(".")
;;       wl-message-visible-field-list
;;       '("^\\(To\\|Cc\\):"
;;         "^Subject:"
;;         "^\\(From\\|Reply-To\\):"
;;         "^\\(Posted\\|Date\\):"
;;         "^Organization:"
;;         "^X-\\(Face\\(-[0-9]+\\)?\\|Weather\\|Fortune\\|Now-Playing\\):")
;;       wl-message-sort-field-list
;;       (append wl-message-sort-field-list
;;               '("^Reply-To" "^Posted" "^Date" "^Organization")))