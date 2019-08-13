;; https://company-mode.github.io/
(autoload
  'company-mode
  "company-mode"
  "Emacs mode for autocompletion"
  t)
(add-hook 'after-init-hook 'global-company-mode)

(provide 'emacs-company)
