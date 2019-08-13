;; mu4e
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu4e")
(require 'mu4e)
(require 'smtpmail)
(require 'mu4e-maildirs-extension)
(require 'mu4e-contrib)

(mu4e-maildirs-extension)

; Enable citations
;(require 'mu-cite)
;(setq mu4e-cite-function 'mu-cite-original)
;(setq mu-cite-top-format
;    '("On " date ", " from " wrote:\n\n"))
;(setq mu-cite-prefix-format '(" > ")))

(eval-after-load 'mu4e
  '(progn
     (setq
      mu4e-maildir       "~/imap"   ;; top-level Maildir
      mu4e-sent-folder   "/fastmail/INBOX.Sent Items"       ;; folder for sent messages
      mu4e-drafts-folder "/fastmail/INBOX.Drafts"     ;; unfinished messages
      mu4e-trash-folder  "/fastmail/INBOX.Trash"      ;; trashed messages
      mu4e-refile-folder "/fastmail/INBOX.Archive"   ;; saved messages
      mu4e-get-mail-command "offlineimap"
      mu4e-update-interval 300
      mu4e-compose-signature-auto-include nil
      mu4e-headers-auto-update t
      )
     (setq mu4e-user-mail-address-list (list "jan@mecinus.com" "jan.schreiber@gmail.com" "mail@jschreiber.com"))
     ;; include in message with C-c C-w
     ;;(setq message-signature
     ;;"Jan Schreiber\nhttp://www.jschreiber.com\n")

     (defun no-auto-fill ()
       "Turn off auto-fill-mode."
       (auto-fill-mode -1))

     (add-hook 'mu4e-compose-mode-hook #'no-auto-fill)
     ;; spell check
     ;;(add-hook 'mu4e-compose-mode-hook
     ;;          (defun my-do-compose-stuff ()
     ;;            "My settings for message composition."
     ;;            (auto-fill-mode -1))
     ;;            (set-fill-column 72)
     ;;            (flyspell-mode)))

     ;; don't keep message buffers around
     (setq message-kill-buffer-on-exit t) 

     ;; Sending mail
     (setq message-send-mail-function 'smtpmail-send-it
           smtpmail-smtp-server "mail.messagingengine.com"
           smtpmail-debug-info t
           smtpmail-auth-credentials (expand-file-name "~/.authinfo") ;; Later: use GPG file .authinfo.gpg
           smtpmail-default-smtp-server "mail.messagingengine.com"
           smtpmail-local-domain "fastmail.fm"
           user-full-name "Jan Schreiber"
           user-mail-address "jan@mecinus.com"
           gnutls-algorithm-priority "NORMAL:%COMPAT"
           smtpmail-stream-type 'ssl
           smtpmail-smtp-service 465)

     ;; if you need offline mode, set these -- and create the queue dir
     ;; with 'mu mkdir', i.e.. mu mkdir /home/user/Maildir/queue
     ;;smtpmail-queue-mail  nil
     ;;smtpmail-queue-dir  "/home/user/Maildir/queue/cur"

     (setq mml2015-use 'epg)
     (setq mu4e-attachment-dir  (expand-file-name "~/Nedlastinger"))
     (setq mu4e-maildir-shortcuts
           '( ("/fastmail/INBOX"     . ?i)
              ("/fastmail/INBOX.Archive"   . ?a)
              ("/fastmail/INBOX.Sent Items"      . ?e)
              ("/fastmail/INBOX.Junk Mail"  . ?j)
              ))

     ;; enable inline images
     (setq mu4e-view-show-images t)
     (setq mu4e-view-image-max-width 800)

     ;;(setq mu4e-show-images t)
     ;; use imagemagick, if available
     (when (fboundp 'imagemagick-register-types)
       (imagemagick-register-types))

     ;; use 'fancy' non-ascii characters in various places in mu4e
     (setq mu4e-use-fancy-chars t)

     (setq mu4e-html2text-command 'mu4e-shr2text)
     (add-hook 'mu4e-view-mode-hook
               (lambda()
                 ;; try to emulate som of the eww key-bindings
                 (local-set-key (kbd "<tab>") 'shr-next-link)
                 (local-set-key (kbd "<backtab>") 'shr-previous-link)))

     )
  )
(provide 'emacs-mu4e)
