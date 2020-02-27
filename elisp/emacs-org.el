; org-mode og reminder
(require 'epa-file)
(epa-file-enable)
(require 'org-install)
(require 'ox-confluence) ; From org-contrib
(with-eval-after-load 'ox
  (require 'ox-hugo))

(require 'org-crypt)
(org-crypt-use-before-save-magic)
(setq org-tags-exclude-from-inheritance (quote ("crypt")))

;; GPG key to use for encryption
;; Either the Key ID or set to nil to use symmetric encryption.
(setq org-crypt-key "jan@mecinus.com")

(defvar org-journal-dir "/home/jans/Sync/Journal/") 
(defvar org-journal-enable-encryption "1")
(require 'org-journal)

(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

;(setq org-agenda-files (list "~/org/gtd" ))
;(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb) ; FIXME conflicts with org-brain

;; Set to the location of your Org files on your local system
(setq org-directory "~/Sync/org-files")

;; mobileorg is no longer in use as of july 2019
;; Set to the name of the file where new notes will be stored
;(setq org-mobile-inbox-for-pull "~/Dropbox/org-files/flagged.org")

;; Set to <your Dropbox root directory>/MobileOrg.
;(setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")

(setq org-default-notes-file (concat org-directory "/notes.org"))
(setq org-hide-leading-stars t)
;(setq org-odd-levels-only t)

(setq org-tags-column -100)
(setq org-blank-before-new-entry nil)

(setq org-export-coding-system 'utf-8)

;(setq org-deadline-warning-days 2)
;(setq org-agenda-skip-deadline-if-done t)
;(setq org-agenda-skip-scheduled-if-done nil)

;; == Tags ==
;; Allow setting single tags without the menu
(setq org-fast-tag-selection-single-key 'expert)

;; Include the todo keywords
(setq org-fast-tag-selection-include-todo t)

;; == Custom State Keywords ==
(setq org-use-fast-todo-selection t)
(setq org-todo-keywords
      '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
	(sequence "WAITING(w@/!)" "INACTIVE(i)" "|" "CANCELLED(c@/!)" "MEETING")))
;; Custom colors for the keywords
(setq org-todo-keyword-faces
      '(("TODO" :foreground "red" :weight bold)
	("NEXT" :foreground "blue" :weight bold)
	("DONE" :foreground "forest green" :weight bold)
	("WAITING" :foreground "orange" :weight bold)
	("INACTIVE" :foreground "magenta" :weight bold)
	("CANCELLED" :foreground "forest green" :weight bold)
	("MEETING" :foreground "forest green" :weight bold)))
;; Auto-update tags whenever the state is changed
(setq org-todo-state-tags-triggers
      '(("CANCELLED" ("CANCELLED" . t))
	("WAITING" ("WAITING" . t))
	("INACTIVE" ("WAITING") ("INACTIVE" . t))
	("DONE" ("WAITING") ("INACTIVE"))
	("TODO" ("WAITING") ("CANCELLED") ("INACTIVE"))
	("NEXT" ("WAITING") ("CANCELLED") ("INACTIVE"))
	("DONE" ("WAITING") ("CANCELLED") ("INACTIVE"))))

;; == Refiling ==
(setq org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9))))
;;  Be sure to use the full path for refile setup
(setq org-refile-use-outline-path t)
(setq org-outline-path-complete-in-steps nil)

;; Allow refile to create parent tasks with confirmation
(setq org-refile-allow-creating-parent-nodes 'confirm)

;(setq org-clock-persist t)
;(setq org-clock-in-resume t)
;(org-clock-persistence-insinuate)

;; Start week on monday
(setq org-agenda-start-on-weekday nil)

;; Files to search for TODOs and scheduled items. 
(setq org-agenda-files (list (concat org-directory "/todo.org")
                             (concat org-directory "/gtd.org")
                             (concat org-directory "/gtd-private.org")
                             (concat org-directory "/google.org")
                             (concat org-directory "/")))

;;(setq org-enforce-todo-dependencies t)

;; Capture, see http://orgmode.org/manual/Setting-up-capture.html#Setting-up-capture)
(define-key global-map "\C-cc" 'org-capture)
(setq org-capture-templates
      '(("t" "Todo Work" entry
         (file+headline (lambda () (concat org-directory "/gtd.org")) "Tasks")
         "* TODO %?\n  %i\n  %a")
        ("p" "Todo Private" entry
         (file+headline (lambda () (concat org-directory "/gtd-private.org")) "Tasks")
         "* TODO %?\n  %i\n  %a")
        ("m" "Meeting" entry (file org-default-notes-file)
         "* MEETING with %? :MEETING:\n** Agenda:\n*** \n\n** Summary:\n*** \n" :clock-in t :clock-resume t)
        ("i" "Idea" entry (file org-default-notes-file)
         "* %? :IDEA: \n%u" :clock-in t :clock-resume t)
        ("j" "Journal" entry
         (file+datetree (lambda () (concat org-directory "/privat/journal.org")))
         "* %?\nEntered on %U\n  %i\n  %a")))

;; Configure org-present-mode
;; https://github.com/rlister/org-present
(eval-after-load "org-present"
  '(progn
     (add-hook 'org-present-mode-hook
               (lambda ()
                 (org-present-big)
                 (org-display-inline-images)
                 (org-present-hide-cursor)
                 (org-present-read-only)))
     (add-hook 'org-present-mode-quit-hook
               (lambda ()
                 (org-present-small)
                 (org-remove-inline-images)
                 (org-present-show-cursor)
                 (org-present-read-write)))))

(setq org-return-follows-link t)

(setq org-link-abbrev-alist
      '(("jira"      . "http://jira.ravn.no/browse/%s")
        ("google"    . "http://www.google.com/search?q=")
        ("gmap"      . "http://maps.google.com/maps?q=%s")
        ("omap"      . "http://nominatim.openstreetmap.org/search?q=%s&polygon=1")))

;;; org-caldav
(require 'auth-source)
(setq auth-sources '("~/.authinfo.gpg" "~/.authinfo" "~/.netrc"))
(setq org-caldav-calendars
  '(; (:calendar-id "work@whatever" :files ("~/org/work.org")
     ;             :inbox "~/org/fromwork.org")
    (:calendar-id "b0076281-0332-4ecf-aef1-0ced83c27fe7y" 
                  :inbox "~/Sync/org-files/calendar-privat.org"
     :files ("~/Sync/org-files/calendar.org"))))
(setq org-caldav-url "https://caldav.fastmail.com/dav/calendars/user/mecinus@fastmail.fm")
                     ;https://caldav.fastmail.com/dav/calendars/user/mecinus@fastmail.fm/69653928-2c6d-40e4-b3ad-9ebae4d17f21/
;(setq org-caldav-calendar-id "69653928-2c6d-40e4-b3ad-9ebae4d17f21")
;(setq org-caldav-calendar-id "b0076281-0332-4ecf-aef1-0ced83c27fe7y")
(setq org-icalendar-timezone "Europe/Berlin")
(provide 'emacs-org)
