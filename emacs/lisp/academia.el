;;; academia.el --- Academia Packages
;;; Commentary:
;; This holds the configuration for Emacs
;; to function in an academic setting.
;;
;;; Code:

(use-package citar
  :straight t
  :custom
  (citar-bibliography "~/Documents/References.bib")
  :hook (LaTeX-mode . citar-setup-capf)
  :config
  (defvar citar-indicator-files-icons
    (citar-indicator-create
    :symbol (all-the-icons-faicon
		"file-o"
		:face 'all-the-icons-green
		:v-adjust -0.1)
    :function #'citar-has-files
    :tag "has:files"))

  (defvar citar-indicator-links-icons
    (citar-indicator-create
    :symbol (all-the-icons-octicon
		"link"
		:face 'all-the-icons-orange
		:v-adjust 0.01)
    :function #'citar-has-links
    :tag "has:links"))

  (defvar citar-indicator-notes-icons
    (citar-indicator-create
    :symbol (all-the-icons-material
		"speaker_notes"
		:face 'all-the-icons-blue
		:v-adjust -0.3)
    :function #'citar-has-notes
    :tag "has:notes"))

  (setq citar-indicators
  (list citar-indicator-files ; plain text
        citar-indicator-notes-icons)) ; icon
  :commands citar-open
  :general
  ("C-c i" 'citar-insert-citation))

(use-package flyspell-correct
  :straight t
  :bind (:map flyspell-mode-map
	      ("C-;" . flyspell-correct-at-point)))

(use-package org
  :straight t
  :commands (org-capture org-agenda)
  :hook
  (org-mode . org-indent-mode)
  (org-mode . (lambda () (variable-pitch-mode 1)))
  (org-mode . (lambda () (display-line-numbers-mode 0)))
  :bind ("C-c n k" . org-capture)
  :general
  (ik/leader
    "A" 'org-agenda
    "g o" (lambda () (interactive) (find-file org-directory))
    "n k" 'org-capture)
  :init 
  (setq org-directory "~/Dropbox/Workflow")
  :config
  (setq org-ellipsis "…")
  (setq org-agenda-files
	'("~/Dropbox/Workflow/calendar.org" "~/Dropbox/Workflow/papers.org" "~/Dropbox/Workflow/projects.org" "~/Dropbox/Workflow/intray.org"))
  (setq org-todo-keywords '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!)")
			    (sequence "READ(r)" "WAIT(w)" "SORT(s)" "|" "ANNOTATED(a!)")
			    (sequence "IDEA(i)" "PROJ(p)" "|" "COMP(c!)" "CANC(k@)")))
  (setq org-capture-templates
	`(("i" "Idea" entry (file+olp "~/Dropbox/Workflow/intray.org" "In-Tray")
	   "** IDEA %? %u \n")
	  ("t" "Todo" entry (file+olp "~/Dropbox/Workflow/intray.org" "In-Tray")
	   "** TODO %? %u \n")
	  ("c" "Concept" entry (file "~/Dropbox/Workflow/current.org")
	   "* %f [%u] :fleeting:\n\n%?\n\n%a\n")
	  ("n" "Literature Note" entry (file+head "%(expand-file-name \"Literature Notes\" org-roam-directory)/${citar-citekey}.org")
	   "#+title: ${citar-citekey} (${citar-date}). ${note-title}.\n#+created: %U\n#+last_modified: %U\n\n"
	   :unarrowed t)))
  (advice-add 'org-refile :after 'org-save-all-org-buffers))

(use-package org-noter
  :straight t
  :after pdf-tools)

(use-package org-roam
  :straight t
  :custom
  (org-roam-directory (file-truename "~/Dropbox/Workflow/Roam/"))
  :bind ("C-c n c" . org-roam-capture)
  :general
  (ik/leader
    "n c" 'org-roam-capture
    "n j" 'org-roam-dailies-capture-today)
  :config
  (require 'org-roam-protocol))

(use-package citar-org-roam
  :straight t
  :after (citar org-roam)
  :custom
  (citar-org-roam-capture-template-key "n")
  :config (citar-org-roam-mode))

(use-package olivetti
  :straight t
  :after org
  :hook
  (org-mode . olivetti-mode))


(use-package org-modern
  :straight t
  :after org
  :hook (org-mode . org-modern-mode))

(use-package auctex
  :straight t
  :defer t
  :after lsp-mode
  :hook
  (LaTeX-mode . flyspell-mode)
  (LaTeX-mode . TeX-fold-mode)
  (LaTeX-mode . lsp-deferred)
  :config
  (setq TeX-view-program-list '((output-pdf "PDF Tools"))))

(use-package pdf-tools
  :straight t
  :magic ("%PDF" . pdf-view-mode)
  :hook
  (pdf-view-mode . (lambda () (display-line-numbers-mode 0)))
  :config (pdf-tools-install :no-query))

(provide 'academia)
;;; academia.el ends here
