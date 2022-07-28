;;;; imacs-base.el
;;; Ian Kollipara
;;; Base of Personal Configuration

(recentf-mode 1)
(global-auto-revert-mode 1)

(straight-use-package 'all-the-icons)
(straight-use-package 'doom-modeline)
(straight-use-package 'all-the-icons-dired)
(straight-use-package 'diredfl)
(straight-use-package 'all-the-icons-completion)
(straight-use-package 'tempel)
(straight-use-package 'helpful)
(straight-use-package 'no-littering)
(straight-use-package 'flycheck)
(straight-use-package 'smartparens)

(load-theme 'modus-vivendi t)
(setq modus-themes-fringes 'subtle)

(require 'all-the-icons)
(require 'doom-modeline)
(setq display-time-day-and-date t)
(display-time-mode 1)
(display-battery-mode 1)
(doom-modeline-mode 1)

(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(set-frame-parameter (selected-frame) 'alpha '(90 . 90))
(add-to-list 'default-frame-alist `(alpha . ,'(90 . 90)))

(set-face-attribute 'default nil :font "FiraCode Nerd Font" :height 130)
(set-face-attribute 'fixed-pitch nil :font "FiraCode Nerd Font" :height 150)
(set-face-attribute 'variable-pitch nil :font "Avenir Next LT Pro" :height 180 :weight 'light)

(global-display-line-numbers-mode t)
(global-prettify-symbols-mode t)

(require 'dired)
(require 'all-the-icons-dired)
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)

(require 'diredfl)
(diredfl-global-mode)

(setq tempel-path (concat user-emacs-directory "tempel"))
(defun imacs/tempel-setup-capf ()
  "Setup Tempel with Capf"
  (setq-local completion-at-point-functions
	      (cons #'tempel-expand completion-at-point-functions)))

(add-hook 'prog-mode-hook #'imacs/tempel-setup-capf)
(add-hook 'text-mode-hook #'imacs/tempel-setup-capf)
(require 'tempel)

(require 'helpful)

(let ((map global-map))
  (define-key map [remap describe-function] #'helpful-callable)
  (define-key map [remap describe-symbol] #'helpful-symbol)
  (define-key map [remap describe-key] #'helpful-key))

(require 'smartparens)
(require 'smartparens-config)
(smartparens-global-mode 1)

(require 'no-littering)
(setq auto-save-file-name-transforms
      `((".*" ,(no-littering-expand-var-file-name "auto-save/") t)))

(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                eshell-mode-hook
		pdf-view-mode-hook
		logos-focus-mode-extra-functions
		dired-mode-hook
		calendar-mode-hook
		helpful-mode-hook
		vterm-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(require 'flycheck)
(global-flycheck-mode 1)

(provide 'imacs-base)
