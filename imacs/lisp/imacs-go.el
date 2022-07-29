;;;; imacs-go.el
;;; Ian Kollipara
;;; Personal Golang Configuration

(straight-use-package 'go-mode)

(require 'go-mode)

(add-hook 'go-mode 'lsp-deferred)

(provide 'imacs-go)
