;;; packages.el --- sr-speedbar Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2014 Sylvain Benner
;; Copyright (c) 2014-2015 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; List of all packages to install and/or initialize. Built-in packages
;; which require an initialization must be listed explicitly in the list.
(setq sr-speedbar-packages
    '(sr-speedbar))


(defun sr-speedbar/init-sr-speedbar ()
  (use-package sr-speedbar
    :defer t
    :init
    ;; (require 'speedbar)
    (setq sr-speedbar-width 60)
    (setq sr-speedbar-max-width 60)
    (setq sr-speedbar-right-side nil)
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
    (speedbar-add-supported-extension ".org")
    (evilified-state-evilify-map speedbar-mode-map)
    ;; toggle function
    (spacemacs/set-leader-keys "ft" 'sr-speedbar-toggle)
    ;; More familiar keymap settings.
    (add-hook 'speedbar-reconfigure-keymaps-hook
            '(lambda ()
                (define-key speedbar-mode-map [tab] 'speedbar-toggle-line-expansion)
                (define-key speedbar-mode-map [return] 'speedbar-edit-line-and-switch-to-window)))


    ))

;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
