;;======================================================================
;; Fix the UI
(setq visible-bell nil) 
(setq ring-bell-function 'ignore)
(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(set-scroll-bar-mode nil)
(when (fboundp 'horizontal-scroll-bar-mode)
  (horizontal-scroll-bar-mode -1))

;;======================================================================
;; Eye candy

(load-library "linum")

(defun toggle-line-numbers()
  "Easy to remember shortcut to M-x linum-mode"
  (interactive)
  (if linum-mode
      (linum-mode -1)
    (linum-mode 1)))

; adjust the space between lines
;(setq-default line-spacing 0)

; Lets us see col # at the bottom. very handy.
(column-number-mode 1)

;;======================================================================
;; Syntax highlighting

(global-font-lock-mode t)
(global-hl-line-mode 1)
(setq global-hl-line-sticky-flag nil)

;;======================================================================
;; Color Themes
;;(add-to-list 'custom-theme-load-path "~/elisp/themes/emacs-color-theme-solarized")
(load-theme 'solarized-dark t)
;(load-theme 'one-dark t)

(provide 'emacs-ui)
