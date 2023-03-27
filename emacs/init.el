;;; init.el --- Personal Emacs Config
;;; Commentary:
;; Ian Kollipara
;; 2023.03.21
;; This is my personal Emacs Configuration.
;; I am rebuilding it from the ground up to be used again as
;; my primary editor.  I stopped using it for a while, but
;; I missed the power of Emacs, and so I am rebuilding this
;; configuration.  Expect changes!
;;; Code:

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

(straight-use-package 'no-littering)
(require 'no-littering)
(setq auto-save-file-name-transforms `((".*" ,(no-littering-expand-var-file-name "auto-save/") t)))

(straight-use-package 'use-package)

(add-to-list 'load-path "~/.config/emacs/lisp/")
(require 'base)
(require 'ik-evil)
(require 'minad)
(require 'ui)
(require 'lsp-config)
(require 'academia)
(require 'editor)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(warning-suppress-log-types '((comp)))
 '(warning-suppress-types '((lsp-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
