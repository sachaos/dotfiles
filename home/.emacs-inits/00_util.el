;; for google-translate
(custom-set-variables
 '(google-translate-default-source-language "en")
 '(google-translate-default-target-language "ja")
 '(enh-ruby-add-encoding-comment-on-save nil)
 '(enh-ruby-deep-indent-paren nil)
 '(global-linum-mode t)
 '(projectile-use-git-grep t)
 '(vc-follow-symlinks t)
 '(groovy-indent-offset 2)
 )

;; mode-line view setting
(setq powerline-default-separator 'bar)
(setq dotspacemacs-mode-line-unicode-symbols nil)

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

(require 'org-table)

;; table settings
(defun cleanup-org-tables ()
  (save-excursion
    (goto-char (point-min))
    (while (search-forward "-+-" nil t) (replace-match "-|-"))))
(add-hook 'markdown-mode-hook 'orgtbl-mode)
(add-hook 'markdown-mode-hook
          #'(lambda()
              (add-hook 'after-save-hook 'cleanup-org-tables  nil 'make-it-local)))

;; disable auto magic comment on ruby-mode
(defun ruby-mode-set-encoding () nil)

;; string inflection setting
(require 'string-inflection)
(global-set-key (kbd "C-c C-u") 'string-inflection-all-cycle)

(add-hook 'markdown-mode-hook
          #'(lambda()
              (local-set-key (kbd "C-c C-u") 'string-inflection-all-cycle)))

;; ruby-block
(require 'ruby-block)

(ruby-block-mode t)
(setq ruby-block-highlight-toggle t)

;; key binds
(define-key evil-normal-state-map (kbd "O") (lambda ()
                                              (interactive)
                                              (evil-open-below 1)
                                              (evil-force-normal-state)))
