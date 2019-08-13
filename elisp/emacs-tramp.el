;; -*-mode: emacs-lisp -*-
;; emacs-tramp.el --- Emacs configuration file for tramp

(require 'tramp)
(eval-after-load 'tramp '(setenv "SHELL" "/bin/bash"))
(setq tramp-default-user "jans")
(setq tramp-debug-buffer t)
(setq tramp-verbose 3) ; Use 10 for full trace

(provide 'emacs-tramp)
