;;;;; custom-functions.el
;;; Ian Kollipara

(defun imacs/split-window-right-and-follow ()
  "Split Window to the Right and Follow"
  (interactive)
  (split-window-right)
  (windmove-right))

(defun imacs/split-window-below-and-follow ()
  "Split Window to the Below and Follow"
  (interactive)
  (split-window-below)
  (windmove-down))

(defun imacs/list-org-dir ()
  "Open Dired to Org Directory"
  (interactive)
  (dired org-directory))

(defun imacs/list-config-dir ()
  "Open Dired for the Configuration Directory"
  (interactive)
  (dired user-emacs-directory))

(defun imacs/display-gtd-view ()
  "Display Custom Org Agenda geared towards my GTD-esque workflow"
  (interactive)
  (org-agenda nil "A")
  (delete-other-windows)
  (display-line-numbers-mode -1))

(defun imacs/denote-list-dir ()
  "Open Dired to the Denote Directory"
  (interactive)
  (dired denote-directory))

(defun imacs/calendar-move (dir)
  "Move the calendar in up, down, left, right"
  (cond
   ((equal 'up dir) (org-eval-in-calendar '(calendar-backward-week 1)))
   ((equal 'down dir) (org-eval-in-calendar '(calendar-forward-week 1)))
   ((equal 'left dir) (org-eval-in-calendar '(calendar-backward-day 1)))
   ((equal 'right dir) (org-eval-in-calendar '(calendar-forward-day 1)))
   ((equal t t) nil)))

(defun imacs/create-projectile-project ()
  "Create and Add the current directory to Projectile Known projects"
  (interactive)
  (dired-run-shell-command "touch .projectile")
  (projectile-add-known-project (dired-current-directory))
  (message (format "%s Added to Projects" (default-directory))))

(defun imacs/initial-buffer-agenda ()
  "Create the Intitial Buffer for Emacs"
  (org-agenda nil "A")
  (get-buffer "*Org Agenda*")
  (delete-other-windows)
  (display-line-numbers-mode -1)
  (logos-focus-mode 1)
  (toggle-frame-maximized))

(defun imacs/create-citar-denote (key entry)
  "Create Note with Denote for Citar"
  (let ((author (cdr (assoc "author" entry)))
	(doi (cdr (assoc "doi" entry)))
	(file (cdr (assoc "file" entry)))
	(title (cdr (assoc "title" entry))))
    (denote key '("research") nil denote-directory nil)
    (if author (org-set-property "Author(s)" author))
    (if doi (org-set-property "DOI" doi))
    (insert "* Files and References\n")
    (when file
      (org-insert-link nil file title)
      (insert "\n")
      (citar-org-insert-citation key))))

(defun imacs/present-mode ()
  "Start a Presentation. Powered by Logos and Olivetti."
  (interactive)
  (logos-focus-mode)
  (logos-narrow-dwim))

(defun imacs/latex-fold-after-save ()
  "Fold the Document after saving"
  (when (equal major-mode 'latex-mode)
    (TeX-fold-buffer)))

(defmacro imacs/after-mode-save (mode func)
  "Register this function as after-save-hook for only the given mode"
  `(add-hook 'after-save-hook #'(lambda ()
				  (when (equal major-mode ,mode)
				    (,func)))))

(defun imacs/magit-full-frame ()
  "Open Magit in a Full Frame"
  (interactive)
  (magit-status)
  (delete-other-windows))

(provide 'custom-functions)
