(provide 'fontcfg)
(dolist (charset '(kana han cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font) charset
                    (font-spec :family "思源黑体 CN")))
(setq face-font-rescale-alist '(("宋体" . 1.2)
                                ("微软雅黑" . 1.2)
                                ("思源黑体 CN" . 1.2)
                                ("WenQuanYi Zen Hei" . 1.2)))
