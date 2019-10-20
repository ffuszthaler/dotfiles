;; ffuszthaler's init.el

;; Package Archives
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("melpa" . "http://melpa.org/packages/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")))
(package-initialize)

;; Bootstrap "use-packages"
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

;; UI clean up
(setq ring-bell-function 'ignore)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(horizontal-scroll-bar-mode -1)

;; Mode-line Settings
(setq column-number-mode t)

;; Indentation
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)

;; Tweaks
(global-linum-mode t)
(global-font-lock-mode t)
(setq inhibit-startup-screen t)

;; No backup files (~filename)
(setq make-backup-files nil)

;; Font
(set-frame-font "Iosevka")

;; Smex
(use-package smex
  :ensure t
  :init (smex-initialize)
  :bind ("M-x" . smex))

;; Ido
(use-package ido :config (ido-mode 1))

;; Extensible vi layer for emacs (disable by pressing C-z)
(use-package evil :ensure t :config (evil-mode 1))

;; Theme
(use-package doom-themes :ensure t)
(load-theme 'doom-tomorrow-night t)
;;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;;(load-theme 'wilmersdorf t)

;; Doom-Modeline
(use-package doom-modeline :ensure t :hook (after-init . doom-modeline-mode))

;; Nyan-Mode
(use-package nyan-mode :ensure t :config (nyan-mode) (nyan-start-animation) (nyan-toggle-wavy-trail))

;; Centaur Tabs
(use-package centaur-tabs :ensure t :demand :init (setq centaur-tabs-set-bar 'over)
  :config
  (centaur-tabs-mode)
  (centaur-tabs-headline-match)
  (setq centaur-tabs-set-modified-marker t
        centaur-tabs-modified-marker "●"
        centaur-tabs-cycle-scope 'tabs
        centaur-tabs-height 30
        centaur-tabs-set-icons t)
  :bind
  ("C-S-<tab>" . centaur-tabs-backward)
  ("C-<tab>" . centaur-tabs-forward))

;; All The Icons
(use-package all-the-icons :ensure t :config (setq all-the-icons-scale-factor 1.0))

;; NeoTree
(use-package neotree
  :ensure t
  :init
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  :config
  (add-hook 'neotree-mode-hook
            (lambda ()
              (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
              (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
              (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
              (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))
  :bind ("<f8>" . neotree-toggle))

;; Custom
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(provide 'init)
