;;; packages.el --- helm-bibtex Layer packages File for Spacemacs
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
(setq helm-bibtex-packages
      '(helm-bibtex))

;; List of packages to exclude.
(setq helm-bibtex-excluded-packages '())

;; For each package, define a function helm-bibtex/init-<package-name>
;;
(defun helm-bibtex/init-helm-bibtex ()

(use-package helm-bibtex
  :defer t
  :config
  (setq helm-bibtex-bibliography '("/Users/Roambot/Dropbox/Work/Master.bib")
        helm-bibtex-library-path '("/Users/Roambot/Dropbox/Work/MasterLib/")
        helm-bibtex-notes-path "/Users/Roambot/Dropbox/Work/MasterLib/BibNotes/"
        helm-bibtex-notes-extension ".org"
        helm-bibtex-full-frame nil
        helm-bibtex-pdf-field "file"
        helm-bibtex-additional-search-fields '(keywords)) ;; search keywords field
  ;; Set insert citekey with markdown citekeys for org-mode
  (setq helm-bibtex-format-citation-functions
         '((org-mode      . helm-bibtex-format-citation-pandoc-citeproc)
          (latex-mode    . helm-bibtex-format-citation-cite)
          (markdown-mode . helm-bibtex-format-citation-pandoc-citeproc)
          (default       . helm-bibtex-format-citation-default)))

  ;; Set default action for helm-bibtex as inserting pandoc citation
  (helm-delete-action-from-source "Insert citation" helm-source-bibtex)
  (helm-add-action-to-source "Insert citation"
  'helm-bibtex-insert-citation helm-source-bibtex 0)

  (setq helm-bibtex-pdf-symbol "⌘")
  (setq helm-bibtex-notes-symbol "✎")

  ;; Set global shortcut for calling helm-bibtex
  (global-set-key (kbd "C-c r") 'helm-bibtex)
  (spacemacs/set-leader-keys "ox" 'helm-bibtex)
  )

   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
