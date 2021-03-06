;;;; Config.el
;;; Ian Kollipara
;;; Personal Emacs Config

;;;; Package Intialization 
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;;;; Package Installation

(add-to-list 'load-path (concat user-emacs-directory "lisp"))
(require 'custom-functions)
(require 'imacs-base)
(require 'imacs-completion)
(require 'imacs-org)
(require 'imacs-org-present)
(require 'imacs-python)
(require 'imacs-clojure)
(require 'imacs-go)
(require 'imacs-web)
(require 'imacs-latex)
(require 'imacs-research)
(require 'imacs-evil)
(require 'imacs-utils)
(require 'imacs-vc)
(require 'imacs-keybinds)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(warning-suppress-log-types '((comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
