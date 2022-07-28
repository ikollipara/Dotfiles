;;;; imacs-python.el
;;; Ian Kollipara
;;; Personal Python Configuration

;;;; Make sure imacs-completion is already required

(straight-use-package 'lsp-pyright)
(straight-use-package 'poetry)
(straight-use-package 'exec-path-from-shell)
(straight-use-package 'jinja2-mode)

(add-hook 'python-mode-hook #'(lambda () (require 'lsp-pyright) (lsp-deferred)))

(require 'exec-path-from-shell)
(exec-path-from-shell-initialize)

(require 'poetry)
(poetry-tracking-mode 1)

(require 'jinja2-mode)
(add-to-list 'auto-mode-alist '("\\.j2\\'" . jinja2-mode))

(imacs/after-mode-save 'python-mode (lambda () (shell-command (concat "black " (buffer-name)))))
(imacs/after-mode-save 'python-mode (lambda () (shell-command (concat "isort " (buffer-name)))))

(provide 'imacs-python)
