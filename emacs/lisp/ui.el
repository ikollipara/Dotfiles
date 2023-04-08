;;; ui.el --- UI Related Packages
;;; Commentary:
;; This handles all UI Related Packages, like doom modeline
;; and Icons
;;
;;; Code:

(use-package all-the-icons :straight t)

(use-package all-the-icons-completion
  :straight t
  :after all-the-icons
  :init (all-the-icons-completion-mode +1))

(use-package all-the-icons-ibuffer
  :straight t
  :hook (ibuffer-mode . all-the-icons-ibuffer-mode))

(use-package dirvish
  :straight t
  :defer nil
  :after all-the-icons
  :hook
  (dired-mode . (lambda () (display-line-numbers-mode 0)))
  (dired-mode . dirvish-side-follow-mode)
  :init
  (dirvish-override-dired-mode)
  :config
  (setq dirvish-attributes '(vc-state all-the-icons git-msg file-size))
  :bind ("C-x M-j" . dirvish-dwim)
  :general
  (ik/leader
    "d d" 'dired-jump
    "d s" 'dirvish-side)
  (:keymaps 'dirvish-mode-map
	    "C-c d s" 'other-window))

(use-package doom-modeline
  :straight t
  :init
  (display-time-mode 1)
  (display-battery-mode 1)
  (doom-modeline-mode +1))

(use-package helpful
  :straight t
  :hook (helpful-mode . (lambda () (display-line-numbers-mode 0)))
  :bind (([remap describe-function] . helpful-callable)
	 ([remap describe-key] . helpful-key)
	 ([remap describe-command] . helpful-command)
	 ([remap describe-variable] . helpful-variable)
	 ([remap describe-symbol] . helpful-symbol)))

(use-package good-scroll
  :straight t
  :config (good-scroll-mode 1))

(use-package pulsar
  :straight t
  :config
  (setq pulsar-pulse t)
  (pulsar-global-mode 1)
  ;; integration with the `consult' package:
  (add-hook 'consult-after-jump-hook #'pulsar-recenter-top)
  (add-hook 'consult-after-jump-hook #'pulsar-reveal-entry)

  ;; integration with the built-in `imenu':
  (add-hook 'imenu-after-jump-hook #'pulsar-recenter-top)
  (add-hook 'imenu-after-jump-hook #'pulsar-reveal-entry))

(use-package doom-themes
  :straight t)

(provide 'ui)
;;; ui.el ends here
