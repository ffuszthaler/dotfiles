;; ffuszthaler's config.el file

;; Start Emacs Server
(server-start)

;; No startup screen
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

;; Clean up UI
(setq ring-bell-function 'ignore)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(toggle-scroll-bar -1)
(horizontal-scroll-bar-mode -1)

;; Syntax highlighting
(global-font-lock-mode t)

;; No backup files
(setq make-backup-files nil)

;; Word wrapping
(global-visual-line-mode t)

;; Line numbers
(global-linum-mode t)

;; Set tabs to spaces and 2
(setq-default tab-width 2)
(setq evil-shift-width 2)
(setq-default indent-tabs-mode nil)
(setq-default tabs-always-indent nil)
(setq js-indent-level 2)

;; Matching parentheses
(setq show-paren-delay 0)
(show-paren-mode 1)

;; Enable Clipboard
(setq x-select-enable-clipboard t)

;; Ido mode
(ido-mode t)
(ido-everywhere t)
(setq ido-enable-flex-matching t)

;; Evil mode
(use-package evil
  :ensure t
  :config
  (evil-mode 1))

;; Doom-themes
(use-package doom-themes :ensure t)

;; Solarized Theme
(use-package solarized-theme :ensure t)

;; Gotham Theme
(use-package gotham-theme :ensure t)

;; Which Key
(use-package which-key
  :ensure t
  :config
  (which-key-mode 1))

;; Projectile
(use-package projectile
  :ensure t
  :config
  (projectile-mode 1))

;; Dired-Sidebar
(use-package dired-sidebar
  :bind ((" C-x d" . dired-sidebar-toggle-sidebar))
  :ensure t
  :commands (dired-sidebar-toggle-sidebar))

;; Show matching parens
(setq show-paren-delay 0)
(show-paren-mode 1)

;; Wind Move
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;; Winner Mode
(when (fboundp 'winner-mode)
  (winner-mode 1))

;; Emmet-Mode
(use-package emmet-mode
  :ensure t
  :config
  (add-hook 'html-mode-hook 'emmet-mode)
  (add-hook 'css-mode-hook 'emmet-mode)
  (add-hook 'js-mode-hook 'emmet-mode)
  (add-hook 'js-jsx-mode-hook 'emmet-mode))

;; Smex
(use-package smex
  :ensure t
  :init (smex-initialize)
  :bind("M-x" . smex))

;; Impatient Mode
(use-package impatient-mode :ensure t)

;; Rainbow Mode
(use-package rainbow-mode
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'rainbow-mode))

;; Web Mode
(use-package web-mode
  :ensure t
  :mode (("\\.html$" . web-mode)
         ("\\.phtml\\'" . web-mode)
         ("\\.tpl\\.php\\'" . web-mode)
         ("\\.[agj]sp\\'" . web-mode)
         ("\\.as[cp]x\\'" . web-mode)
         ("\\.erb\\'" . web-mode)
         ("\\.mustache\\'" . web-mode)
         ("\\.djhtml\\'" . web-mode))
  :init
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-css-indent-offset 2)

  (setq web-mode-enable-auto-pairing t)
  (setq web-mode-enable-auto-expanding t)
  (setq web-mode-enable-css-colorization t))

;; Minions
(use-package minions
  :ensure t
  :init (minions-mode))

