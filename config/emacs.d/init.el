(menu-bar-mode -1)            ; disable to menu bar

(add-to-list 'custom-theme-load-path "~/.emacs.d/plugins")
;(setq dracula-alternate-mode-line-and-minibuffer t)
(load-theme 'dracula t)       ; load theme

(setq backup-inhibited t)     ; disable backups
(setq auto-save-default nil)  ; disable autosave

(column-number-mode)          ; line and column numbers
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

(setq-default indent-tabs-mode nil) ; disable tabs
(setq tab-width 2)            ; set default tab width

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

(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)               ; set up evil mode
(evil-mode 1)

;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package)

(require 'use-package)
(setq use-package-always-ensure t)

(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(use-package highlight-indent-guides
  :ensure t
  :diminish highlight-indent-guides-mode
  :config
  (setq highlight-indent-guides-method 'character)
  (add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
  (add-hook 'yaml-mode-hook 'highlight-indent-guides-mode)
  (add-hook 'json-mode-hook 'highlight-indent-guides-mode)
  )
