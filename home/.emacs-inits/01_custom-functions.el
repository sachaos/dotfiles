(defun helm-projectile-grep-or-ack (&optional dir use-ack-p ack-ignored-pattern ack-executable)
  "Perform helm-grep at project root.
DIR directory where to search
USE-ACK-P indicates whether to use ack or not.
ACK-IGNORED-PATTERN is a file regex to exclude from searching.
ACK-EXECUTABLE is the actual ack binary name.
It is usually \"ack\" or \"ack-grep\".
If it is nil, or ack/ack-grep not found then use default grep command."
  (let* ((default-directory (or dir (projectile-project-root)))
         (helm-ff-default-directory default-directory)
         (follow (and helm-follow-mode-persistent
                      (assoc-default 'follow helm-source-grep)))
         (helm-grep-in-recurse t)
         (helm-grep-ignored-files (cl-union (projectile-ignored-files-rel)  grep-find-ignored-files))
         (helm-grep-ignored-directories
          (cl-union (mapcar 'directory-file-name (projectile-ignored-directories-rel))
                    grep-find-ignored-directories))
         (helm-grep-default-command (if use-ack-p
                                        (concat ack-executable " -H --no-group --no-color " ack-ignored-pattern " %p %f")
                                      (if (and projectile-use-git-grep (eq (projectile-project-vcs) 'git))
                                          "git --no-pager grep --no-color -n%c -e %p -- %f"
                                        "grep -a -r %e -n%cH -e %p %f .")))
         (helm-grep-default-recurse-command helm-grep-default-command))
    (message "helm-projectile-grep-or-ack called")

    (setq helm-source-grep
          (helm-build-async-source
              (capitalize (helm-grep-command t))
            :header-name (lambda (name)
                           (let ((name (if use-ack-p
                                           "Helm Projectile Ack"
                                         "Helm Projectile Grep")))
                             (concat name " " "(C-c ? Help)")))
            :candidates-process 'helm-grep-collect-candidates
            :filter-one-by-one 'helm-grep-filter-one-by-one
            :candidate-number-limit 9999
            :nohighlight t
            ;; We need to specify keymap here and as :keymap arg [1]
            ;; to make it available in further resuming.
            :keymap helm-grep-map
            :history 'helm-grep-history
            :action (apply #'helm-make-actions helm-projectile-grep-or-ack-actions)
            :persistent-action 'helm-grep-persistent-action
            :persistent-help "Jump to line (`C-u' Record in mark ring)"
            :requires-pattern 2))
    (helm
     :sources 'helm-source-grep
     :input (when helm-projectile-set-input-automatically
              (if (region-active-p)
                  (buffer-substring-no-properties (region-beginning) (region-end))
                  ""))
     :buffer (format "*helm %s*" (if use-ack-p
                                     "ack"
                                   "grep"))
     :default-directory default-directory
     :keymap helm-grep-map
     :history 'helm-grep-history
     :truncate-lines t)))
