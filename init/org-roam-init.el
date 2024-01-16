;;README: 01/16/2024 This is a modified version of org roam to troubleshoot md-roam
(use-package md-roam
  :straight (:host github :repo "nobiot/md-roam")
  ;;:after org-roam
  ;;:disabled t
  :init
   (setq md-roam-regex-tags-zettlr-style "\\([[,]+[ ]?\\)\\([[:alnum:]_-]+\\)[] ]?")
  :config
  (setq md-roam-file-extension "md")
  (md-roam-mode 1))

(use-package org-roam
  :straight t
  :demand t
  :init
  (setq org-roam-directory org-directory  ;"/org-roam"
        ;; Solves issue with FILETAGS, when possible use parent tags first   #+FILETAGS: :code:pandoc: 
        org-roam-database-connector 'sqlite ;https://github.com/org-roam/org-roam-ui/issues/289
        org-roam-db-location (expand-file-name ".data/org-roam.db" user-emacs-directory)
        ;; For md-roam
        ;;org-roam-title-sources '((roam_node))
        org-roam-title-sources '((mdtitle title mdheadline headline) (mdalias alias))
        ;;FIXME: 12-29-2023 Waiting on issue #81 from md-roam. Roam executes org code in the markdown buffer which gives us an error.
        org-roam-file-extensions '("org" "md")
        ;; org-roam-file-extensions '("org")
        ;; Show ID in link instead of title
        ;; If node show the link else show the first word. Assumes all nodes were created with a prefix ":".
        org-roam-node-formatter (lambda (node) (if (string= (car (org-element-at-point)) "node-property") (downcase (org-roam-node-id node)) (car (split-string (downcase node) ":"))))
        org-roam-file-exclude-regexp (list "^.*agenda/calendar/.*$"
                                           "^org-roam/ignore/" ;; Uncomment for graph examples
                                           ))
  ;; (md-roam-mode 1)
  :custom
  ;; set 'complation-at-point'
  (org-roam-completion-everywhere t)
   :config
  (evil-define-key '(normal) global-map
                  (kbd "<leader> n c") #'org-roam-capture   ; create node
                  (kbd "<leader> n f") #'org-roam-node-find ;find node
                  (kbd "<leader> n s") #'org-roam-db-sync ; sync db
                   )
  (evil-define-key '(normal) org-mode-map
                 (kbd "<leader> n n") #'org-roam-buffer-toggle "toggle buffer"
                 )
  (org-roam-db-autosync-mode t))

(use-package org-roam-ui
  :straight
    (:host github :repo "org-roam/org-roam-ui" :branch "main" :files ("*.el" "out"))
    :demand t
    :after org-roam
;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
;;         a hookable mode anymore, you're advised to pick something yourself
;;         if you don't care about startup time, use
;;  :hook (after-init . org-roam-ui-mode)
    :config
    (setq org-roam-ui-sync-theme t
          ;; For now don't follow, md files do not work on follow see md-roam #81
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))

(provide 'org-roam-init)
