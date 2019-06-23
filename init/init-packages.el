;;Update packages
(require 'cl)

(when (>= emacs-major-version 24)
  (require 'package)
  ;(package-initialize)
  ;(add-to-list 'package-archives '("melpa" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/") t)
  ;(add-to-list 'package-archives '("gnu" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/") t)
  ;(add-to-list 'package-archives '("gnu" . "") t)
  (setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
  (package-initialize)
)

(defvar liulei/packages '(
			  company
			  monokai-theme
			  hungry-delete
			  ;smex
			  counsel
			  swiper
			  smartparens
			  ;js2-mode
			  popwin
			  reveal-in-osx-finder   ;;For apple mac-osx 
			  expand-region
			  iedit
			  
			  ) "Default Packages")

(setq package-selected-packages liulei/packages)

(defun liulei/packages-installed-p ()
  (loop for pkg in liulei/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (liulei/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg liulei/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))


;;===============================================================

;;auto-revert
(global-auto-revert-mode t)

;;company mode
(global-company-mode t)
(global-linum-mode t)

;;monokai-theme enable
(load-theme 'monokai t)

;;config for swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)

;;config popwin-mode
(require 'popwin)
(popwin-mode t)

;;config for smartparens
(smartparens-global-mode t)
(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)

;;recent file mode
(require 'recentf)
(recentf-mode 1)

;;abbrev-mode
(abbrev-mode t)

;; expand-region
;;(require 'expand-region)

;;=======================================
;; To load at the start up
;; Only for osx user (Apple)
(require 'reveal-in-osx-finder)

;;=================================
(provide 'init-packages)
