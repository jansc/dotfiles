(require 'emms)
(require 'emms-setup)
(require 'emms-player-mpd)
(require 'emms-librefm-scrobbler)
(emms-librefm-scrobbler-enable)
(require 'emms-info-libtag)
(setq emms-info-functions '(emms-info-libtag))
(require 'emms-lyrics)
(emms-lyrics 1)
(require 'emms-volume)
(setq emms-volume-change-function 'emms-volume-mpd-change)

(emms-all) ; don't change this to values you see on stackoverflow questions if you expect emms to work
(setq emms-seek-seconds 5)
(setq emms-player-list '(emms-player-mpd))
(setq emms-info-functions '(emms-info-mpd))
(setq emms-player-mpd-server-name "localhost")
(setq emms-player-mpd-server-port "6600")
(global-set-key (kbd "s-m p") 'emms)
(global-set-key (kbd "s-m b") 'emms-smart-browse)
(global-set-key (kbd "s-m r") 'emms-player-mpd-update-all-reset-cache)
(global-set-key (kbd "C-c +") 'emms-volume-mode-plus)
(global-set-key (kbd "C-c -") 'emms-volume-mode-minus)
(define-key mode-specific-map (kbd "e s") 'emms-smart-browse)

;("<XF86AudioPrev>" . emms-previous)
;("<XF86AudioNext>" . emms-next)
;("<XF86AudioPlay>" . emms-pause)
;("<XF86AudioStop>" . emms-stop)

(setq mpc-host "localhost:6600")

(add-to-list 'evil-emacs-state-modes 'emms-browser-mode)
(add-to-list 'evil-emacs-state-modes 'emms-playlist-mode)

(provide 'emacs-emms)
