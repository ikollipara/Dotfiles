;;; lsp-config.el --- LSP Configuration
;;; Commentary:
;; This handles all my lsp configuration
;;
;;; Code:

;;;; Completion at Point
(use-package company
  :straight t
  :hook (after-init . global-company-mode))

(use-package company-box
  :straight t
  :hook (company-mode . company-box-mode))


;;;; LSP Setup
(use-package lsp-mode :straight t
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook
  (LaTeX-mode . lsp-deferred)
  (lsp-after-open . (lambda () (lsp-headerline-breadcrumb-mode 0)))
  (lsp-mode . flyspell-prog-mode)
  :commands lsp)

(use-package lsp-ui
  :straight t
  :after lsp-mode
  :commands lsp-ui)

;; Python
(use-package lsp-pyright
  :straight t
  :hook (python-mode . (lambda ()
			 (require 'lsp-pyright)
			 (lsp-deferred))))

(use-package poetry
  :straight t
  :config (poetry-tracking-mode 1))

;; Go
(use-package go-mode
  :straight t
  :hook (go-mode . lsp-deferred))

;; Typescript/Javascript/React
(use-package typescript-mode
  :straight t
  :after (tree-sitter tree-sitter-langs)
  :hook (typescript-mode . lsp-deferred)
  :custom
  (typescript-indent-level 2))

(use-package web-mode
  :straight t
  :hook (web-mode . lsp-deferred)
  :init
  (add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
  :config
  (setq web-mode-enable-auto-closing t))

;; PHP
(use-package php-mode
  :straight t
  :hook (php-mode . lsp-deferred))

;;;; Utilities
(use-package flycheck
  :straight t
  :after lsp-mode
  :config (global-flycheck-mode))

(use-package apheleia
  :straight t
  :defer nil
  :config
  (setf (alist-get 'emacs-lisp-mode apheleia-mode-alist)
	'lisp-indent)
  (apheleia-global-mode +1)
  :general
  (ik/leader
    "l f" 'apheleia-format-buffer)
  :commands apheleia-format-buffer)

(use-package tree-sitter
  :straight t
  :hook (tree-sitter-after-on . tree-sitter-hl-mode)
  :config
  (global-tree-sitter-mode))

(use-package tree-sitter-langs
  :straight t
  :after tree-sitter)

(provide 'lsp-config)

;;; lsp-config.el ends here
