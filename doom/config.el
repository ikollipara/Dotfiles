;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Ian Kollipara"
      user-mail-address "ian.kollipara@cune.org")

(setq doom-font (font-spec :family "FiraCode Nerd Font" :size 20)
      doom-variable-pitch-font (font-spec :family "Cantarell" :size 20)
      doom-big-font (font-spec :family "Cantarell" :size 30))

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-palenight)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Dropbox/Org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how

(defvar ik/frame-transparency '(90 . 90))

(set-frame-parameter (selected-frame) 'alpha ik/frame-transparency)
(add-to-list 'default-frame-alist `(alpha . ,ik/frame-transparency))


(require 'smtpmail)
(set-email-account! "cune.org"
        '((mu4e-sent-folder . "/[Gmail].Sent Mail")
          (mu4e-trash-folder . "/[Gmail].Trash")
          (mu4e-refile-folder . "/[Gmail].All Mail")
          (mu4e-starred-folder . "/[Gmail].Starred")
          (smtpmail-smtp-user . "ian.kollipara@cune.org")
          (smtpmail-smtp-server . "smtp.gmail.com")
          (smtpmail-smtp-service . 587)
          (mu4e-compose-signature . "Sincerely,\nIan"))
        t)

(after! mu4e
  (setq +mu4e-gmail-accounts '(("ian.kollipara@cune.org" . "/cune"))
        mu4e-index-cleanup t
        mu4e-index-lazy-check t))

(setq! bibtex-completion-bibliography '("/home/ikollipara/Dropbox/Zettlekasten/My Library.bib")
       citar-bibliography '("/home/ikollipara/Dropbox/Zettlekasten/My Library.bib")
       reftex-default-bibliograpy "/home/ikollipara/Dropbox/Zettlekasten/My Library.bib")

(add-hook! 'python-mode-hook (modify-syntax-entry ?_ "w"))

(after! org
  (setq org-hide-emphasis-markers t))

(setq +latex-viewers '(pdf-tools))

(after! org-journal
  (setq org-journal-dir "/home/ikollipara/Dropbox/REU/UTD/Research/Research Journal"
        org-journal-date-format "%x - %A"))


(after! smudge
 (setq smudge-oauth2-client-id "08be6f422d0d486eadbe9207f0eda57c")
 (setq smudge-oauth2-client-secret "f4f560fce2ca42e0bef597a3e4451f96")
 (setq smudge-transport 'connect)
 (map! :leader
       (:prefix ("S" . "Smudge")
        :desc "Toggle Shuffle" "s" #'smudge-controller-toggle-shuffle
        :desc "Toggle Repeat" "r" #'smudge-controller-toggle-repeat
        :desc "Play/Pause" "p" #'smudge-controller-toggle-play
        :desc "Next Track" ">" #'smudge-controller-next-track
        :desc "Prev Track" "<" #'smudge-controller-previous-track
        (:prefix ("P" . "playlist")
         :desc "My Playlists" "m" #'smudge-my-playlists
         :desc "Featured Playlists" "f" #'smudge-featured-playlists
         :desc "Search Playlists" "s" #'smudge-playlist-search)
        (:prefix ("t" . "track")
         :desc "Recently Played" "r" #'smudge-recently-played
         :desc "Search Track" "s" #'smudge-track-search))))


(add-hook! (org-mode-hook latex-mode-hook) #'citar-refresh)

(after! doom-modeline
  (setq display-time-day-and-date t)
  (display-battery-mode 1)
  (display-time-mode 1))

(defun wifi-string ()
  "Get the current network"
  (let ((wifi (shell-command-to-string "nmcli d status | awk '/[^dis]connected/ {print $4}'")))
    (if (equal wifi "")
        "睊 Disconnected"
        (concat "直 " (substring wifi 0 -1)))))

(setq-default header-line-format '(
                                   (" ")
                                   (:eval (capitalize (+workspace-current-name)))
                                   (" | ")
                                   (:eval (wifi-string))))

(setq org-noter-notes-search-path '("~/Dropbox/REU/UTD/Research/Actor Model Design for MCPSs through Rebeca/Notes/"))

(add-to-list '+lookup-provider-url-alist '("Google Scholar" "https://scholar.google.com/scholar?q=%s"))

(map! :map LaTeX-mode-map
      :localleader
      :nvm "@" 'citar-insert-citation
      :nvm "s" 'LaTeX-section
      :nvm "e" 'LaTeX-environment
      :i "C-j" 'LaTeX-insert-item)

(map! :leader
      :nvm "/" 'consult-line)
