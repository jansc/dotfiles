(require 'erc)
(defmacro de-erc-connect (command server port nick)
  "Create interactive command `command', for connecting to an IRC server. The
      command uses interactive mode if passed an argument."
  (fset command
        `(lambda (arg)
           (interactive "p")
           (if (not (= 1 arg))
               (call-interactively 'erc)
             (erc :server ,server :port ,port :nick ,nick)))))
(de-erc-connect erc-opn "irc.freenode.org" 6666 "jansc")

; TODO: find a way to store the password elsewhere
;(add-hook 'erc-after-connect '(lambda (SERVER NICK)
;                                (erc-message "PRIVMSG" "NickServ identify XXXXXX")))
(provide 'emacs-erc)
