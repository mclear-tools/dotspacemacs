;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

;; * Dotspacemacs Layers

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; (default nil)
   dotspacemacs-enable-lazy-installation nil
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '("~/.spacemacs.d/layers")
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     spacemacs-helm
     auto-completion
     ;; better-defaults
     (colors :variables
             colors-enable-rainbow-identifiers t)
     deft
     emacs-lisp
     (geolocation :variables
                  geolocation-enable-osx-location-service-support t
                  geolocation-enable-weather-forecast t
                  geolocation-enable-automatic-theme-changer nil)
     html
     (git :variables
          git-gutter-use-fringe t)
     latex
     markdown
     org
     osx
     pandoc
     pdf-tools
     (ranger :variables
             ranger-override-dired t
             ranger-show-preview t
             ranger-cleanup-eagerly t
             ranger-show-dotfiles t
             ranger-ignored-extensions '("mkv" "iso" "mp4")
             ranger-dont-show-binary t
             ranger-max-preview-size 20
             )
     (shell :variables
            shell-default-term-shell "/usr/local/bin/zsh"
            shell-default-height 30
            shell-default-shell 'ansi-term
            shell-default-position 'bottom)
     shell-scripts
     spacemacs-layouts
     (spell-checking :variables
                     spell-checking-enable-by-default nil)
     syntax-checking
     themes-megapack
     theming
     version-control
     yaml

     ;; Private layers (in "mylayers")
     cpm-writing
     helm-bibtex
     outshine
     sr-speedbar
     )
   
;; ** Additional Packages
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
                                      gruvbox-theme
                                      org-pdfview
                                      )

;; ** Excluded Packages
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

;; * Dotspacemacs Init

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. (default t)
   dotspacemacs-check-for-update t
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'nil
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; Number of recent files to show in the startup buffer. Ignored if
   ;; `dotspacemacs-startup-lists' doesn't include `recents'. (default 5)
   dotspacemacs-startup-recent-list-size 5
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         colorsarenice-dark
                         gruvbox
                         solarized-light
                         solarized-dark
                         leuven
                         monokai
                         zenburn)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Inconsolata LGC"
                               :size 12
                               :weight normal
                               :width normal
                               :powerline-scale 1.2)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

;; * Dotspacemacs User Init

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init'.  You are free to put almost
any user code here.  The exception is org related code, which should be placed
in `dotspacemacs/user-config'."

;; ** User info
  (setq user-full-name "Colin McLear"
        user-mail-address "mclear@fastmail.com")


;; ** Frame startup size and position
;; *** Set Frame width/height
  (setq default-frame-alist
        '((top . 25) (left . 275) (width . 105) (height . 60)))

;; *** Name Frame
  (setq frame-title-format
        '(" "
          (buffer-file-name "%f"
                            (dired-directory dired-directory "%b"))))

  )

;; * Dotspacemacs User Config

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration. You are free to put any user code."

;; ** Backups
  (setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
  (setq make-backup-files t               ; backup of a file the first time it is saved.
        backup-by-copying t               ; don't clobber symlinks
        version-control t                 ; version numbers for backup files
        delete-old-versions t             ; delete excess backup files silently
        delete-by-moving-to-trash t
        kept-old-versions 6               ; oldest versions to keep when a new numbered backup is made
        kept-new-versions 9               ; newest versions to keep when a new numbered backup is made
        auto-save-default t               ; auto-save every buffer that visits a file
        auto-save-timeout 20              ; number of seconds idle time before auto-save (default: 30)
        auto-save-interval 200            ; number of keystrokes between auto-saves (default: 300)
        )

  (defun full-auto-save ()
    (interactive)
    (save-excursion
      (dolist (buf (buffer-list))
        (set-buffer buf)
        (if (and (buffer-file-name) (buffer-modified-p))
            (basic-save-buffer)))))
  (add-hook 'auto-save-hook 'full-auto-save)

  ;; Keep all backup and auto-save files in one directory
  (setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
  (setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))


;; ** Keybindings
  (spacemacs/set-leader-keys
    "fl" 'helm-locate
    "fL" 'find-file-literally
    "om" 'cpm/org-to-markdown
    "oo" 'cpm/markdown-to-org
    "os" 'sb-expand-current-file
    "oS" 'just-one-space
    "oC" 'centered-cursor-mode
    "oc" 'centered-window-mode
    "od" 'distraction-free
    "oD" 'osx-dictionary-search-input
    "ou" 'paradox-upgrade-packages
    "op" 'pandoc-convert-to-pdf
    "ow" 'count-words
    "te" 'toggle-indicate-empty-lines
    "wv" 'split-window-right-and-focus
    "wV" 'evil-window-vsplit
    "asm" 'multi-term
    "["  'spacemacs/previous-useful-buffer
    "]"  'spacemacs/next-useful-buffer
    )

;; ** Modeline
  (setq spaceline-buffer-encoding-abbrev-p nil
        spaceline-line-column-p nil
        spaceline-buffer-id-p nil
        ;; spaceline-minor-modes-separator "|"
        display-time-format "%a %b %d | %H:%M |")
        (setq powerline-default-separator 'slant)
        (setq spaceline-separator-dir-left '(right . right))
        (setq spaceline-separator-dir-right '(right . right))
  (display-time-mode)
  ;; fancy git icon for the modeline
  (defadvice vc-mode-line (after strip-backend () activate)
    (when (stringp vc-mode)
      (let ((gitlogo (replace-regexp-in-string "^ Git." ":" vc-mode)))
        (setq vc-mode gitlogo))))

;; ** Text settings

  (add-hook 'text-mode-hook
            '(lambda()
               (turn-on-auto-fill) (set-fill-column 80) (flyspell-mode 1)))
  (add-hook 'org-mode-hook
            '(lambda()
               (turn-on-auto-fill) (org-indent-mode) (set-fill-column 80) (flyspell-mode 1) (hl-todo-mode) (global-git-gutter+-mode 0)))
  (add-hook 'markdown-mode-hook
            '(lambda()
               (turn-on-auto-fill) (centered-cursor-mode) (set-fill-column 80) (flyspell-mode 1) (pandoc-mode) (hl-todo-mode) (global-git-gutter+-mode t)))
  (add-hook 'pandoc-mode-hook 'pandoc-load-default-settings)
  (setq pandoc-data-dir "~/.spacemacs.d/pandoc-mode/")
  ;; visual line mode (add-hook 'text-mode-hook 'turn-on-visual-line-mode)

;; ** Other settings
  (setq org-hide-emphasis-markers t  ;; hide markers
        org-pretty-entities t ;; make latex look good
        org-fontify-quote-and-verse-blocks t ;; make quotes stand out
        org-table-export-default-format "orgtbl-to-csv" ;; export for org-tables to csv
        org-ellipsis "↴"
        )
;; *** Visual line navigation
  ;; navigate using visual lines rather than true lines
  (define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
  (define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

;; *** Vi-fringe
  ;; Turn off the tildes in the fringe
  (global-vi-tilde-fringe-mode -1)

;; *** Line wrap
  (global-visual-line-mode)
  (diminish 'visual-line-mode)

;; *** Evil-normal-state is preferred
  (run-with-idle-timer 15 t 'evil-normal-state)

;; *** Diminish
  (eval-after-load "pandoc-mode" '(diminish 'pandoc-mode "Ⓟ"))

;; *** Shell
  (defadvice term-handle-exit
      (after term-kill-buffer-on-exit activate)
    (kill-buffer))
;; ** Functions
;; *** Org-Markdown
  (defun cpm/org-to-markdown ()
    "convert clipboard contents from org to markdown and paste"
    (interactive)
    (kill-new (shell-command-to-string "osascript -e 'the clipboard as unicode text' | pandoc -f org -t markdown"))
    (yank))

  (defun cpm/markdown-to-org ()
    "convert clipboard contents from markdown to org and paste"
    (interactive)
    (kill-new (shell-command-to-string "osascript -e 'the clipboard as unicode text' | pandoc -f markdown -t org"))
    (yank))

;; *** PDF Functions

        (defun mwp/pdf-multi-extract (sources)
      "Helper function to print highlighted text from a list of pdf's, with one org header per pdf, 
      and links back to page of highlight."
      (let (
            (output ""))
        (dolist (thispdf sources)
          (setq output (concat output (pdf-annot-markups-as-org-text thispdf nil level ))))
        (princ output))
      )

      (defun cpm/pdf-summary-extract (sources)
      "Helper function to print underlined text from a list of pdf's, with one org header per pdf, 
      and links back to page of highlight."
      (let (
            (output ""))
        (dolist (thispdf sources)
          (setq output (concat output (pdf-annot-summary-as-org-text thispdf nil level ))))
        (princ output))
      )

      ;; this is stolen from https://github.com/pinguim06/pdf-tools/commit/22629c746878f4e554d4e530306f3433d594a654
      (defun pdf-annot-edges-to-region (edges)
      "Attempt to get 4-entry region \(LEFT TOP RIGHT BOTTOM\) from several edges.
      We need this to import annotations and to get marked-up text, because annotations
      are referenced by its edges, but functions for these tasks need region."

      (let ((left0 (nth 0 (car edges)))
            (top0 (nth 1 (car edges)))
            (bottom0 (nth 3 (car edges)))
            (top1 (nth 1 (car (last edges))))
            (right1 (nth 2 (car (last edges))))
            (bottom1 (nth 3 (car (last edges))))
            (n (safe-length edges)))
        ;; we try to guess the line height to move
        ;; the region away from the boundary and
        ;; avoid double lines
        (list left0
              (+ top0 (/ (- bottom0 top0) 2))
              right1
              (- bottom1 (/ (- bottom1 top1) 2 )))))

      (defun pdf-annot-markups-as-org-text (pdfpath &optional title level)
      "Acquire highligh annotations as text, and return as org-heading"

      (interactive "fPath to PDF: ")  
      (let* ((outputstring "") ;; the text to be returned
              (title (or title (replace-regexp-in-string "-" " " (file-name-base pdfpath ))))
              (level (or level (1+ (org-current-level)))) ;; I guess if we're not in an org-buffer this will fail
              (levelstring (make-string level ?*)) ;; set headline to proper level
              (annots (sort (pdf-info-getannots nil pdfpath)  ;; get and sort all annots
                            'pdf-annot-compare-annotations)))
        ;; create the header
        (setq outputstring (concat levelstring " Quotes From " title "\n\n")) ;; create heading

        ;; extract text
        (mapc
          (lambda (annot) ;; traverse all annotations
            (if (eq 'highlight (assoc-default 'type annot))
                (let* ((page (assoc-default 'page annot))
                      ;; use pdf-annot-edges-to-region to get correct boundaries of annotation
                      (real-edges (pdf-annot-edges-to-region
                                    (pdf-annot-get annot 'markup-edges)))
                      (text (or (assoc-default 'subject annot) (assoc-default 'content annot)
                                (replace-regexp-in-string "\n" " " (pdf-info-gettext page real-edges nil pdfpath))))

                      (height (nth 1 real-edges)) ;; distance down the page
                      ;; use pdfview link directly to page number
                      (linktext (concat "[[pdfview:" pdfpath "::" (number-to-string page) 
                                        "++" (number-to-string height) "][" title  "]]" )))
                  (setq outputstring (concat outputstring text " ("
                                            linktext ", " (number-to-string page) ")\n\n"))
                  ))

            (if (eq 'text (assoc-default 'type annot))
                (let* ((page (assoc-default 'page annot))
                      ;; use pdf-annot-edges-to-region to get correct boundaries of annotation
                      (real-edges (pdf-annot-edges-to-region
                                    (pdf-annot-get annot 'markup-edges)))
                      (text (or (assoc-default 'subject annot) (assoc-default 'content annot)
                                (replace-regexp-in-string "\n" " " (pdf-info-gettext page real-edges nil pdfpath))))

                      (height (nth 1 real-edges)) ;; distance down the page
                      ;; use pdfview link directly to page number
                      (linktext (concat "[[pdfview:" pdfpath "::" (number-to-string page) 
                                        "++" (number-to-string height) "][" title  "]]" )))
                  (setq outputstring (concat outputstring text " ("
                                            linktext ", " (number-to-string page) ")\n\n"))
                  ))

              (if (eq 'underline (assoc-default 'type annot))
                  (let* ((page (assoc-default 'page annot))
                        ;; use pdf-annot-edges-to-region to get correct boundaries of highlight
                        (real-edges (pdf-annot-edges-to-region
                                      (pdf-annot-get annot 'markup-edges)))
                        (text (or (assoc-default 'subject annot) (assoc-default 'content annot)
                                  (replace-regexp-in-string "\n" " " (pdf-info-gettext page real-edges nil pdfpath))))

                        (height (nth 1 real-edges)) ;; distance down the page
                        ;; use pdfview link directly to page number
                        (linktext (concat "[[pdfview:" pdfpath "::" (number-to-string page) 
                                          "++" (number-to-string height) "][" title  "]]" )))
                    (setq outputstring (concat outputstring text " ("
                                              linktext ", " (number-to-string page) ")\n\n"))
                    ))
                  )
          annots)
        outputstring ;; return the header
        )
      )

      (defun pdf-annot-summary-as-org-text (pdfpath &optional title level)
      "Acquire underlined annotations as text, and return as org-heading"

      (interactive "fPath to PDF: ")  
      (let* ((outputstring "") ;; the text to be returned
              (title (or title (replace-regexp-in-string "-" " " (file-name-base pdfpath ))))
              (level (or level (1+ (org-current-level)))) ;; I guess if we're not in an org-buffer this will fail
              (levelstring (make-string level ?*)) ;; set headline to proper level
              (annots (sort (pdf-info-getannots nil pdfpath)  ;; get and sort all annots
                            'pdf-annot-compare-annotations)))
        ;; create the header
        (setq outputstring (concat levelstring " Summary from " title "\n\n")) ;; create heading

        ;; extract text
        (mapc
          (lambda (annot) ;; traverse all annotations
              (if (eq 'underline (assoc-default 'type annot))
                  (let* ((page (assoc-default 'page annot))
                        ;; use pdf-annot-edges-to-region to get correct boundaries of annotation
                        (real-edges (pdf-annot-edges-to-region
                                      (pdf-annot-get annot 'markup-edges)))
                        (text (or (assoc-default 'subject annot) (assoc-default 'content annot)
                                  (replace-regexp-in-string "\n" " " (pdf-info-gettext page real-edges nil pdfpath))))

                        (height (nth 1 real-edges)) ;; distance down the page
                        ;; use pdfview link directly to page number
                        (linktext (concat "[[pdfview:" pdfpath "::" (number-to-string page) 
                                          "++" (number-to-string height) "][" title  "]]" )))
                    (setq outputstring (concat outputstring text " ("
                                              linktext ", " (number-to-string page) ")\n\n"))
                    ))
                  )
          annots)
        outputstring ;; return the header
        )
      )

  ;; ** Test code

  )

;; * Dotspacemacs Custom

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(paradox-github-token t)
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
)
