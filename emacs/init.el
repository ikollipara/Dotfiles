;; init.el
;; Ian Kollipara
;; 2023.03.21

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)

(use-package no-littering
        :straight t
	:config (setq auto-save-file-name-transforms `((".*" ,(no-littering-expand-var-file-name "auto-save/") t))))

(use-package doom-themes
  :straight t
  :config (load-theme 'doom-palenight t))

(use-package ace-window
  :straight t
  :bind ("M-o" . ace-window)
  :config (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)))

(use-package avy
  :straight t
  :bind ("C-s" . avy-goto-char))

(use-package vertico
  :straight t
  :init (vertico-mode))

(use-package marginalia
  :straight t
  ;; Either bind `marginalia-cycle' globally or only in the minibuffer
  :bind (("M-A" . marginalia-cycle)
         :map minibuffer-local-map
         ("M-A" . marginalia-cycle))

  ;; The :init configuration is always executed (Not lazy!)
  :init

  ;; Must be in the :init section of use-package such that the mode gets
  ;; enabled right away. Note that this forces loading the package.
  (marginalia-mode))

(use-package consult
  :straight t
  :bind (("C-x b" . consult-buffer)
	 ("M-g g" . consult-goto-line)
	 ("M-g M-g" . consult-goto-line)
	 ("M-g m" . consult-mark)
	 ("M-s d" . consult-find)
	 ("M-s b" . consult-locate)
	 ("M-s g" . consult-grep)
	 ("M-s l" . consult-line)
	 ("M-s L" . consult-line-multi)))


;; Optionally use the `orderless' completion style.
(use-package orderless
  :straight t
  :init
  ;; Configure a custom style dispatcher (see the Consult wiki)
  ;; (setq orderless-style-dispatchers '(+orderless-consult-dispatch orderless-affix-dispatch)
  ;;       orderless-component-separator #'orderless-escapable-split-on-space)
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

(use-package all-the-icons
  :straight t)

(use-package all-the-icons-completion
  :straight t
  :hook ((marginalia-mode . all-the-icons-completion-marginalia-setup))
  :init (all-the-icons-completion-mode))

(set-face-attribute 'default nil :font "Fira Code Retina" :height 150)
(global-display-line-numbers-mode 1)
(set-frame-parameter (selected-frame) 'alpha '(90 . 90))
(menu-bar-mode -1)
(tab-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(use-package doom-modeline
  :straight t
  :init (doom-modeline-mode 1))

(use-package smartparens
  :straight t
  :hook ((emacs-lisp . smartparens-strict-mode)))

(use-package tempel
  :straight t
  :bind (("C-c c c" . tempel-complete)
	 ("C-c t l" . tempel-insert))
  :init
  (defun tempel-setup-capf ()
    (setq-local completion-at-point-functions
		(cons #'tempel-expand completion-at-point-functions)))

  (add-hook 'prog-mode-hook 'tempel-setup-capf)
  (add-hook 'text-mode-hook 'tempel-setup-capf)
  :config
  (tempel-key "C-c t u" use emacs-lisp-mode-map))

(use-package company
  :straight t
  :hook (after-init . global-company-mode))

(use-package lsp-mode
  :straight t
  :init (setq lsp-keymap-prefix "C-c l")
  :commands lsp)

(use-package lsp-ui
  :straight t
  :commands lsp-ui-mode)
