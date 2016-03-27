;;; packages.el --- speedbar layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Roambot <Roambot@MacBook-Pro.local>
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
;; added to `speedbar-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `speedbar/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `speedbar/pre-init-PACKAGE' and/or
;;   `speedbar/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst speedbar-packages '()
(use-package sr-speedbar
    :defer t
    :init
      (setq sr-speedbar-width 60)
      (setq sr-speedbar-max-width 60)
      (setq sr-speedbar-right-side nil)
    :config
      (setq speedbar-hide-button-brackets-flag t
            speedbar-show-unknown-files t
            speedbar-directory-button-trim-method 'trim
            speedbar-use-images nil
            speedbar-indentation-width 2
            speedbar-use-imenu-flag t
            speedbar-tag-hierarchy-method nil  ;; No grouping
            speedbar-file-unshown-regexp "flycheck-.*"
            speedbar-smart-directory-expand-flag t)
      ;; Add markdown support
      (setq speedbar-directory-unshown-regexp "^\\(CVS\\|RCS\\|SCCS\\|\\.\\.*$\\)\\'")
      (speedbar-add-supported-extension ".md")
      (evilified-state-evilify-map speedbar-mode-map)
      ;; toggle function
      (spacemacs/set-leader-keys "ft" 'spacemacs/sr-speedbar-show-or-hide)
      ;; More familiar keymap settings.
      (add-hook 'speedbar-reconfigure-keymaps-hook
          '(lambda ()
              (define-key speedbar-mode-map [tab] 'speedbar-toggle-line-expansion)
              (define-key speedbar-mode-map [return] 'speedbar-edit-line-and-switch-to-window)))

      ;; Toggle speedbar
      (defun sr-speedbar/post-init-sr-speedbar ()
        (defun spacemacs/sr-speedbar-show-or-hide ()
          (interactive)
          (cond ((sr-speedbar-exist-p) (kill-buffer speedbar-buffer))
                (t (sr-speedbar-open) (linum-mode -1) (speedbar-refresh)))))

      ;; Auto expand
      (defun sb-expand-current-file ()
        "Expand current file in speedbar buffer"
        (interactive)
        (setq current-file (buffer-file-name))
        (sr-speedbar-toggle)
        (speedbar-find-selected-file current-file)
        (speedbar-toggle-line-expansion))

      ;; Switch to window
      (defun speedbar-edit-line-and-switch-to-window ()
        (interactive)
        (speedbar-edit-line)
        (other-window 1))

      ;; keybinding
        ;; (spacemacs/set-leader-keys "os" 'sr-speedbar-toggle)
        (spacemacs/set-leader-keys "os" 'sb-expand-current-file)
        (bind-key "s-e" 'sr-speedbar-toggle)
        ))


;;; packages.el ends here
