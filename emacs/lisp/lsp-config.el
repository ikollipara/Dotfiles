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
  (python-mode . lsp-deferred)
  (lsp-after-open . (lambda () (lsp-headerline-breadcrumb-mode 0)))
  (lsp-mode . flyspell-prog-mode)
  :commands lsp
  :general
  (ik/leader
    "l r" 'lsp-rename))

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
  (setf (alist-get 'emacs-lisp-mode apheleia-mode-alist)
	'lisp-indent)
  (apheleia-global-mode +1)
  :general
  (ik/leader
    "l f" 'apheleia-format-buffer))

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
  :custom
  (typescript-indent-level 2))

(use-package rjsx-mode
  :straight t
  :after tide
  :magic ("*.tsx" . rjsx-mode)
  :hook (rjsx-mode . ik/setup-tide-mode))

(use-package poetry
  :straight t
  :config (poetry-tracking-mode 1))

(use-package julia-mode
  :straight t)

(use-package lsp-julia
  :straight t
  :after (julia-mode lsp)
  :hook (julia-mode . lsp-deferred)
  :config
  (setq lsp-julia-default-environment "~/.julia/environments/v1.7"))

(use-package lsp-java
  :straight t
  :after lsp
  :config
  (add-hook 'java-mode-hook 'lsp))

(use-package tide
  :straight t
  :config
  (defun ik/setup-tide-mode ()
    (interactive)
    (tide-setup)
    (flycheck-mode +1)
    (setq flycheck-check-syntax-automatically '(save mode-enabled))
    (setq tide-format-options '(:insertSpaceAfterFunctionKeywordForAnonymousFunctions t :placeOpenBraceOnNewLineForFunctions nil))
    (eldoc-mode +1)
    (tide-hl-identifier-mode +1)
    ;; company is an optional dependency. You have to
    ;; install it separately via package-install
    ;; `M-x package-install [ret] company`
    (company-mode +1))

  ;; aligns annotation to the right hand side
  (setq company-tooltip-align-annotations t)

  ;; formats the buffer before saving
  (add-hook 'before-save-hook 'tide-format-before-save)

  ;; if you use typescript-mode
  (add-hook 'typescript-mode-hook #'ik/setup-tide-mode)
  ;; if you use treesitter based typescript-ts-mode (emacs 29+)
  (add-hook 'typescript-ts-mode-hook #'ik/setup-tide-mode)
  :general
  (ik/leader 'tide-mode-map
    :states '(normal visual)
    "l r" 'tide-rename-symbol
    "l a" 'tide-fix
    "l R" 'tide-references
    "g d" 'tide-jump-to-definition
    "l e" 'tide-project-errors))

(use-package go-mode
  :straight t
  :hook (go-mode . lsp-deferred))

(provide 'lsp-config)

;;; lsp-config.el ends here
