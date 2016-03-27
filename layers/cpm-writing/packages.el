;;; packages.el --- cpm-writing layer packages file for Spacemacs.
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
;; added to `cpm-writing-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `cpm-writing/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `cpm-writing/pre-init-PACKAGE' and/or
;;   `cpm-writing/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst cpm-writing-packages
  '(centered-window-mode wc-goal-mode))

  (defun cpm-writing/init-centered-window-mode ()
    (use-package centered-window-mode
      :defer t
      :diminish centered-window-mode
      :commands distraction-free
      :config
      (progn 
        (setq cwm-centered-window-width 90)
        (spacemacs/set-leader-keys "od" 'distraction-free)))
    )

  (defun cpm-writing/init-wc-goal-mode ()
    (use-package wc-goal-mode
      :defer t
      :config
      (setq wc-goal-modeline-format "|%tw|")
      (spacemacs/set-leader-keys "tW" 'wc-goal-mode)
      ))

  (defun distraction-free ()
    "distraction free writing"
    (interactive)
    (centered-window-mode) (wc-goal-mode) (spacemacs/toggle-version-control-margin-off) (linum-mode 0) (toggle-frame-fullscreen) (visual-line-mode))

;;; packages.el ends here
