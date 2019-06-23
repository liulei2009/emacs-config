;;recentf
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;;swiper and counsel
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

;;open init config file.
(global-set-key (kbd "<f2>") 'open-config-file)


;;org mode
(global-set-key (kbd "C-c a") 'org-agenda)

;;dired
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

;; reveal-in-osx-finder (Only for apple user)
;; If you want to configure a keybinding (e.g., C-c z), add the following
(global-set-key (kbd "C-c z") 'reveal-in-osx-finder)
(global-set-key (kbd "M-s o") 'occur-dwim)

;; counsel-imenu
(global-set-key (kbd "C-c i") 'counsel-imenu)

;; expand-region
(global-set-key (kbd "C-=") 'er/expand-region)

;; iedit
(global-set-key (kbd "C-c e") 'iedit-mode)

;;====================================================
(provide 'init-keybind)
