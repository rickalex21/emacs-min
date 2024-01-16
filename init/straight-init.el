;;                           ____ _____ ____      _    ___ ____ _   _ _____
;;                          / ___|_   _|  _ \    / \  |_ _/ ___| | | |_   _|
;;                          \___ \ | | | |_) |  / _ \  | | |  _| |_| | | |
;;                           ___) || | |  _ <  / ___ \ | | |_| |  _  | | |
;;                          |____/ |_| |_| \_\/_/   \_\___\____|_| |_| |_|
;;
;;╭────────────────────────────────────────────────────────────────────────────────────────────────╮
;;│ Created:            03/22/2023                                                                 │
;;│ Updated:            04/07/2023 09:37                                                           │
;;│ Author:             Ritchie                                                                    │
;;│ Description:        Package Manager                                                            │
;;╰────────────────────────────────────────────────────────────────────────────────────────────────╯
;; Some config from: https://github.com/abougouffa/minemacs.git

(setq
  ;;Set `use-package' when it's started in verbose mode
  use-package-verbose t
  ;;Defer loading packages by default, use `:demand' to force loading a package
  use-package-always-defer t
  ;; Don't uncomment will break things.
  ;;straight-use-package-by-default t
  straight-base-dir (expand-file-name  ".cache/" user-emacs-directory)
  ;; Add Emacs version and the Git hash to the build directory to avoid problems
  straight-build-dir (format "build-%s%s" emacs-version
                              (if emacs-repository-version
                                (format "-%s" (substring emacs-repository-version 0 8)) ""))
 straight-repository-branch "develop"
 ;; Do not clone all project history, just the last worktree (--depth 1)
 straight-vc-git-default-clone-depth '(1 single-branch)
 ;; Do not slow startup by checking for package modifs, check only on demand
 straight-check-for-modifications '(check-on-save find-when-checking))

;; Bootstraping straight.el
(defvar bootstrap-version)
(let ((bootstrap-file (concat straight-base-dir "straight/repos/straight.el/bootstrap.el"))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Added by me
(straight-use-package 'use-package)

(provide 'straight-init)
