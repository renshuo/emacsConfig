;; common
(setq elmo-maildir-folder-path "~/.Maildir/")
(setq elmo-localdir-folder-path "~/.Mail/")

;; 打开sumary界面时，关闭pangu功能，中英文中间不再有空格隔开
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
      '(
        ((string-match "" wl-draft-parent-folder) ;; when write mail on top of wl, use this template
         (template . "aliyun"))
        ((string-match "aliyun" wl-draft-parent-folder)
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
        ("189"
         ("From" . "18092099708@189.cn")
         (wl-from . "RenShuo <18092099708@189.cn>")
         (wl-smtp-posting-user . "18092099708")
         (Wl-Smtp-Posting-Server . "smtp.189.cn")
         (wl-smtp-authenticate-type . "plain")
         (wl-smtp-connection-type . 'starttls)
         (wl-smtp-posting-port . 25)
         (wl-local-domain . "189.cn")
         (wl-message-id-domain . "smtp.189.cn"))
        )
      )

;; 去掉邮件头中的一些不重要信息
(setq wl-message-ignored-field-list
      '(".")
      wl-message-visible-field-list
      '("^\\(To\\|Cc\\):"
        "^Subject:"
        "^\\(From\\|Reply-To\\):"
        "^\\(Posted\\|Date\\):"
        "^Organization:"
        "^X-\\(Face\\(-[0-9]+\\)?\\|Weather\\|Fortune\\|Now-Playing\\):")
      ;; wl-message-sort-field-list
      ;; (append wl-message-sort-field-list
      ;;         '("^Reply-To" "^Posted" "^Date" "^Organization"))
      )

;; (setq       wl-message-sort-field-list
;;             (append wl-message-sort-field-list
;;                     '("^Reply-To" "^Posted" "^Date" "^Organization"))
;;             )
(setq wl-message-sort-field-list
      '("^Reply-To" "^Posted" "^Date" "^Organization")
      )

;; 过滤邮件 C - o
(setq wl-refile-rule-alist
      '(("From"
         ("10000sn@189.cn" . "+陕西电信")
         ("InfoQ" . "+InfoQ")
         ("cmbchina.com" . "+spam/银行")
         ("招商银行信用卡" . "+spam/银行")
         ("兴业银联中心" . "+spam/银行")
         ("交通银行信用卡中心" . "+spam/银行")
         ("ThoughtWorks Webinar" . "+spam/ThoughtWorks")
         ("righere@bos.spdb-card.com" . "+spam/银行")
         ("exert@positive.cebuser.com" . "+spam/银行")
         ("cmbchina.com" . "+spam/银行")
         ("人民网" . "+spam/人民网")
         ))
      )
(setq wl-summary-auto-refile-skip-marks nil) ;; 未读邮件也直接refile， 默认值是 ‘N’, ‘U’ and ‘!’
