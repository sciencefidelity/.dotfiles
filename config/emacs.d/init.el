(menu-bar-mode -1)             ; disable to menu bar

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(setq dracula-alternate-mode-line-and-minibuffer t)
(load-theme 'dracula t)        ; load theme

(setq backup-inhibited t)      ; disable backups
(setq auto-save-default nil)   ; disable autosave

(column-number-mode)           ; line and column numbers
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

