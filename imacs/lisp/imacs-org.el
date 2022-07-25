;;;; imacs-org-base.el
;;; Ian Kollipara
;;; Personal Org Base Configuration

(straight-use-package 'org)
(straight-use-package 'denote)
(straight-use-package 'org-modern)

(require 'org)
(add-hook 'org-mode-hook 'flyspell-mode)
(add-hook 'org-mode-hook 'flymake-mode)
(add-hook 'org-mode-hook 'org-indent-mode)
(add-hook 'org-mode-hook 'variable-pitch-mode)
(add-hook 'org-mode-hook 'olivetti-mode)

(with-no-warnings
  (custom-declare-face '+org-todo-onhold '((t (:inherit (bold warning org-todo)))) ""))

(setq org-directory "~/Dropbox/Org/")
(setq org-refile-targets '((nil :maxlevel . 3) (org-agenda-files :maxlevel . 3))
      org-refile-use-outline-path 'file
      org-ellipsis " ▾"
      org-log-into-drawer t
      org-agenda-files (list org-directory))

(setq org-todo-keywords '((sequence
			   "TODO(t)" "[ ](T)" "PROJ(p)"
			   "IDEA(i)"
			   "[~](S)" "WAIT(w)" "[?](W)"
			   "|"
			   "DONE(d)" "[X](D)")))
(setq org-todo-keyword-faces '(("WAIT" . +org-todo-onhold)))

(setq org-agenda-custom-commands
      `(("A" "GTD Review"
	 ((todo "WAIT"
		((org-agenda-overriding-header "On Hold\n")))
	  (agenda ""
		  ((org-agenda-block-separator nil)
		   (org-agenda-overriding-header "\nToday's Agenda\n")
		   (org-agenda-span 1)
		   (org-agenda-day-face-function (lambda (date) 'org-agenda-date))
		   (org-deadline-warning-days 0)))
	  (agenda ""
		  ((org-agenda-overriding-header "\nUpcoming Deadlines and Scheduled Events\n")
		   (org-agenda-start-on-weekday nil)
		   (org-agenda-start-day "+1d")
		   (org-agenda-block-separator nil)
		   (org-agenda-entry-types '(:deadline :scheduled))))
	  (todo "IDEA"
		((org-agenda-overriding-header "\nThings to Consider\n")
		 (org-agenda-block-separator nil)))))))

(setq org-capture-templates
      `(("i" "Idea" entry (file+olp "~/Dropbox/Org/intray.org" "Inbox")
	 "** IDEA [%<%D %I:%M %p>] %?\n" :empty-lines 1)
	("c" "Calendar Events" entry (file "~/Dropbox/Org/calendar.org")
	 "** TODO %?\n SCHEDULED: %^{Scheduled at?}T")))

(setq org-hide-emphasis-markers t
      org-hide-leading-stars t)

(setq denote-directory "~/Dropbox/Org/Denote"
      denote-prompts '(title keywords)
      denote-known-keywords '("research" "school" "project"
			      "python" "compsci" "education"))
(require 'denote)
(require 'denote-dired)
(setq denote-dired-directories (list denote-directory))
(add-hook 'dired-mode-hook #'denote-dired-mode-in-directories)

(require 'org-modern)
(add-hook 'org-mode-hook 'org-modern-mode)
(add-hook 'org-agenda-finalize-hook 'org-modern-agenda)

(setq initial-buffer-choice #'imacs/initial-buffer-agenda)

(provide 'imacs-org)
