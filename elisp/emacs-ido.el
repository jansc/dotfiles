(require 'ido)
(setq ido-enable-flex-matching t) ;; enable fuzzy matching
(setq ido-everywhere t)
(setq ido-create-new-buffer 'always)
(ido-mode t)
(provide 'emacs-ido)
