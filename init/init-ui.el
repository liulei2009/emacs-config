;;=====================================================================
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq-default cursor-type 'bar)
(setq inhibit-splash-screen t)
(setq initial-frame-alist (quote((fullscreen . maximized))))

;;display current line number.
(global-hl-line-mode t)


;;recentf
(setq recentf-max-menu-items 25)

(provide 'init-ui)
