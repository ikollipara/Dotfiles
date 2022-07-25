;;;; imacs-completion.el
;;; Ian Kollipara
;;; Personal Completion Configuration

(straight-use-package 'vertico)
(straight-use-package 'marginalia)
(straight-use-package 'orderless)
(straight-use-package 'consult)
(straight-use-package 'company)
(straight-use-package 'company-box)
(straight-use-package 'lsp-mode)
(straight-use-package 'lsp-ui)
(straight-use-package 'all-the-icons-completion)

(require 'vertico)
(vertico-mode 1)
(require 'consult)
(require 'marginalia)
(marginalia-mode 1)
(require 'orderless)
(setq completion-styles '(orderless basic)
      completion-category-overrides '((file (styles basic partial-completion))))

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(require 'company-box)
(add-hook 'company-mode-hook 'company-box-mode)

(setq lsp-keymap-prefix "C-c l")
(require 'lsp-mode)

(require 'all-the-icons-completion)
(all-the-icons-completion-mode)

(provide 'imacs-completion)
