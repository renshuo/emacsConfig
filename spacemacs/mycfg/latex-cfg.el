;; ------------------------------ latex
(provide 'latex-cfg)
;; from: github...spacemacs ... latex layer
(add-hook 'doc-view-mode-hook 'auto-revert-mode) ;; for setting "auto" preview by M-m m p

(setq
 latex-enable-auto-fill t
 latex-enable-folding t
       TeX-engine 'xetex
       TeX-save-query nil
       TeX-show-compilation nil ;; 不显示编译窗口
       TeX-PDF-mode t
       )



;; (add-hook 'LaTeX-mode-hook
;;           (lambda()
;;             (add-to-list 'TeX-command-list '("XeLaTeX" "xelatex --shell-escape %(mode)  %t" TeX-run-TeX nil (latex-mode)))
;;             ;; 当有嵌入的metapost脚本时，使用gmp模块需要增加 --shell-escape 参数，则 C-c C-c 然后选择XeLaTeX命令编译，可自动编译metapost
;;             (setq TeX-engine 'xetex)
;;             ;; meta+m m b 时，使用xelatex作为engine编译tex
;;             (setq TeX-command-default “XeLaTeX”)
;;             (setq TeX-save-query nil )
;;             (setq TeX-show-compilation nil) ;; 不显示编译窗口
;;             (setq TeX-PDF-mode t)))
