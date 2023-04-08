;;; ik-evil.el --- Evil Setup
;;; Commentary:
;; Handling of Evil Keybinds
;; (Sue Me, I like VIM bindings)
;;
;;; Code:

(defmacro ik/go-to-directory (directory)
  `(lambda () (interactive) (find-file ,directory)))

(use-package evil
  :straight t
  :init
  (setq evil-want-integration t
	evil-want-keybinding nil
	evil-disable-insert-state-bindings t)
  :config
  (evil-mode +1))

(use-package evil-collection
  :straight t
  :after evil
  :config (evil-collection-init))

(use-package evil-surround
  :straight t
  :after evil
  :init (global-evil-surround-mode +1))

(use-package general
  :straight t
  :after evil
  :config
  (general-create-definer ik/leader
    :keymaps '(visual normal emacs)
    :prefix "SPC"
    :global-prefix "C-c")
  (ik/leader
    "SPC" 'find-file
    "f s" 'save-buffer
    "b d" 'kill-this-buffer
    "b i" 'ibuffer
    "g s" (ik/go-to-directory "~/Dropbox/School/Undergraduate - Concordia - 2019-2023/Senior Year - 2022-23/Spring Term - 2023/")
    "g D" (ik/go-to-directory "~/Documents/Dotfiles/")
    "g p" (ik/go-to-directory "~/Documents/Projects/")
    "o e" 'eshell
    "p p" 'project-switch-project))

(provide 'ik-evil)
;;; ik-evil.el ends here
