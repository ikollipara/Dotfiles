;;;; imacs-web.el
;;; Ian Kollipara
;;; Personal Web Development Configuration

(straight-use-package 'web-mode)

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.scss?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.less?\\'" . web-mode))

(provide 'imacs-web)
