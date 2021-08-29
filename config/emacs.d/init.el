;; disable menu bar
(menu-bar-mode -1)

;;·disable backups and autosave
(setq backup-inhibited t)
(setq auto-save-default nil)

;; line and column numbers in prog mode
(column-number-mode)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

;;·disable·tabs and set·default·tab·width
(setq-default indent-tabs-mode nil)
(setq tab-width 2)

;; load theme - https://github.com/dracula/emacs
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'dracula t)
;; theme customisations
(let ((custom--inhibit-theme-enable nil))
  (custom-theme-set-faces
    'dracula
    `(line-number ((t (:foreground ,"#565761" :background ,"#282a36"))))
    `(whitespace-newline ((t (:foreground ,"#565761"))))
    `(whitespace-tab ((t (:background ,"#282a36" :foreground ,"#565761"))))
    `(whitespace-space ((t (:foreground ,"#565761"))))
    ))
;
;; initialize package sources
(require 'package)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

;; https://github.com/jwiegley/use-package
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; https://github.com/emacs-evil/evil
(use-package evil
  :init (evil-mode 1))

;; https://github.com/myrjola/diminish.el
(use-package diminish
  :config (diminish 'ws))

;; show invisible characters
(progn
  (setq whitespace-style (quote (face spaces tabs newline space-mark tab-mark newline-mark)))
  (setq whitespace-display-mappings
        '(
          (space-mark 32 [183] [46])
          (newline-mark 10 [172 10])
          (tab-mark 9 [8594 9] [92 9])
          )))
(add-hook 'prog-mode-hook 'whitespace-mode)

(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)	
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

;; https://github.com/johnson-christopher/powerline-evil
(use-package powerline-evil
  :config (powerline-evil-center-color-theme))

;; https://github.com/DarthFennec/highlight-indent-guides
(use-package highlight-indent-guides
  :hook (prog-mode . highlight-indent-guides-mode)
  :diminish
  :config
  (setq highlight-indent-guides-method 'character))

;; https://github.com/Fanael/rainbow-delimiters
(use-package rainbow-delimiters
  :diminish
  :init
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

;; https://github.com/redguardtoo/evil-nerd-commenter
(use-package evil-nerd-commenter
  :bind ("M-/" . evilnc-comment-or-uncomment-lines))

;; https://github.com/emacs-lsp/lsp-mode/
(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :init
  (setq lsp-keymap-prefix "C-c l")
  :config
  (lsp-enable-which-key-integration t))

;; https://github.com/emacs-lsp/lsp-ui/
(use-package lsp-ui)

;; https://github.com/emacs-typescript/typescript.el
(use-package typescript-mode
  :mode "\\.ts\\'"
  :hook (typescript-mode . lsp-deferred)
  :config
  (setq typescript-indent-level 2))

;; https://github.com/ananthakumaran/tide
;(use-package tide
;  :hook (typescript-mode . #'setup-tide-mode))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(tide typescript-mode lsp-ui rainbow-delimiters highlight-indent-guides powerline-evil diminish evil use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
