;;                             _______     _____ _       __  __ ___ _   _
;;                            | ____\ \   / /_ _| |     |  \/  |_ _| \ | |
;;                            |  _|  \ \ / / | || |     | |\/| || ||  \| |
;;                            | |___  \ V /  | || |___  | |  | || || |\  |
;;                            |_____|  \_/  |___|_____| |_|  |_|___|_| \_|
;;
;;╭────────────────────────────────────────────────────────────────────────────────────────────────╮
;;│ Created:            04/30/2023                                                                 │
;;│ Updated:            04/30/2023 21:42                                                           │
;;│ Author:             Ritchie                                                                    │
;;│ Description:        Evil minimum config                                                        │
;;╰────────────────────────────────────────────────────────────────────────────────────────────────╯

(use-package evil
  :demand t
  :straight t
	:hook        (prog-mode . (lambda () (progn (evil-normal-state 1))))
  :init
  (setq evil-want-C-i-jump nil) ; Use indent-for-tab-command
  (setq evil-want-Y-yank-to-eol t)
  (setq evil-want-keybinding nil)
  (setq evil-split-window-below t)
  (setq evil-vsplit-window-right t) ;Not sure what it does.
  (cl-pushnew 'evil-markers-alist desktop-locals-to-save) ; saves marks
  :config
  (evil-mode 1)
  (evil-set-leader 'normal (kbd "SPC")))

(provide 'evil-min)

