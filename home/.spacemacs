;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     php
     csv
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     auto-completion
     ;; better-defaults
     dash
     emacs-lisp
     git
     github
     markdown
     (ruby :variables
           ruby-enable-enh-ruby-mode t)
     ruby-on-rails
     elixir
     erlang
     python
     lua
     go
     yaml
     haskell
     syntax-checking
     (html :variables
           web-mode-css-indent-offset 2
           web-mode-markup-indent-offset 2)
     (javascript :variables
                 js2-basic-offset 2)
     react
     shell-scripts
     ;; org
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     ;; spell-checking
     ;; syntax-checking
     ;; version-control
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages
   '(
     nginx-mode
     dash
     s
     orgtbl-mode
     )
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

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
   dotspacemacs-editing-style 'hybrid
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
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
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light
                         solarized-light
                         solarized-dark
                         leuven
                         monokai
                         zenburn)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
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
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; (Not implemented) dotspacemacs-distinguish-gui-ret nil
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
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
   dotspacemacs-enable-paste-micro-state nil
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
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
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

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  (add-to-list 'package-archives
               '("melpa" . "https://melpa.org/packages/"))
  (when (< emacs-major-version 24)
    (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

  ;; for google-translate
  (custom-set-variables
   '(google-translate-default-source-language "en")
   '(google-translate-default-target-language "ja")
   '(enh-ruby-add-encoding-comment-on-save nil)
   '(enh-ruby-deep-indent-paren nil)
   '(global-linum-mode t)
   '(projectile-use-git-grep t)
   '(vc-follow-symlinks t)
   )

  ;; keybindings
  (define-key key-translation-map (kbd "C-h") (kbd "<DEL>"))
  (define-key key-translation-map (kbd "C-_") (kbd "C-h"))

  ;; markdown
  ;; header to list
  (defun head2list/prefix-count (prefix string &optional count)
    (setq count (or count 0))
    (if (string-prefix-p prefix string)
        (head2list/prefix-count prefix (string-remove-prefix prefix string) (+ count 1))
      count))

  (defun head2list/indent-level (string)
    (head2list/prefix-count "  " string))

  (defun head2list/header-level (string)
    (head2list/prefix-count "#" string))

  (defun head2list/list-format-p (string)
    "judge whether given string is list format or not"
    (s-matches-p "^[[:blank:]]*\\*[[:blank:]].*" string))

  (defun head2list/header-format-p (string)
    "judge whether given string is header format or not"
    (s-matches-p "^#+[[:blank:]].*" string))

  (defun head2list/extract-list-title (string)
    (nth 1 (s-match "^[[:blank:]]*\\*[[:blank:]]\\(.*\\)" string)))

  (defun head2list/extract-header-title (string)
    (nth 1 (s-match "^#+[[:blank:]]\\(.*\\)" string)))

  (defun head2list/list2header-string (string)
    (cond ((head2list/list-format-p string)
           (let
               ((level (head2list/indent-level string))
                (title (head2list/extract-list-title string)))
             (s-concat (s-repeat (+ level 1) "#") " " title)))
          nil))

  (defun head2list/header2list-string (string)
    (cond ((head2list/header-format-p string)
           (let
               ((level (head2list/header-level string))
                (title (head2list/extract-header-title string)))
             (s-concat (s-repeat (- level 1) "  ") "* " title)))
          nil))

  (defun head2list/list2header (text)
    (s-join "\n\n" (-non-nil (-map `head2list/list2header-string (s-lines text)))))

  (defun head2list/header2list (text)
    (s-join "\n" (-non-nil (-map `head2list/header2list-string (s-lines text)))))

  (defun head2list/transform (text)
      (if (head2list/list-format-p (car (s-lines text)))
          (head2list/list2header text)
        (head2list/header2list text)))

  (defun head2list/transform-region (start end)
    (interactive "r")
    (let ((text (buffer-substring start end)))
      (goto-char start)
      (insert (s-concat (head2list/transform text) "\n\n"))))

  ;; add .zshrc files to auto-mode-alist
  (dolist (pattern '("\\.zshrc.custom\\'"
                     "\\.zshrc.alias\\'"
                     "\\.zshrc.linux\\'"
                     "\\.zshrc.osx\\'"))
    (add-to-list 'auto-mode-alist (cons pattern 'sh-mode)))

  (dolist (pattern '("\\.schema\\'"))
    (add-to-list 'auto-mode-alist (cons pattern 'ruby-mode)))

  ;; CUA OS copypasta even in ncurses mode
  (case system-type
    ('darwin (defun copy-from-osx ()
               (shell-command-to-string "pbpaste"))

             (defun paste-to-osx (text &optional push)
               (let ((process-connection-type nil))
                 (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
                   (process-send-string proc text)
                   (process-send-eof proc))))

             (setq interprogram-cut-function 'paste-to-osx)
             (setq interprogram-paste-function 'copy-from-osx))
    ('gnu/linux (progn
                  (setq x-select-enable-clipboard t)
                  (defun xsel-cut-function (text &optional push)
                    (with-temp-buffer
                      (insert text)
                      (call-process-region (point-min) (point-max) "xsel" nil 0 nil "--clipboard" "--input")))
                  (defun xsel-paste-function()

                    (let ((xsel-output (shell-command-to-string "xsel --clipboard --output")))
                      (unless (string= (car kill-ring) xsel-output)
                        xsel-output )))
                  (setq interprogram-cut-function 'xsel-cut-function)
                  (setq interprogram-paste-function 'xsel-paste-function))))

  ;; insert date and time
  (defvar current-date-format "%Y/%m/%d"
    "Format of date to insert with `insert-current-date' func
See help of `format-time-string' for possible replacements")

  (defvar current-time-format "%H:%M:%S"
    "Format of date to insert with `insert-current-time' func.
Note the weekly scope of the command's precision.")

  (defvar current-date-time-format "%Y/%m/%d %H:%M:%S"
    "Format of datetime to insert with `insert-current-date-time' func.")

  (defun insert-current-date ()
    "insert the current date and time into current buffer.
Uses `current-date-format' for the formatting the date/time."
    (interactive)
    (insert (format-time-string current-date-format (current-time)))
    (insert "\n")
    )

  (defun insert-current-time ()
    "insert the current time (1-week scope) into the current buffer."
    (interactive)
    (insert (format-time-string current-time-format (current-time)))
    (insert "\n")
    )

  (defun insert-current-date-time ()
    "insert the current date and time into current buffer.
Uses `current-date-time-format' for the formatting the date/time"
    (interactive)
    (insert (format-time-string current-date-time-format (current-time)))
    (insert "\n")
    )

  ;; table settings
  (defun cleanup-org-tables ()
    (save-excursion
      (goto-char (point-min))
      (while (search-forward "-+-" nil t) (replace-match "-|-"))))
  (add-hook 'markdown-mode-hook 'orgtbl-mode)
  (add-hook 'markdown-mode-hook
            #'(lambda()
                (add-hook 'after-save-hook 'cleanup-org-tables  nil 'make-it-local)))
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(enh-ruby-add-encoding-comment-on-save nil)
 '(enh-ruby-deep-indent-paren nil)
 '(global-linum-mode t)
 '(google-translate-default-source-language "en")
 '(google-translate-default-target-language "ja")
 '(package-selected-packages
   (quote
    (go-eldoc company-go go-mode lua-mode zeal-at-point yaml-mode ws-butler window-numbering which-key web-mode web-beautify volatile-highlights vi-tilde-fringe use-package tagedit spacemacs-theme spaceline smooth-scrolling smeargle slim-mode shm scss-mode sass-mode rvm ruby-tools ruby-test-mode ruby-end rubocop rspec-mode robe restart-emacs rbenv rainbow-delimiters quelpa pyvenv pytest pyenv-mode py-yapf projectile-rails popwin pip-requirements persp-mode paradox page-break-lines orgit open-junk-file nginx-mode neotree move-text mmm-mode markdown-toc magit-gitflow magit-gh-pulls macrostep lorem-ipsum linum-relative leuven-theme less-css-mode json-mode js2-refactor js-doc jade-mode info+ indent-guide ido-vertical-mode hy-mode hungry-delete hl-todo hindent highlight-parentheses highlight-numbers highlight-indentation help-fns+ helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-dash helm-css-scss helm-company helm-c-yasnippet helm-ag haskell-snippets google-translate golden-ratio github-clone github-browse-file gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gist gh-md flycheck-pos-tip flycheck-haskell flx-ido fill-column-indicator feature-mode fancy-battery expand-region exec-path-from-shell evil-visualstar evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-args evil-anzu eval-sexp-fu enh-ruby-mode emmet-mode elisp-slime-nav define-word cython-mode company-web company-tern company-statistics company-quickhelp company-ghc company-cabal company-anaconda coffee-mode cmm-mode clean-aindent-mode chruby bundler buffer-move bracketed-paste auto-yasnippet auto-highlight-symbol auto-compile alchemist aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(projectile-use-git-grep t)
 '(vc-follow-symlinks t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
