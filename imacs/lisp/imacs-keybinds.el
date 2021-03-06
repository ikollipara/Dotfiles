;;;; imacs-keybinds.el
;;; Ian Kollipara
;;; Personal Keybinds

(straight-use-package 'general)

(require 'general)
(general-create-definer imacs/leader :prefix "SPC" :global-prefix "C-c")
(general-create-definer imacs/local-leader :prefix "SPC m" :global-prefix "C-c m")

(general-define-key :states '(normal motion) "/" #'consult-line)

(imacs/leader
  :states '(normal visual)
  :keymaps 'override
  ";" #'eval-expression

  "f f" #'find-file
  "f r" #'consult-recent-file
  "f P" #'imacs/list-config-dir

  "w l" #'windmove-right
  "w h" #'windmove-left
  "w j" #'windmove-down
  "w k" #'windmove-up
  "w V" #'imacs/split-window-right-and-follow
  "w S" #'imacs/split-window-below-and-follow
  "w s" #'split-window-below
  "w v" #'split-window-right
  "w d" #'delete-window
  "w D" #'delete-other-windows

  "t F" #'toggle-frame-fullscreen
  "t M" #'toggle-frame-maximized
  "t w" #'toggle-word-wrap
  "t z" #'logos-focus-mode

  "g c" #'org-clock-goto

  "o e" #'eshell
  "o -" #'dired-jump
  "o t" #'vterm
  "o g" #'imacs/magit-full-frame

  "c c" #'consult-flycheck

  "b d" #'kill-current-buffer
  "b n" #'next-buffer
  "b p" #'previous-buffer
  "b b" #'consult-buffer

  "n f" #'imacs/list-org-dir
  "n c" #'org-capture
  "n a" #'imacs/display-gtd-view
  "n n" #'imacs/display-next-actions
  "n A" #'org-agenda

  "d f" #'imacs/denote-list-dir
  "d n" #'denote

  "r f" #'biblio-lookup
  "r a" #'biblio-arxiv-lookup
  "r e" #'biblio-ieee-lookup
  "r d" #'biblio-dissemin-lookup

  "SPC" #'projectile-find-file
  "p a" #'projectile-add-known-project
  "p p" #'projectile-switch-project
  "p b" #'projectile-ibuffer
  "p d" #'projectile-remove-known-project

  "i t" #'tempel-insert
  "i c" #'tempel-complete)

(general-define-key :states '(insert emacs) "TAB" #'tempel-expand)

(general-define-key
 [remap narrow-to-region] #'logos-narrow-dwim
 [remap forward-page] #'logos-forward-page-dwim
 [remap backward-page] #'logos-backward-page-dwim)

(imacs/local-leader
  :states '(normal visual motion)
  :keymaps 'emacs-lisp-mode-map
  "e r" #'eval-defun
  "e r" #'eval-region
  "e b" #'eval-buffer
  "e e" #'eval-last-sexp)

(imacs/local-leader
  :states '(normal visual motion)
  :keymaps 'org-mode-map
  "A" #'org-archive-subtree
  "t" #'org-todo
  "/" #'consult-org-heading
  "@" #'citar-insert-citation
  "c i" #'org-clock-in
  "c o" #'org-clock-out
  "c j" #'org-clock-goto
  "n l" #'denote-link
  "n b" #'denote-link-backlinks
  "n n" #'denote)

(imacs/local-leader
  :states '(normal visual motion)
  :keymaps 'LaTeX-mode-map
  "@" #'citar-insert-citation
  "C" #'TeX-command-master
  "/" #'reftex-toc
  "x" #'flyspell-auto-correct-word)

(imacs/local-leader
  :states '(normal visual motion)
  :keymaps 'python-mode-map
  "p" #'poetry)

(imacs/local-leader
  :states '(normal visual motion)
  :keymaps 'jinja2-mode-map
  "t" #'jinja2-insert-tag
  "v" #'jinja2-insert-var
  "n" #'sgml-tag)

(general-define-key
 :keymaps 'minibuffer-local-map
 "C-j" #'(lambda () (interactive) (imacs/calendar-move 'down))
 "C-k" #'(lambda () (interactive) (imacs/calendar-move 'up))
 "C-h" #'(lambda () (interactive) (imacs/calendar-move 'left))
 "C-l" #'(lambda () (interactive) (imacs/calendar-move 'right)))

(general-define-key
 :keymaps 'dired-mode-map
 :states '(normal visual motion)
 "n r" #'denote-dired-rename-file
 "n n" #'denote
 "p n" #'imacs/create-projectile-project)

(general-define-key
 :keymaps 'pdf-view-mode-map
 :states '(normal visual motion)
 "a" #'org-noter)

(general-define-key
 :keymaps 'tempel-map
 "C-SPC" #'tempel-next)

(general-define-key
 :keymaps 'LaTeX-mode-map
 "C-c c" #'citar-insert-citation)

(general-define-key
 :keymaps 'org-mode-map
 "C-c C-j" #'org-insert-item)

(general-define-key
 :keymaps 'org-mode-map
 :states '(normal visual)
 "RET" #'org-open-at-point)

(general-define-key
 :keymaps 'biblio-selection-mode-map
 "j" #'biblio--selection-next
 "k" #'biblio--selection-previous
 "h" #'evil-backward-char
 "l" #'evil-forward-char
 "H" #'biblio--selection-help)

(general-define-key "C-x g" #'imacs/magit-full-frame)

(provide 'imacs-keybinds)
