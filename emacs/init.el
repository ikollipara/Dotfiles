;; Straight Configuration
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
(require 'use-package)

(use-package emacs
  :config
  (recentf-mode 1)
  (set-face-attribute 'default nil :family "FiraCode Nerd Font" :height 140)
  (set-face-attribute 'fixed-pitch nil :family "FiraCode Nerd Font" :height 140)
  (set-face-attribute 'variable-pitch nil :family "Cantarell" :height 150)
  (set-frame-parameter (selected-frame) 'alpha '(80 . 80))
  (load-theme 'modus-vivendi t)
  (defalias 'yes-or-no-p 'y-or-n-p)
  (tool-bar-mode -1)
  (menu-bar-mode -1)
  (scroll-bar-mode -1)
  (electric-pair-mode 1)
  (electric-indent-mode 1)
  (global-prettify-symbols-mode 1)
  (global-display-line-numbers-mode 1)
  (set-fringe-mode 10)
  :bind
  ("C-x C-b" . ibuffer)
  :general
  (ik/leader
    "f f" 'find-file
    "SPC" 'find-file))

(use-package no-littering
  :straight t
  :config (setq auto-save-file-transform `((".*" ,(no-littering-expand-var-file-name "auto-save/") t))))

(use-package eshell
  :straight t
  :hook (eshell-mode . (lambda () (display-line-numbers-mode 0))))

(use-package exec-path-from-shell
  :straight t
  :init (exec-path-from-shell-initialize))

(use-package evil
  :straight t
  :init
  (setq evil-want-integration t
	evil-want-keybinding nil
	evil-disable-insert-state-bindings t)
  :config
  (evil-mode 1))

(use-package evil-collection
  :straight t
  :after evil
  :init (evil-collection-init))

(use-package evil-surround
  :straight t
  :after evil
  :init (global-evil-surround-mode 1))

(use-package general
  :straight t
  :after evil
  :config
  (general-create-definer ik/leader
    :keymaps '(normal visual)
    :prefix "SPC"
    :global-prefix "C-c")
  (general-create-definer ik/local-leader
    :keymaps '(normal visual)
    :prefix "SPC m"
    :global-prefix "C-c m"))

(use-package vertico
  :straight t
  :init (vertico-mode 1))

(use-package marginalia
  :straight t
  :init (marginalia-mode 1))

(use-package orderless
  :straight t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package consult
  :straight t
  :bind (([remap switch-to-buffer] . consult-buffer)
	 ("C-s" . consult-line))
  :general
  (ik/leader
    "/" 'consult-line))

(use-package jinx
  :straight (:host github :repo "minad/jinx")
  :hook (emacs-startup . global-jinx-mode)
  :bind ([remap ispell-word] . jinx-correct))

(use-package all-the-icons :straight t)

(use-package all-the-icons-completion
  :straight t
  :after all-the-icons
  :init (all-the-icons-completion-mode 1))

(use-package all-the-icons-ibuffer
  :straight t
  :after all-the-icons
  :hook (ibuffer-mode . all-the-icons-ibuffer-mode))

(use-package dirvish
  :straight t
  :hook
  (dired-mode . (lambda () (display-line-numbers-mode 0)))
  (dirvish-mode . dirvish-side-follow-mode)
  :init (dirvish-override-dired-mode)
  :config
  (setq dirvish-attributes '(vc-state all-the-icons git-msg file-size))
  :bind ("C-x j" . dirvish-dwim)
  :general
  (ik/leader
    "o -" 'dirvish-dwim
    "p t" 'dirvish-side))

(use-package doom-modeline
  :straight t
  :after all-the-icons
  :init
  (display-time-mode 1)
  (doom-modeline-mode +1))

(use-package helpful
  :straight t
  :hook (helpful-mode . (lambda () (display-line-numbers-mode 0)))
  :bind (([remap describe-function] . helpful-callable)
	 ([remap describe-key] . helpful-key)
	 ([remap describe-command] . helpful-command)
	 ([remap describe-variable] . helpful-variable)
	 ([remap describe-symbol] . helpful-symbol)))

(use-package markdown-mode
  :straight t
  :mode ("README\\.md\\'" . gfm-mode)
  :hook (markdown-mode . (lambda () (display-line-numbers-mode 0)))
  :bind (:map markdown-mode-map ("C-c C-e" . markdown-do))
  :general
  (ik/local-leader
    :keymaps 'markdown-mode-map
    "m" 'markdown-do))

(use-package obsidian
  :straight t
  :hook
  (obsidian-mode . (lambda () (display-line-numbers-mode 0)))
  :config
  (obsidian-specify-path "~/Dropbox/Notes")
  (global-obsidian-mode t)
  :custom
  (obsidian-capture-directory "+Inbox")
  :bind
  (("C-c n c" . obsidian-capture)
   :map obsidian-mode-map
   ("C-c C-o" . obsidian-follow-link-at-point)
   ("C-c C-b" . obsidian-backlink-jump)
   ("C-c C-l" . obsidian-insert-wikilink))
  :general
  (ik/leader
    "n f" 'obsidian-jump)
  (ik/local-leader
    :keymaps 'obsidian-mode-map
    "o" 'obsidian-follow-link-at-point
    "b" 'obsidian-backlink-jump
    "l" 'obsidian-insert-wikilink))

(use-package pdf-tools
  :straight t
  :magic ("%PDF" . pdf-view-mode)
  :config
  (add-hook 'pdf-view-mode-hook #'(lambda () (display-line-numbers-mode 0))))

(use-package f :straight t)

(use-package citar
  :straight t
  :after obsidian
  :config
  (setq citar-bibliography "~/Documents/References.bib"
	citar-notes-path "~/Dropbox/Notes/Sources/Literature Notes")
  (defvar citar-indicator-files-icons
    (citar-indicator-create
     :symbol (all-the-icons-faicon
              "file-o"
              :face 'all-the-icons-green
              :v-adjust -0.1)
     :function #'citar-has-files
     :padding "  " ; need this because the default padding is too low for these icons
     :tag "has:files"))

  (defvar citar-indicator-links-icons
    (citar-indicator-create
     :symbol (all-the-icons-octicon
              "link"
              :face 'all-the-icons-orange
              :v-adjust 0.01)
     :function #'citar-has-links
     :padding "  "
     :tag "has:links"))

  (defvar citar-indicator-notes-icons
    (citar-indicator-create
     :symbol (all-the-icons-material
              "speaker_notes"
              :face 'all-the-icons-blue
              :v-adjust -0.3)
     :function #'citar-has-notes
     :padding "  "
     :tag "has:notes"))

  (defvar citar-indicator-cited-icons
    (citar-indicator-create
     :symbol (all-the-icons-faicon
              "circle-o"
              :face 'all-the-icon-green)
     :function #'citar-is-cited
     :padding "  "
     :tag "is:cited"))

  (setq citar-indicators
	(list citar-indicator-files-icons
              citar-indicator-links-icons
              citar-indicator-notes-icons
              citar-indicator-cited-icons))

  (defun ik/start-literature-review (key &optional entry)
    (interactive (list (citar-select-ref)))
    (let* ((entry (or entry (citar-get-entry key)))
	   (filepath (concat "~/Dropbox/Notes/Sources/Literature Notes/@" key ".md"))
	   (buffer (find-file filepath)))
      (with-current-buffer buffer
	(when (or (not (f-exists-p filepath)) (f-empty-p filepath))
	  (message "Here")
	  (insert
	   (concat "---\ntype:paper\ntitle: "
		   (or (cdr(assoc "title" entry)) "") "\nauthors: "
		   (or (cdr(assoc "author" entry)) "") "\nyear: "
		   (or (cdr(assoc "date" entry)) "") "\ntags: []\n---")))
	(split-window-horizontally)
	(citar-open-files key)))))

(use-package apheleia
  :straight t
  :hook (after-init . apheleia-global-mode)
  :commands apheleia-format-buffer
  :config
  (setf (alist-get 'emacs-lisp-mode apheleia-mode-alist) '(lisp-indent))
  :general
  (ik/local-leader
    "f" 'apheleia-format-buffer))

(use-package company
  :straight t
  :hook (after-init . global-company-mode)
  :config
  (use-package company-box
    :straight t
    :hook (company-mode . company-box-mode)))

(use-package lsp-mode
  :straight t
  :commands (lsp lsp-deferred)
  :init (setq lsp-keymap-prefix "SPC l")
  :config
  (use-package lsp-ui
    :straight t
    :commands lsp-ui))

(use-package tree-sitter
  :straight t
  :hook (tree-sitter-after-on . tree-sitter-hl-mode)
  :config
  (global-tree-sitter-mode)
  (use-package tree-sitter-langs
    :straight t
    :after tree-sitter))

(use-package web-mode
  :straight t
  :hook (web-mode . lsp-deferred)
  :init (add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
  :config (setq web-mode-enable-auto-closing t))

(use-package nix-mode
  :straight t
  :hook (nix-mode . lsp-deferred)
  :mode "\\.nix\\'")

(use-package typescript-mode
  :straight t
  :hook (typescript-mode . lsp-deferred))

(use-package haskell-mode
  :straight t)

(use-package elm-mode
  :straight t)

(use-package tempel
  :straight t
  :init
  (defun tempel-setup-capf ()
    ;; Add the Tempel Capf to `completion-at-point-functions'.
    ;; `tempel-expand' only triggers on exact matches. Alternatively use
    ;; `tempel-complete' if you want to see all matches, but then you
    ;; should also configure `tempel-trigger-prefix', such that Tempel
    ;; does not trigger too often when you don't expect it. NOTE: We add
    ;; `tempel-expand' *before* the main programming mode Capf, such
    ;; that it will be tried first.
    (setq-local completion-at-point-functions
                (cons #'tempel-expand
                      completion-at-point-functions)))

  (add-hook 'prog-mode-hook 'tempel-setup-capf)
  (add-hook 'text-mode-hook 'tempel-setup-capf)
  :bind (:map tempel-map
	      ("C-n" . tempel-next))
  :general
  (:states '(insert emacs)
	   "TAB" 'tempel-complete))

(use-package vterm
  :straight t
  :hook (vterm-mode . (lambda () (display-line-numbers-mode 0)))
  :general
  (ik/leader
    "o t" 'vterm-other-window))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(warning-suppress-types '((comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
