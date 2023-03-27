;;; base.el --- Emacs Base Configuration
;;; Commentary:
;; This holds all the base Emacs configurations I have in my configuration.
;; This includes UI Adjustments and whatnot.
;;; Code:

;; Adjusting prompts
(defalias 'yes-or-no-p 'y-or-n-p)

;; recent files
(recentf-mode +1)

;; UI Adjustments
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(set-face-attribute 'default nil :font "Fira Code Retina" :height 140)
(set-face-attribute 'fixed-pitch nil :font "Fira Code Retina" :height 140)
(set-face-attribute 'variable-pitch nil :font "Cabin" :height 150 :weight 'regular)
(set-frame-parameter (selected-frame) 'alpha '(90 . 90))
(global-prettify-symbols-mode 1)
(global-display-line-numbers-mode 1)
(set-fringe-mode 10)
(add-hook 'eshell-mode-hook (lambda () (display-line-numbers-mode 0)))
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Keybinds
(global-set-key (kbd "C-x K") 'kill-this-buffer)

;; Themes
(load-theme 'modus-vivendi t)

;; PATH Variables
(use-package exec-path-from-shell
  :straight t
  :init (exec-path-from-shell-initialize))

(provide 'base)
;;; base.el ends here
