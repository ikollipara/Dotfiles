;;;; imacs-clojure.el
;;; Ian Kollipara
;;; Personal Clojure Configuration


(straight-use-package 'cider)

(require 'cider)

(add-hook 'clojure-mode-hook 'lsp-deferred)
(add-hook 'cider-mode-hook 'lsp-deferred)

(provide 'imacs-clojure)
