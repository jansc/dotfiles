; Dired configuration by RB
(require 'ibuffer)
(setq ibuffer-saved-filter-groups
      (quote (("default"
               ("pubsys-BACKEND" (or
                               (filename . ":.*backend.*:.+")))
               ("pubsys-dev03" (or
                               (filename . ":.*dev03.*:.+jans/ps4")))
               ("pubsys-dev04" (or
                               (filename . ":.*dev04.*:.+jans/ps4")))
               ("pubsys-staging2010" (or
                               (filename . ":.*dev03.*:.+capdam2010/ps4")))
               ("pubsys-lokalt" (or
                               (filename . "^/home/jans/ps4.+")
                               (filename . "^~/ps4.+")))
               ("magit" (or
                               (name . "^*magit.+")
                               ))
               ;("ag" (mode . ag-mode))
               ;("dired" (mode . dired-mode))
               ;("ledger" (mode . ledger-mode))
               ;("org" (mode . org-mode))
               ("emacs" (or
                         (name . "^\\*.+\\*$")
                         (name . "^\\*scratch\\*$")
                         (name . "^\\*Messages\\*$")
                         (name . "^\\*Occur\\*$")
                         (name . "^\\*grep\\*$")
                         (name . "^\\*Buffer List\\*$")
                         (name . "^\\*Completions\\*$")
                         (name . "^\\*vc\\*")
                         (name . "^\\*Bookmark List\\*")
                         (name . "^\\*Annotate")
                         (name . "^\\*tramp")
                         (name . "^\\*Apropos\\*")
                         (name . "^\\*Warnings\\*")
                         (name . "^\\*Diff\\*")
                         (name . "^\\*vc-diff\\*")
                         (name . "^\\*Help\\*")))))))

;; (declare-function ibuffer-switch-to-saved-filters "ibuf-ext.el" nil)
;; (add-hook 'ibuffer-mode-hook
;;           (lambda ()
;;             (ibuffer-switch-to-saved-filter-groups "default")))
;; ​
(global-set-key "\C-x\C-b" 'ibuffer)

(provide 'emacs-dired)
