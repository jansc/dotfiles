; https://github.com/stanaka/dash-at-point
(autoload 'magit "magit"
          "Magit." t nil)
(global-set-key (kbd "C-x g") 'magit-status)
(add-to-list 'evil-emacs-state-modes 'magit-mode)
(provide 'emacs-magit)
