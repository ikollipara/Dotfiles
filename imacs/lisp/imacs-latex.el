;;;; imacs-latex.el
;;; Ian Kollipara
;;; Personal LaTeX Configuration

(straight-use-package 'auctex)
(straight-use-package 'citar)

(require 'citar)
(setq citar-bibliography (list "~/Dropbox/Zettlekasten/My Library.bib")
      citar-notes-paths (list denote-directory)
      citar-note-format-function #'imacs/create-citar-denote)

(add-hook 'LaTeX-mode-hook 'reftex-mode)
(add-hook 'LaTeX-mode-hook 'TeX-fold-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'flymake-mode)
(add-hook 'LaTeX-mode-hook 'lsp-deferred)

(provide 'imacs-latex)
