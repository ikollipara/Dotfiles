;;;; imacs-utils.el
;;; Ian Kollipara
;;; Personal Utilites Configuration

(straight-use-package 'vterm)
(straight-use-package 'projectile)

(require 'vterm)

(require 'projectile)
(projectile-mode 1)
(setq projectile-generic-command "fd . -0 --type f --color=never")

(provide 'imacs-utils)
