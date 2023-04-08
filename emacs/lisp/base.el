;;; base.el --- Emacs Base Configuration
;;; Commentary:
;; This holds all the base Emacs configurations I have in my configuration.
;; This includes UI Adjustments and whatnot.
;;; Code:

(use-package emacs
  :config
  (recentf-mode +1)
  (defalias 'yes-or-no-p 'y-or-n-p)
  (defvar ik/code-font-size 140 "Font Size")
  (defvar ik/fancy-font-size 140 "Font Size")
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (set-face-attribute 'default nil :font "Fira Code Retina" :height ik/code-font-size)
  (set-face-attribute 'fixed-pitch nil :font "Fira Code Retina" :height ik/code-font-size)
  (set-face-attribute 'variable-pitch nil :font "Cabin" :height ik/fancy-font-size :weight 'regular)
  (set-frame-parameter (selected-frame) 'alpha '(80 . 80))
  (global-prettify-symbols-mode 1)
  (global-display-line-numbers-mode 1)
  (set-fringe-mode 10)
  (load-theme 'modus-vivendi t)
  :custom
  (user-full-name "Ian Kollipara")
  (user-mail-address "ian.kollipara@gmail.com")
  :bind (("C-x C-b" . ibuffer)
	 ("C-x K" . kill-this-buffer)))

(use-package eshell
  :straight t
  :hook (eshell-mode . (lambda () (display-line-numbers-mode 0))))



(use-package exec-path-from-shell
  :straight t
  :init (exec-path-from-shell-initialize))

(provide 'base)
;;; base.el ends here
