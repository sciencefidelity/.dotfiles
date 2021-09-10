{ config, pkgs, lib, ... }:

{
  packageOverrides = pkgs: with pkgs; rec {
    emacsConfig = writeText "init.el" ''
      ;; disable menu bar, toolbar and startup message
      (setq inhibit-startup-message t)
      ;; (scroll-bar-mode -1)
      ;; (tool-bar-mode -1)
      ;; (tooltip-mode -1)
      (menu-bar-mode -1)

      ;;·disable backups and autosave
      (setq backup-inhibited t)
      (setq auto-save-default nil)

      ;; use custom typeface in standalone
      ;; (set-face-attribute 'default nil :font "MonoLisa" :height 130)
      ;; (setq-default line-spacing 0.18)

      ;; line and column numbers in prog mode
      (column-number-mode)
      (add-hook 'prog-mode-hook 'display-line-numbers-mode)

      ;; disable tabs and set default tab width
      (setq-default indent-tabs-mode nil)
      (setq tab-width 2)

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

      (use-package eterm-256color
        :ensure t)

      ;; https://github.com/dracula/emacs
      (unless (package-installed-p 'dracula-theme)
        (package-install 'dracula-theme))
      (require 'dracula-theme)
      (load-theme 'dracula t)
      ;; theme customisations
      (let ((custom--inhibit-theme-enable nil))
        (custom-theme-set-faces
          'dracula
          `(line-number ((t (:foreground ,"#565761" :background ,"#282a36"))))
          `(font-lock-comment-face ((t (:foreground ,"#6272a4" :weight light))))
          `(font-lock-comment-delilmiter-face ((t (:foreground ,"#6272a4" :weigh light))))
          `(dired-ignored ((t (:foreground ,"#6272a4" :weight light))))
          `(font-lock-doc-face ((t (:foreground ,"#6272a4" :weight light))))
          `(powerline-evil-normal-face ((t (:background ,"#bd93f9" :foreground ,"#282a36"))))
          `(powerline-evil-normal-face ((t (:background ,"#bd93f9" :foreground ,"#282a36"))))
          `(powerline-evil-insert-face ((t (:background ,"#50fa7b" :foreground ,"#282a36"))))
          `(powerline-evil-motion-face ((t (:background ,"#8be9fd" :foreground ,"#282a36"))))
          `(whitespace-newline ((t (:foreground ,"#424450" :weight light))))
          `(whitespace-tab ((t (:background ,"#282a36" :foreground ,"#424450" :weight light))))
          `(whitespace-space ((t (:foreground ,"#424450" :wieght light))))
          ))

      ;; https://github.com/emacs-evil/evil
      (use-package evil
        :init
        (setq evil-want-integration t)
        (setq evil-want-keybinding nil)
        (setq evil-want-C-u-scroll t)
        (setq evil-want-C-i-jump nil)
        :config
        (evil-mode 1)
        (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
        (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

        ;; Use visual line motions even outside of visual-line-mode buffers
        (evil-global-set-key 'motion "j" 'evil-next-visual-line)
        (evil-global-set-key 'motion "k" 'evil-previous-visual-line))

      ;; https://github.com/editorconfig/editorconfig-emacs
      (use-package editorconfig
        :ensure t
        :diminish
        :config
        (editorconfig-mode 1))

      ;; https://github.com/myrjola/diminish.el
      (use-package diminish)

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

      ;; https://github.com/abo-abo/swiper#ivy
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

      ;; https://github.com/Yevgnen/ivy-rich
      (use-package ivy-rich
        :init
        (ivy-rich-mode))

      ;; https://github.com/abo-abo/swiper#counsel
      (use-package counsel
        :bind (("M-x" . counsel-M-x)
               ("C-x b" . counsel-ibuffer)
               ("C-x C-f" . counsel-find-file)
               :map minibuffer-local-map
               ("C-r" . 'councel-minibuffer-history))
        :config
      (setq ivy-initial-inputs-alist nil))

      ;; https://github.com/Wilfred/helpful
      (use-package helpful
        :custom
        (counsel-describe-function-function #'helpful-callable)
        (counsel-describe-variable-function #'helpful-variable)
        :bind
        ([remap describe-function] . helpful-function)
        ([remap describe-symbol] . helpful-symbol)
        ([remap describe-variable] . helpful-variable)
        ([remap describe-command] . helpful-command)
        ([remap describe-key] . helpful-key))

      ;; https://github.com/johnson-christopher/powerline-evil
      (use-package powerline-evil
        :config (powerline-evil-center-color-theme))

      ;; https://github.com/DarthFennec/highlight-indent-guides
      (use-package highlight-indent-guides
        ;:hook (prog-mode . highlight-indent-guides-mode)
        :diminish
        :config
        (setq highlight-indent-guides-method 'character))

      ;; https://github.com/Fanael/rainbow-delimiters
      (use-package rainbow-delimiters
        :diminish
        :hook (prog-mode . rainbow-delimiters-mode))

      (add-hook 'prog-mode-hook 'electric-pair-mode)

      ;; https://github.com/Fuco1/smartparens
      (use-package smartparens
        :config
        (add-hook 'prog-mode-hook #'smartparens-mode))

      ;; https://github.com/justbur/emacs-which-key
      (use-package which-key
        :init (which-key-mode)
        :diminish
        :config
        (setq which-key-idle-delay 0.3))

      ;; https://magit.vc
      (use-package magit
        :custom
        (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

      ;; https://github.com/redguardtoo/evil-nerd-commenter
      (use-package evil-nerd-commenter
        :bind ("M-/" . evilnc-comment-or-uncomment-lines))

      ;; https://github.com/emacs-lsp/lsp-mode/
      (use-package lsp-mode
        :commands (lsp lsp-deferred)
        :init
        (setq lsp-keymap-prefix "C-c l")
        :diminish
        :config
        (lsp-enable-which-key-integration t))

      ;; https://github.com/emacs-typescript/typescript.el
      (use-package typescript-mode
        :mode "\\.ts\\'"
        :hook (typescript-mode . lsp-deferred)
        :diminish
        :config
        (setq typescript-indent-level 2))

      ;; https://github.com/company-mode/company-mode
      (use-package company
        :after lsp-mode
        :hook (lsp-mode . company-mode)
        :diminish
        :bind (:map company-active-map
               ("<tab>" . company-complete-selection))
              (:map lsp-mode-map
               ("<tab>" . company-indent-or-complete-common))
        :custom
        (company-minimum-prefix-length 1)
        (company-idle-delay 0.0))

      ;; https://github.com/Alexander-Miller/treemacs
      (use-package treemacs
        :init
        (with-eval-after-load 'winum
          (define-key winum-keymap (kbd "M-0") #'treemacs-select-window)))

      (use-package treemacs-magit
        :after (treemacs magit)
        :ensure t)
    ''
    emacs = emacs.pkgs.withPackages (epkgs: (with epkgs.melpaStablePackages; [
      company
      counsel
      diminish
      dracula-theme
      editorconfig
      eterm-256color
      evil
      evil-nerd-commenter
      helpful
      highlight-indent-guides
      ivy
      ivy-rich
      lsp-mode
      magit
      powerline-evil
      rainbow-delimiters
      smartparens
      treemacs
      treemacs-magit
      typescript-mode
      use-package
      which-key
    ]));
  }
}
