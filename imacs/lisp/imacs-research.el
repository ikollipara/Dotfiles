;;;; imacs-research.el
;;; Ian Kollipara
;;; Personal Research Configuration

(straight-use-package 'org-noter)
(straight-use-package 'pdf-tools)
(straight-use-package 'citar)

(require 'citar)
(setq citar-bibliography (list "~/Dropbox/Zettlekasten/My Library.bib")
      citar-notes-paths (list denote-directory)
      citar-note-format-function #'imacs/create-citar-denote)

(require 'org-noter)
(setq org-noter-always-create-frame nil
      org-noter-notes-search-path (list denote-directory org-directory))

(require 'pdf-tools)

(provide 'imacs-research)
