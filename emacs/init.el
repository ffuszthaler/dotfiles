;; ffuszthaler's init.el file

;; Package configs
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("melpa" . "http://melpa.org/packages/")
                         ("gnu"   . "http://elpa.gnu.org/packages/")
                         ("org"   . "http://orgmode.org/elpa/")))
(package-initialize)

;; Bootstrap "use-packages"
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

;; Theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;;(load-theme 'gotham t)

;; Font
(set-frame-font "envypn")

;; Load custom set faces and variables
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; Load config file
(load "~/.emacs.d/config.el")

(provide 'init)
