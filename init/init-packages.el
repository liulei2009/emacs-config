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
			  magit
			  ecb
			  auto-complete
			  auto-complete-c-headers
			  yasnippet
			  ggtags
			  flymake-google-cpplint
			  google-c-style
			  
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

;; ecb enable
(require 'ecb)
;;(require 'ecb-autoload-feature)

;; auto-complete
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)

;; yasnippet
(require 'yasnippet)
(yas-global-mode 1)

;; auto-complete-c-headers
(defun my:ac-c-header-init()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-to-list 'achead:include-directories '"/usr/include")
  )

(add-hook 'c-mode-hook 'my:ac-c-header-init)
(add-hook 'c++-mode-hook 'my:ac-c-header-init)

;; ggtags
(require 'ggtags)

;; flymake-google-cpplint
(defun my:flymake-google-cpplint-init ()
  (require 'flymake-google-cpplint)
  (custom-set-variables
   '(flymake-google-cpplint-command "/usr/local/bin/cpplint"))
  (flymake-google-cpplint-load)
)

(add-hook 'c-mode-hook 'my:flymake-google-cpplint-init)
(add-hook 'c++-mode-hook 'my:flymake-google-cpplint-init)

;; google-c-style
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

;;=================================
(provide 'init-packages)
