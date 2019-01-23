;; ffuszthaler's config.el file

;; Start Emacs Server
(server-start)

;; Clean up UI
(setq ring-bell-function 'ignore)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(horizontal-scroll-bar-mode -1)

;; Indentation
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq evil-shift-width 2)

;; Syntax highlighting
(global-font-lock-mode t)

;; No backup files
(setq make-backup-files nil)

;; Line numbers
(global-linum-mode t)

;; Matching parentheses
(setq show-paren-delay 0)
(show-paren-mode 1)

;; Enable Clipboard
(setq x-select-enable-clipboard t)

;; Ido mode (for auto completion in find-file, ...)
(ido-mode t)
(ido-everywhere t)
(setq ido-enable-flex-matching t)

;; Evil mode
(use-package evil
  :ensure t
  :config
  (evil-mode 1))

;; Gotham Theme
(use-package gotham-theme :ensure t)

;; Show matching parens
(setq show-paren-delay 0)
(show-paren-mode 1)

;; Emmet-Mode
(use-package emmet-mode
  :ensure t
  :config
  (add-hook 'html-mode-hook 'emmet-mode)
  (add-hook 'css-mode-hook 'emmet-mode)
  (add-hook 'js-mode-hook 'emmet-mode)
  (add-hook 'js-jsx-mode-hook 'emmet-mode))

;; Smex (better M-x)
(use-package smex
  :ensure t
  :init (smex-initialize)
  :bind("M-x" . smex))
