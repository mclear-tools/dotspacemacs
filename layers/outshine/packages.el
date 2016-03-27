;;; packages.el --- outshine layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Colin McLear <mclear@fastmail.com>
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
;; added to `outshine-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `outshine/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `outshine/pre-init-PACKAGE' and/or
;;   `outshine/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(setq outshine-packages
  '((outline :location built-in) 
    outorg
    outshine
    navi-mode))

  (defun outshine/init-outline ()
    (use-package outline
      :defer t 
      :preface
      ;; must be set before outline is loaded
      (setq outline-minor-mode-prefix "\M-#")
      :commands (outline-mode outline-minor-mode)
      :config (spacemacs|diminish outline-minor-mode " Ⓞ")
      ))

  (defun outshine/init-outorg ()
      (use-package outorg
        :defer t
        ))

  (defun outshine/init-outshine ()
      (use-package outshine
        :defer t
        :commands outshine-hook-function
        :init
        (add-hook 'outline-minor-mode-hook 'outshine-hook-function)
        (add-hook 'emacs-lisp-mode-hook 'outline-minor-mode)
        (add-hook 'LaTeX-mode-hook 'outline-minor-mode)
        :config
        (progn
          (setq outshine-use-speed-commands t)

          ;; Mirror the default org-mode behavior in `outline-minor-mode-map'
          (bind-keys
           :map outline-minor-mode-map
           ("<backtab>" . outshine-cycle-buffer) ; global cycle using S-TAB
           ("M-p"       . outline-previous-visible-heading)
           ("M-n"       . outline-next-visible-heading)
           ("<M-up>"    . outline-move-subtree-up)
           ("<M-down>"  . outline-move-subtree-down)
           ("<M-left>"  . outline-promote)
           ("<M-right>" . outline-demote))))

        )

  (defun outshine/navi-mode ()
      (use-package navi-mode
        :defer t))
  "The list of Lisp packages required by the outshine layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format"


;;; packages.el ends here
