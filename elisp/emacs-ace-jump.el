(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)

;;If you use evil
(define-key global-map (kbd "C-c SPC") 'ace-jump-line-mode)
(define-key evil-normal-state-map (kbd "SPC") 'ace-jump-mode)

(provide 'emacs-ace-jump)
