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

;; We want newlines at end of file
(setq require-final-newline 1)

(setq confirm-kill-emacs 'y-or-n-p)

(setq history-length 1000)
(savehist-mode 1)

(setq frame-title-format
      '("%S" (buffer-file-name "%f"
                               (dired-directory dired-directory "%b"))))

;; Shortcut for switching between header and implementation files in C/C++
(global-set-key (kbd "C-x C-o") 'ff-find-other-file)

(use-package slime
  :bind (("M-TAB" . company-complete)
	 ("C-c C-d C-s" . slime-describe-symbol)
	 ("C-c C-d C-f" . slime-describe-function))
  :init
  (setq slime-lisp-implementations '((sbcl ("sbcl")))
	slime-default-lisp 'sbcl)
  (setq common-lisp-hyperspec-root
        "/usr/local/share/doc/clisp-hyperspec/HyperSpec/")

  ;; (setq common-lisp-hyperspec-symbol-table
  ;;      (concat common-lisp-hyperspec-root "Data/Map_Sym.txt"))
  ;; (setq common-lisp-hyperspec-issuex-table
  ;;      (concat common-lisp-hyperspec-root "Data/Map_IssX.txt"))

  (slime-setup '(slime-fancy slime-company slime-cl-indent)))


(load (expand-file-name "/usr/home/jans/quicklisp/slime-helper.el"))
(setq inferior-lisp-program "/usr/local/bin/sbcl")

(show-paren-mode 1)
(save-place-mode 1)

(use-package rainbow-delimiters
  :ensure t
  :init
  (progn
    (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)))

(provide 'emacs-misc)
