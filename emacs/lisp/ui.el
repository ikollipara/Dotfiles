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
  :init
  (dirvish-override-dired-mode)
  :bind (:map dired-mode-map
	      ("c" . dired-create-empty-file))
  :config
  (setq dirvish-attributes '(vc-state all-the-icons git-msg file-size)))

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
	 ([remap describe-variable] . helpful-variable)))

(provide 'ui)
;;; ui.el ends here
