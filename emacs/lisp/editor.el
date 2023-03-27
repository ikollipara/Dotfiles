;;; editor.el --- Editor Settings
;;; Commentary:
;; This handles the setup of tooling needed for Programming.
;; This would be things like Treemacs, vterm, project-x,
;; etc.
;;
;;; Code:

(use-package vterm
  :straight t
  :after general
  :hook (vterm-mode . (lambda () (display-line-numbers-mode 0)))
  :bind ("C-c o t" . vterm)
  :general
  (ik/leader
    "o t" 'vterm))

(use-package magit
  :straight t)

(use-package project-x
  :straight (:host github :repo "karthink/project-x")
  :after project
  :config (project-x-mode 1))

(electric-pair-mode 1)

(provide 'editor)
;;; editor.el ends here
