;; Flycheck.

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode) ;; Enable flycheck everywhere.
  :bind (("C-c <up>"   . flycheck-next-error)     ;; Ctrl-up   to go to next error.
	 ("C-c <down>" . flycheck-previous-error) ;; Ctrl-down to go to previous error.
	 ("C-c l"      . flycheck-list-errors)    ;; Ctrl-l    to display error list.
	 )
  )

