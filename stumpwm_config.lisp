;;; -*- mode: lisp; -*-
(in-package :stumpwm)

(when stumpwm:*initializing*
  (stumpwm:run-shell-command "~/.dropbox-dist/dropboxd")
  (stumpwm:run-shell-command "picom")
  (stumpwm:run-shell-command "nitrogen --restore"))

;;; Imports
(ql:quickload :slynk)
(ql:quickload :clx-truetype)
(stumpwm:load-module "swm-gaps")
(stumpwm:load-module "battery-portable")
(stumpwm:load-module "wifi")
(stumpwm:load-module "ttf-fonts")

;;; Commands
;;; These are custom commands for Stumpwm

(defcommand hsplit-and-focus () ()
  "Split the view horizontally and focus on the new window"
  (hsplit)
  (move-focus :left))

(defcommand vsplit-and-focus () ()
  "Split the view vertically and focus on the new window"
  (vsplit)
  (move-focus :up))

(defcommand obsidian () ()
  "Run Obsidian"
  (run-shell-command "flatpak run md.obsidian.Obsidian"))

(defcommand zotero () ()
  "Run Zotero"
  (run-shell-command "flatpak run org.zotero.Zotero"))

(defcommand notes () ()
  "Create Notes Group for use in note writing"
  (stumpwm:gnew "Notes")
  (stumpwm:run-commands "zotero")
  (stumpwm:run-commands "obsidian"))

(defcommand only-office () ()
  "Run OnlyOffice"
  (run-shell-command "flatpak run org.onlyoffice.desktopeditors"))

(defcommand pkg-install (pkg) (:string "Pkg Name: ")
  (run-shell-command (concatenate 'string "aura --no-confirm -S " pkg)))


(defparameter *stumpwm-slynk-session* nil)

(defcommand start-slynk () ()
  "Start Slynk for use in Emacs"
  (handler-case
      (defparameter *stumpwm-slynk-session*
        (slynk:create-server
         :dont-close t
         :port slynk::default-server-port))
    (error (c)
      (format *error-output* "Error starting slynk: ~a~%" c))))

(defcommand restart-slynk () ()
  "Restart the Slynk server if any issues arise"
  (slynk:stop-server slynk::default-server-port)
  (slynk:create-server :port slynk::default-server-port :dont-close t))

(defcommand select-wallpaper () ()
    (stumpwm:run-shell-command "nitrogen ~/Pictures/Wallpapers/"))

;;; Keybinds

(stumpwm:set-prefix-key
 (stumpwm:kbd "s-space"))

(stumpwm:define-key stumpwm:*top-map* (stumpwm:kbd "s-h") "move-focus left")
(stumpwm:define-key stumpwm:*top-map* (stumpwm:kbd "s-l") "move-focus right")
(stumpwm:define-key stumpwm:*top-map* (stumpwm:kbd "s-k") "move-focus up")
(stumpwm:define-key stumpwm:*top-map* (stumpwm:kbd "s-j") "move-focus down")

(stumpwm:define-key stumpwm:*top-map* (stumpwm:kbd "s-M-h") "move-window left")
(stumpwm:define-key stumpwm:*top-map* (stumpwm:kbd "s-M-l") "move-window right")
(stumpwm:define-key stumpwm:*top-map* (stumpwm:kbd "s-M-j") "move-window down")
(stumpwm:define-key stumpwm:*top-map* (stumpwm:kbd "s-M-k") "move-window up")

(stumpwm:define-key stumpwm:*top-map* (stumpwm:kbd "s-w") "brave")
(stumpwm:define-key stumpwm:*top-map* (stumpwm:kbd "s-RET") "exec alacritty")

(stumpwm:define-key stumpwm:*root-map* (stumpwm:kbd "R") "iresize")
(stumpwm:define-key stumpwm:*root-map* (stumpwm:kbd "r") "remove")
(stumpwm:define-key stumpwm:*root-map* (stumpwm:kbd "s") "vsplit-and-focus")
(stumpwm:define-key stumpwm:*root-map* (stumpwm:kbd "S") "hsplit-and-focus")

(setf stumpwm:*message-window-gravity* :center
      stumpwm:*message-window-input-gravity* :center
      stumpwm:*input-window-gravity* :center)

;;; Mode-Line

(stumpwm:grename "Home")
(setf swm-gaps:*inner-gaps-size* 5)
(swm-gaps:toggle-gaps-on)

(stumpwm:set-font (make-instance 'xft:font :family "Fira Code Retina" :subfamily "Regular" :size 12))
(stumpwm:toggle-mode-line (stumpwm:current-screen) (stumpwm:current-head))

(setf stumpwm:*time-modeline-string* "%I:%m %p | %a %b %e, %Y"
      wifi:*wifi-modeline-fmt* "%e"
      stumpwm:*screen-mode-line-format*
      (list "[%n]"
            "^>"
            "%d | "
            "%B | "
            "%I"))

(defcommand brave () ()
  (stumpwm:run-shell-command "brave"))
