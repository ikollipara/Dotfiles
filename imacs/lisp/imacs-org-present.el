;;;; imacs-org-present.el
;;; Ian Kollipara
;;; Personal Org Present Configuration

(straight-use-package 'olivetti)
(straight-use-package 'logos)
(straight-use-package 'ox-pandoc)

(setq olivetti-body-width 0.7
      olivetti-minimum-body-width 80
      olivetti-recall-visual-line-mode-entry-mode t
      olivetti-style 'fancy)
(require 'olivetti)

(require 'logos)
(setq logos-outlines-are-pages t
      logos-outline-regexp-alist `((emacs-lisp-mode . ,(format "\\(^;;;+ \\|%s\\)" logos--page-delimiter))
	  (org-mode . ,(format "\\(^\\*+ +\\|^-\\{5\\}$\\|%s\\)" logos--page-delimiter))
	  (t . ,(or outline-regexp logos--page-delimiter))))
(setq-default logos-hide-mode-line nil
	      logos-hide-buffer-boundaries t
	      logos-hide-fringe t
	      logos-variable-pitch t
	      logos-scroll-lock nil
	      logos-olivetti t)

(require 'ox-pandoc)

(provide 'imacs-org-present)
