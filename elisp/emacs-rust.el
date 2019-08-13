;; -*-mode: emacs-lisp -*-
;; emacs-evil.el --- Emacs configuration file for evil-mode
(require 'rust-mode)

(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

(provide 'emacs-rust)
