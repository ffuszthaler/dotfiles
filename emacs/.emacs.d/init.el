;;; init.el --- Emacs init file
;;; Author: ffuszthaler
;;; Commentary:
;;; Personal Emacs Configuration
;;; Code:

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(setq package-enable-at-startup nil)
(package-initialize)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file) ;; Slows down startup

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

;; UI
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(horizontal-scroll-bar-mode -1)
(fset 'yes-or-no-p 'y-or-n-p)
(column-number-mode +1)
;;(global-linum-mode t)
(global-font-lock-mode t)
(set-frame-font "Iosevka")

;; Preferences
(setq ring-bell-function 'ignore
      make-backup-files nil)
(setq-default indent-tabs-mode nil
              tab-width 2)
(ido-mode 1)

;; Smex - Better M-x
(use-package smex
  :ensure t
  :init (smex-initialize)
  :bind ("M-x" . smex))

;; Extensible vi layer for emacs (disable by pressing C-z)
(use-package evil
  :ensure t
  :config (evil-mode 1))

;; Themes - Can also be set through customize-themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(use-package doom-themes :ensure t)
;;(load-theme 'doom-tomorrow-night t)
;;(load-theme 'wilmersdorf t)

;; Doom-Modeline
(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode))

;; Nyan-Mode
(use-package nyan-mode
  :ensure t
  :config
  (nyan-mode)
  (nyan-start-animation)
  (nyan-toggle-wavy-trail))

;; Centaur-Tabs
(use-package centaur-tabs :ensure t
  ;;:disabled ;; To disable a certain package
  :demand
  :init (setq centaur-tabs-set-bar 'over)
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
(use-package all-the-icons
  :ensure t
  :config (setq all-the-icons-scale-factor 1.0))

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

;; Projectile
(use-package projectile
  :ensure t
  :bind (:map projectile-mode-map
              ("C-c p" . 'projectile-command-map))

  :config
  (projectile-mode +1))

;; Syntax checking
(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))

;; Git
(use-package magit
  :ensure t
  :init
  (progn
    (bind-key "C-x g" 'magit-status)))

;; Snippets
(use-package yasnippet
  :ensure t
  :init
    (yas-global-mode 1))
(use-package yasnippet-snippets :ensure t)
(use-package yasnippet-classic-snippets :ensure t)

;; LSP
(use-package lsp-mode
  :ensure t
  :commands lsp
  :custom
  (lsp-auto-guess-root nil)
  (lsp-prefer-flymake nil) ; Use flycheck instead of flymake
  :bind (:map lsp-mode-map ("C-c C-f" . lsp-format-buffer))
  :hook ((c-mode c++-mode) . lsp))

;; Company-Mode
(use-package company
  :ensure t
  :diminish company-mode ;; Hide or abbreviate name in mode-line
  :hook (prog-mode . company-mode))
(use-package company-lsp
  :ensure t
  :config
  (push 'company-lsp company-backends))

;; Auto-Package-Update
(use-package auto-package-update
  :ensure t
  :config
  (setq auto-package-update-delete-old-versions t
        auto-package-update-interval 4)
  (auto-package-update-maybe))

;; Org-Mode
(use-package org
  :hook ((org-mode . visual-line-mode)
         (org-mode . org-indent-mode))
  :config(with-eval-after-load 'org
           (define-key org-mode-map (kbd "C-<tab>") nil))
  (use-package org-bullets
    :ensure t
    :hook (org-mode . org-bullets-mode)))

(provide 'init)
;;; init.el ends here
