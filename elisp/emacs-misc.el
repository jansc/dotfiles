;; -*-mode: emacs-lisp -*-
;;=====================================================================
;; emacs-misc.el --- Emacs configuration file for various settings

(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

;; disallow creation of new lines when you press the "arrow-down key" at end of the buffer.
(setq next-line-add-newlines nil) 

(setq c-indent-level 2)
(setq cperl-indent-level 2)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq c-basic-offset 2)
(setq c-default-style "bsd" c-basic-offset 2)

(setq confirm-kill-emacs 'y-or-n-p)

(setq history-length 1000)
(savehist-mode 1)

(setq frame-title-format
      '("%S" (buffer-file-name "%f"
                               (dired-directory dired-directory "%b"))))

;; Shortcut for switching between header and implementation files in C/C++
(global-set-key (kbd "C-x C-o") 'ff-find-other-file)

(setq inferior-lisp-program "/usr/bin/sbcl")
(slime-setup '(slime-company))
(load (expand-file-name "~/quicklisp/slime-helper.el"))
(provide 'emacs-misc)
