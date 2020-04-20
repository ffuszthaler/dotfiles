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
  :init
  (setq nyan-animate-nyancat t
        nyan-wavy-trail t)
  (nyan-mode))

;; Centaur-Tabs
(use-package centaur-tabs
  :ensure t
  :config
  (setq centaur-tabs-set-modified-marker t
        centaur-tabs-modified-marker "●"
        centaur-tabs-cycle-scope 'tabs
        centaur-tabs-set-bar 'over
        centaur-tabs-height 30
        centaur-tabs-set-icons t)
  (centaur-tabs-headline-match)
  (centaur-tabs-mode t))

;; All The Icons
(use-package all-the-icons
  :ensure t
  :config (setq all-the-icons-scale-factor 1.0))

;; NeoTree
(use-package neotree
  :disabled
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

;; Treemacs
(use-package treemacs
  :ensure t
  :defer t
  :config
  (progn
    (setq treemacs-collapse-dirs                 (if treemacs-python-executable 3 0)
          treemacs-deferred-git-apply-delay      0.5
          treemacs-directory-name-transformer    #'identity
          treemacs-display-in-side-window        t
          treemacs-eldoc-display                 t
          treemacs-file-event-delay              5000
          treemacs-file-extension-regex          treemacs-last-period-regex-value
          treemacs-file-follow-delay             0.2
          treemacs-file-name-transformer         #'identity
          treemacs-follow-after-init             t
          treemacs-git-command-pipe              ""
          treemacs-goto-tag-strategy             'refetch-index
          treemacs-indentation                   2
          treemacs-indentation-string            " "
          treemacs-is-never-other-window         nil
          treemacs-max-git-entries               5000
          treemacs-missing-project-action        'ask
          treemacs-move-forward-on-expand        nil
          treemacs-no-png-images                 nil
          treemacs-no-delete-other-windows       t
          treemacs-project-follow-cleanup        nil
          treemacs-persist-file                  (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
          treemacs-position                      'left
          treemacs-recenter-distance             0.1
          treemacs-recenter-after-file-follow    nil
          treemacs-recenter-after-tag-follow     nil
          treemacs-recenter-after-project-jump   'always
          treemacs-recenter-after-project-expand 'on-distance
          treemacs-show-cursor                   nil
          treemacs-show-hidden-files             t
          treemacs-silent-filewatch              nil
          treemacs-silent-refresh                nil
          treemacs-sorting                       'alphabetic-asc
          treemacs-space-between-root-nodes      t
          treemacs-tag-follow-cleanup            t
          treemacs-tag-follow-delay              1.5
          treemacs-user-mode-line-format         nil
          treemacs-width                         35)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode t)
    (pcase (cons (not (null (executable-find "git")))
                 (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple))))
  :bind
  (:map global-map
        ("C-x t T"   . treemacs-add-project-to-workspace)
        ("C-x t Z"   . treemacs-remove-project-from-workspace)
        ("C-x t t"   . treemacs)))

(use-package treemacs-evil
  :after treemacs evil
  :ensure t)

(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t)

;; Projectile
(use-package projectile
  :ensure t
  :config
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-mode +1))

;; Syntax checking
(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))

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
        auto-package-update-interval 7)
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
