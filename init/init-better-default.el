;;=======================================================================
;;self-define function
(defun open-config-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;;=======================================================================
;;better for abbrev
(define-abbrev-table 'global-abbrev-table '(
					    ("ll" "liulei")
					    ))

;;don't generate the temp files
(setq make-backup-files nil)

;;delete selection
(delete-selection-mode t)

;;dired better
;; if there is a dired buffer displayed in the next window, use its
;; current subdir, instead of the current subdir of this dired buffer
(setq dired-dwim-target t)
(put 'dired-find-alternate-file 'disabled nil)
(require 'dired-x)


;; enhance the occur-mode, fetch the word when the cursor under it.
(defun occur-dwim ()
  "Call `occur' with a sane default."
  (interactive)
  (push (if (region-active-p)
            (buffer-substring-no-properties
             (region-beginning)
             (region-end))
          (let ((sym (thing-at-point 'symbol)))
            (when (stringp sym)
              (regexp-quote sym))))
        regexp-history)
  (call-interactively 'occur))

;;==========================================================
(provide 'init-better-default)
