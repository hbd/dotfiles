
;; Snippets.

(use-package yasnippet
  :ensure t
  :init
  (setq yas-snippet-dirs
	'("~/.emacs.files/snippets/"))
  (yas-global-mode 1) ;; or M-x yas-reload-all if you've started YASnippet already.
  )
