;;; macros.el --- Macro Helpers
;;; Commentary:
;; This is a collection of helpers that I
;; use throughout the configuration.
;;
;;; Code:

(defmacro ik/defmodule (name &rest body)
    "Wrapper for 'straight-use-package'.
NAME: The name of the package, unquoted.
BODY: The body of the module."
    `((lambda () (straight-use-package ',name)
    (require ',name)
    ,@body)))

(provide 'macros)
;;; macros.el ends here
