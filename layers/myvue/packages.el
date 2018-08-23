;;; packages.el --- srenconfig layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author:  <sren@sren-gentoo>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `srenconfig-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `srenconfig/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `srenconfig/pre-init-PACKAGE' and/or
;;   `srenconfig/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(setq myvue-packages
  '(
    lsp-vue
    lsp-mode
    company-lsp
    company-quickhelp
    web-mode
    )
  )
(defun myvue/init-lsp-vue ()
  (use-package lsp-vue :ensure)
  )

(defun myvue/init-lsp-mode ()
  (use-package lsp-mode :ensure)
  )

(defun myvue/init-company-quickhelp ()
  (use-package company-quickhelp :ensure)
  )


(defun myvue/init-company-lsp ()
  (use-package company-lsp
    :ensure
    :config
    (setq company-lsp-enable-snippet t))
  (use-package company
    :ensure
    :config
    (setq company-minimum-prefix-length 1)
    (setq company-dabbrev-downcase nil)
    (setq company-idle-delay 0.5)
    (add-hook 'company-mode-hook 'comany-quickhelp-mode)
    (add-to-list 'company-backends 'company-lsp)
    )
  )

(defun myvue/post-init-web-mode ()
  (use-package web-mode
    :ensure
    :init
    (add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))
    :config
    (add-hook 'web-mode-hook 'company-mode)
    (add-hook 'web-mode-hook 'lsp-vue-enable)
    )
  )
;;; packages.el ends here
