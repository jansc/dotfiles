;; -*-mode: emacs-lisp -*-
;;=====================================================================
;; emacs.el --- Emacs configuration file

;; Author: Jan Schreiber <jan@mecinus.com>
;; Emacsen Compatibility: Emacs24

;; Based on .emacs by Chris McMahan <cmcmahan@gmail.com>

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of version 2 of the GNU General Public License
;; as published by the Free Software Foundation.

;; This file is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
;; General Public License for more details.

;; I'm sure you already have many copies of the GPL on your machine.
;; If you're using GNU Emacs, try typing C-h C-c to bring it up. If
;; you're using XEmacs, C-h C-l does this.

;;=====================================================================
;; set up the environment
(defconst HOME_DIR "~/")

(defconst EMACS_CONFIGS "~/elisp"
  "Directory for the emacs pkgs and configuration files.
 Default uses `HOME_DIR' as a prefix")

(add-to-list 'load-path "~/elisp")

(defvar MY_DEFAULT_WIDTH 130)

;; Specify where backup files are stored
(setq backup-directory-alist (quote ((".*" . "~/.backups"))))

(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)
  (package-initialize)
  )

;;=====================================================================
;; Set the environment (OSX or Cygwin)
(defun is-darwin ()
  "true if OSX, false if otherwise"
  (eq system-type 'darwin))

(defun is-linux ()
  "true if linux, false if otherwise"
  (eq system-type 'gnu/linux))

;; (if (is-darwin)
;;  (progn
;;    (require 'exec-path-from-shell)
;;    (exec-path-from-shell-initialize))
;;  (require 'emacs-cygwin))

;;=====================================================================
;; select your preferred programs for html and media here
;; Mac OS X
(if (is-darwin)
    (progn
      (defconst MEDIA_PLAYER "/Applications/VLC.app/"
        "Media Player program, video and streaming audio")
      (defconst FIREFOX_PRG "/Applications/Firefox.app"
        "points to the Mozilla Firefox location")
      (defconst SAF_PRG "/Applications/Safari/Safari.app"
        "points to the Internet Explorer Mozilla Firefox location")
      (defconst CHROME_PRG "/Applications/Google\\ Chrome.app"
        "points to the Google Chrome browser location")
      (defconst BROWSER FIREFOX_PRG
        "set the default browser to use within emacs")))

(if (is-linux)
    (progn
      (defconst FIREFOX_PRG "/usr/bin/firefox"
        "points to the Mozilla Firefox location")))

; set the location of firefox for the browse-url-package
(setq browse-url-firefox-program FIREFOX_PRG)
(setq browse-url-firefox-new-window-is-tab 1)

(if (is-linux)
  (add-to-list 'load-path "/usr/share/emacs/site-lisp/"))

;;=====================================================================
;; various startup settings

;; prevent new frames in emacsclient on darwin
(if (is-darwin)
    (setq ns-popup-frames nil))

;;==============================
;; size, colors and fonts
;; abcedfghijklmnopqrstuvwxyz
;; ABCEDFGHIJKLMNOPQRSTUVWXYZ
;; 0123456789
(setq default-frame-alist
      '((menu-bar-lines . 0)
	(tool-bar-lines . 0)
        (width . 130)
        (height . 50)))

(setq initial-frame-alist
      '((menu-bar-lines . 0)
	(tool-bar-lines . 0)
        (width . 130)
        (height. 50)
        (alpha 100 100)))     ; focus background

;;=====================================================================
;; Automatically install packages defined in 'package-list
;; Temporarily removed mu4e-maildirs-extension and magit
(setq package-list '(ace-jump-mode ac-php erc evil ledger-mode org-present php-mode php-extras tramp twittering-mode ido rust-mode tide company elfeed one-themes slime slime-company paredit))
;; TODO: After install on fedora 26, the following packages where missing:
;; mu4e-maildirs-extension and which-key

;; System-dependend packages
(if (is-darwin)
  (add-to-list 'package-list 'dash-at-point))
(if (is-linux)
  (add-to-list 'package-list 'zeal-at-point))

; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; TODO Packages that seem interesting, but that are not yet configured:
;; editorconfig-emacs: https://github.com/editorconfig/editorconfig-emacs

;;=====================================================================
;; Load the customize configurations files
;;(require 'emacs-macros)       ; various macros and functions
;(require 'emacs-ac)            ; autocomplete configurations
(require 'emacs-evil)          ; VIM mode
(require 'emacs-ace-jump)      ; Easier navigation with ace-jump-mode
                               ; NB: ace-jump has to be included after emacs-evil

(if (is-darwin)
    (require 'emacs-dash))      ; Integration of Dash (on OXS).
(if (is-linux)
    (require 'emacs-zeal))	; Integration of Zeal (on Linux)


(require 'emacs-erc)            ; IRC client
(require 'emacs-company)        ; Company-mode for autocompletion
(require 'emacs-elfeed)         ; RSS-reader
(require 'emacs-ido)            ; buffer matching
(require 'emacs-misc)           ; various settings
(require 'emacs-magit)
(require 'emacs-tide)           ; typescript mode
(require 'emacs-tramp)          ; remote file access
(require 'emacs-org)            ; org mode settings
(require 'emacs-org-reveal)     ; mode for creating presentations within org-mode
;;(require 'emacs-csv)          ; comma-separated-value editing package
;;(require 'emacs-sql)          ; database interaction
(require 'emacs-paredit)        ; 
(require 'emacs-mu4e)           ; email reader
(require 'emacs-rust)           ; rust mode
(require 'emacs-ui)             ; theme, fonts, modeline and eye candy
(require 'emacs-which-key)      ; short cuts

;; TODO: Move to separate file
;(add-to-list 'load-path "~/.silver-brain/emacs/")
;(require 'use-package)
;(use-package silver-brain
;  :init
;  ;; The port of back-end server. Does NOT affect server side.
;  (setq silver-brain-server-port 5000)
;  :bind
;  ("C-c b" . silver-brain))

;;=====================================================================
;; some reference stuff
;; Flash a message in the echo area. This works well for debugging an
;; .emacs file by placing various messages throughout
;;(message "Hello, this is .emacs speaking")
;;(sit-for 3) ; 3 seconds
;;
;; set a break point in elisp by adding this:
;;(debug)

;;======================================================================
;; Local variables

(if (and (fboundp 'server-running-p) 
         (not (server-running-p)))
   (server-start))

;Local Variables:
;indent-tabs-mode: nil
;allout-layout: (-1 : 0)
;End:

(provide 'emacs)
