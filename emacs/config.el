;; ffuszthaler's config.el file

;; Start Emacs Server
(server-start)

;; No startup screen
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

(setq user-full-name "Florian Fußthaler")

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
  (evil-set-initial-state 'neotree-mode 'insert)
  (evil-mode 1))

;; Doom-themes
(use-package doom-themes :ensure t)

;; Solarized Theme
(use-package solarized-theme :ensure t)

;; Which Key
(use-package which-key
  :ensure t
  :init
  (setq which-key-separator " ")
  (setq which-key-prefix-prefix "+")
  (which-key-setup-side-window-right-bottom)
  :config
  (which-key-mode 1))

;; Projectile
(use-package projectile
  :ensure t
  :init
  (setq projectile-require-project-root nil)
  :config
  (projectile-mode 1))

;; All The Icons
(use-package all-the-icons :ensure t)

;; NeoTree
(use-package neotree
  :ensure t
  :init
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow)))
(global-set-key [f8] 'neotree-toggle)

;; Show matching parens
(setq show-paren-delay 0)
(show-paren-mode 1)

;; Indent with 2
(setq-default tab-width 2)
(setq evil-shift-width 2)
(setq-default indent-tabs-mode nil)
(setq-default tab-always-indent nil)

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

