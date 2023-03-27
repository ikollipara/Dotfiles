;;; minad.el --- Minad Packages
;;; Commentary:
;; This handles all the packages that
;; I use from Minad.
;;
;;; Code:

(use-package tempel
  :straight t
  :after general
  :bind (("C-c t i" . tempel-insert)
	 ("C-c SPC" . tempel-complete)
	 :map tempel-map
	 ("<tab>" . tempel-next)))

(use-package vertico
  :straight t
  :init (vertico-mode +1))

(use-package marginalia
  :straight t
  :init (marginalia-mode +1))

(use-package consult
  :straight t
  :after general
  :bind (([remap switch-to-buffer] . consult-buffer)
	 ([remap goto-line] . consult-line)
	 ("M-/" . consult-line-multi))
  :general
  (ik/leader
    "f f" 'find-file
    "f r" 'consult-recent-file
    "/" 'consult-line))

(use-package consult-flycheck
  :straight t
  :after (consult flycheck)
  :bind ([remap flycheck-list-errors] . consult-flycheck))

(use-package orderless
  :straight t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(provide 'minad)
;;; minad.el ends here
