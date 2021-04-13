;; -*-mode: emacs-lisp -*-
;; emacs-python.el --- Emacs configuration file for python development
;; inspired by https://jonathanabennett.github.io/blog/2019/06/20/python-and-emacs-pt.-1/

(use-package elpy
   :init
   (add-to-list 'auto-mode-alist '("\\.py$" . python-mode))
   :custom
   (elpy-rpc-backend "jedi"))

(use-package python
   :ensure nil
   :mode ("\\.py" . python-mode)
   :config
   (setq python-indent-offset 4)
   (elpy-enable))

(use-package company
    :ensure t
    :defer t
    :diminish (company-mode . " ⓐ")
    :init
    (global-company-mode)
    :config
    (setq company-tooltip-align-annotations t
          company-idle-delay 0.2
          ;; min prefix of 2 chars
          company-minimum-prefix-length 2
          company-require-match nil))

  (use-package company-quickhelp          ; Show help in tooltip
    :ensure t
    :defer t
    :init (with-eval-after-load 'company
            (company-quickhelp-mode)))

  (use-package company-jedi
    :ensure t
    :defer t
    :init
    (defun enable-jedi()
      (setq-local company-backends
                  (append '(company-jedi) company-backends)))
    (with-eval-after-load 'company
      (add-hook 'python-mode-hook 'enable-jedi)))

(provide 'emacs-python)
