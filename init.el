;; ╭────────────────────────────────────────────────────────────────────────────────────────────────╮
;; │ Created:            01/16/2024                                                                 │
;; │ Updated:            01/16/2024 09:30                                                           │
;; │ Author:             Ritchie                                                                    │
;; │ Description:        Minimal config for testing.                                                │
;; ╰────────────────────────────────────────────────────────────────────────────────────────────────╯
;;[=========================== Garbage Collection ===========================]

(defun efs/display-startup-time ()
  (message "Emacs loaded in %s with %d garbage collections!!!"
  (format "%.2f seconds"
  (float-time
  (time-subtract after-init-time before-init-time)))
  gcs-done))
(add-hook 'emacs-startup-hook #'efs/display-startup-time)

;; Load modules from init/
(add-to-list 'load-path (expand-file-name "init/" user-emacs-directory))

;; More verbose
(if init-file-debug
      (setq use-package-verbose t
            use-package-expand-minimally nil
            use-package-compute-statistics t
            debug-on-error t)
    (setq use-package-verbose nil
          use-package-expand-minimally t))

;;[=============================== VARIABLES ================================]

;; Set keyboard layout to US standard English
(set-language-environment "English")
(setq default-input-method "us")
;; see Utf-8 encoding in emacs.org
(prefer-coding-system 'utf-8)
(set-language-environment "UTF-8")

(setq org-directory (expand-file-name "org/" user-emacs-directory))

;;[================================ MODULES =================================]
;; Put code here or load it with require.
(require 'straight-init)
;;(straight-use-package '(org :type built-in)) ;; Use org built in package don't clone it.
(use-package org :straight t :demand t)
(require 'evil-min)
(require 'org-roam-init)

