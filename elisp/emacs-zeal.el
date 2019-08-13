;; https://github.com/jinzhu/zeal-at-point
(autoload 'zeal-at-point "zeal-at-point"
          "Search the word at point with Zeal." t nil)
(global-set-key "\C-cd" 'zeal-at-point)
(global-set-key "\C-ce" 'zeal-at-point-with-docset)
;;(add-to-list 'zeal-at-point-mode-alist '(php-mode . "php"))
;;(add-to-list 'zeal-at-point-mode-alist '(html-mode . "html"))
(provide 'emacs-zeal)
