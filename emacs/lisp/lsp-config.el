;;; lsp-config.el --- LSP Configuration
;;; Commentary:
;; This handles all my lsp configuration
;;
;;; Code:

(use-package company
  :straight t
  :hook (after-init . global-company-mode))

(use-package lsp-mode :straight t
  :init (setq lsp-keymap-prefix "C-c l")
  :hook
  (LaTeX-mode . lsp-deferred)
  (lsp-mode . (lambda () (lsp-headerline-breadcrumb-mode 0)))
  (lsp-mode . flyspell-prog-mode)
  :commands lsp)

(use-package flycheck
  :straight t
  :after lsp-mode
  :config (global-flycheck-mode))

(use-package lsp-ui
  :straight t
  :after lsp-mode
  :commands lsp-ui)

(use-package apheleia
  :straight t
  :config
  (apheleia-global-mode +1))

(use-package tree-sitter
  :straight t
  :hook (tree-sitter-after-on . tree-sitter-hl-mode)
  :config
  (global-tree-sitter-mode))

(use-package tree-sitter-langs
  :straight t
  :after tree-sitter)

(use-package typescript-mode
  :straight t
  :after (tree-sitter tree-sitter-langs)
  :hook (typescript-mode . lsp-deferred)
  :custom
  (typescript-indent-level 2)
  :config
  (define-derived-mode typescriptreact-mode typescript-mode
    "Typescript React")
  (add-to-list 'auto-mode-alist '("\\.tsx?\\'" . typescriptreact-mode))
  (add-to-list 'tree-sitter-major-mode-language-alist '(typescriptreact-mode . tsx)))

(use-package tsi
  :after tree-sitter
  :straight (:host github :repo "orzechowskid/tsi.el")
  ;; define autoload definitions which when actually invoked will cause package to be loaded
  :commands (tsi-typescript-mode tsi-json-mode tsi-css-mode)
  :init
  (add-hook 'typescript-mode-hook (lambda () (tsi-typescript-mode 1)))
  (add-hook 'json-mode-hook (lambda () (tsi-json-mode 1)))
  (add-hook 'css-mode-hook (lambda () (tsi-css-mode 1)))
  (add-hook 'scss-mode-hook (lambda () (tsi-scss-mode 1))))

(use-package go-mode
  :straight t
  :hook (go-mode . lsp-deferred))

(provide 'lsp-config) 

;;; lsp-config.el ends here
