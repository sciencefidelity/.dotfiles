(menu-bar-mode -1)             ; disable to menu bar

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(setq dracula-alternate-mode-line-and-minibuffer t)
(load-theme 'dracula t)        ; load theme

(setq backup-inhibited t)      ; disable backups
(setq auto-save-default nil)   ; disable autosave

(column-number-mode)           ; line and column numbers
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

; show invisible characters
(progn
  (setq whitespace-style (quote (face spaces tabs newline space-mark tab-mark newline-mark)))
  (setq whitespace-display-mappings
        '(
          (space-mark 32 [183] [46])
          (newline-mark 10 [172 10])
          (tab-mark 9 [8594 9] [92 9])
          )))
(add-hook 'prog-mode-hook 'whitespace-mode)
