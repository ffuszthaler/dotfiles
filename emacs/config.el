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
(setq-default tabs-always-indent 'complete)
(setq js-indent-level 2)

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

;; Show matching parens
(setq show-paren-delay 0)
(show-paren-mode 1)

;; Change Yes or No to Y or N
(fset 'yes-or-no-p 'y-or-n-p)

;; Windmove (easier split movement)
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))
;; "fix" for terminal
(define-key input-decode-map "\e[1;2A" [S-up])
(define-key input-decode-map "\e[1;2B" [S-down])
(define-key input-decode-map "\e[1;2C" [S-right])
(define-key input-decode-map "\e[1;2D" [S-left])

;; Winner Mode (undo and redo window configurations easily)
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

;; Smex (better M-x)
(use-package smex
  :ensure t
  :init (smex-initialize)
  :bind("M-x" . smex))

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

;; Minions (prettier mode-line)
(use-package minions
  :ensure t
  :init (minions-mode))

