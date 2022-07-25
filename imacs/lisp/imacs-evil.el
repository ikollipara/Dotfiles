;;;; imacs-evil.el
;;; Ian Kollipara
;;; Personal Evil Configuration

(straight-use-package 'evil)
(straight-use-package 'evil-collection)
(straight-use-package 'evil-org)
(straight-use-package 'evil-smartparens)

(setq evil-disable-insert-state-bindings t
      evil-complete-all-buffers nil
      evil-want-keybinding nil)
(require 'evil)
(evil-mode 1)

(require 'evil-collection)
(evil-collection-init)

(require 'evil-org)
(add-hook 'org-mode-hook 'evil-org-mode)
(require 'evil-org-agenda)
(evil-org-agenda-set-keys)

(require 'evil-smartparens)
(add-hook 'smartparens-enabled-hook 'evil-smartparens-mode)

(provide 'imacs-evil)
