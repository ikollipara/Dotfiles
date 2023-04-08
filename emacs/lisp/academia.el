;;; academia.el --- Academia Packages
;;; Commentary:
;; This holds the configuration for Emacs
;; to function in an academic setting.
;;
;;; Code:

(use-package citar
  :straight t
  :after obsidian
  :custom
  (citar-bibliography "~/Documents/References.bib")
  (citar-notes-paths '("~/Dropbox/Workflow/Roam/"))
  :hook (LaTeX-mode . citar-setup-capf)
  :bind (:map markdown-mode-map
	 ("C-c i" . citar-insert-citation))
  :config
  (defun ik/create-obsidian-ref-note (key &optional entry)
    "Create a note for KEY and ENTRY. If ENTRY is nil, use `citar-get-entry' with KEY."
    (interactive (list (citar-select-ref)))
    (let* ((entry (or entry (citar-get-entry key)))
	   (filepath (expand-file-name (concat "@" key ".md") (concat obsidian-directory "/Literature Notes/")))
	   (buffer (find-file filepath)))
      (with-current-buffer buffer
	(when (f-empty-p filepath)
	  (insert
	   (concat "---\ntitle: "
		   (or (assoc "title" entry) "") "\nauthors: "
		   (or (assoc "author" entry) "") "\nyear: "
		   (or (assoc "date" entry) "") "\n---"))
	  (evil-insert 1)))))

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
  :commands citar-open)


;; (use-package org
;;   :straight t
;;   :commands (org-capture org-agenda)
;;   :hook
;;   (org-mode . org-indent-mode)
;;   (org-mode . (lambda () (variable-pitch-mode 1)))
;;   (org-mode . (lambda () (display-line-numbers-mode 0)))
;;   :bind ("C-c n k" . org-capture)
;;   :general
;;   (ik/leader
;;     "A" 'org-agenda
;;     "g o" (lambda () (interactive) (find-file org-directory))
;;     "n k" 'org-capture)
;;   :init 
;;   (setq org-directory "~/Dropbox/Workflow")
;;   :config
;;   (setq org-ellipsis "…")
;;   (setq org-agenda-files
;; 	'("~/Dropbox/Workflow/calendar.org" "~/Dropbox/Workflow/papers.org" "~/Dropbox/Workflow/projects.org" "~/Dropbox/Workflow/intray.org"))
;;   (setq org-todo-keywords '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!)")
;; 			    (sequence "READ(r)" "WAIT(w)" "SORT(s)" "|" "ANNOTATED(a!)")
;; 			    (sequence "IDEA(i)" "PROJ(p)" "|" "COMP(c!)" "CANC(k@)")))
;;   (setq org-capture-templates
;; 	`(("i" "Idea" entry (file+olp "~/Dropbox/Workflow/intray.org" "In-Tray")
;; 	   "** IDEA %? %u \n")
;; 	  ("t" "Todo" entry (file+olp "~/Dropbox/Workflow/intray.org" "In-Tray")
;; 	   "** TODO %? %u \n")
;; 	  ("c" "Concept" entry (file "~/Dropbox/Workflow/current.org")
;; 	   "* %f [%u] :fleeting:\n\n%?\n\n%a\n")
;; 	  :unarrowed t))
;;   (advice-add 'org-refile :after 'org-save-all-org-buffers))

(use-package markdown-mode
  :straight t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown")
  :bind (:map markdown-mode-map
	      ("C-c C-e" . markdown-do)))

(use-package obsidian
  :straight t
  :after general
  :demand t
  :hook
  (obsidian-mode . olivetti-mode)
  (obsidian-mode . (lambda () (display-line-numbers-mode 0)))
  :config
  (obsidian-specify-path "~/Dropbox/Notes/")
  (global-obsidian-mode t)
  :custom
  (obsidian-capture-directory "Fleeting Notes")
  :bind
  (("C-c n c" . obsidian-capture)
   :map obsidian-mode-map
   ("C-c C-o" . obsidian-follow-link-at-point)
   ("C-c C-b" . obsidian-backlink-jump)
   ("C-c C-l" . obsidian-insert-wikilink))
  :general
  (ik/leader
    "n j" 'obsidian-jump))

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
  :config
  (pdf-tools-install :no-query))

(provide 'academia)
;;; academia.el ends here
