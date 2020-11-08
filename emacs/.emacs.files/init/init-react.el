;; tide: typescript language server
;; company: completion
;; flycheck
;; most of this taken from https://patrickskiba.com/emacs/2019/09/07/emacs-for-react-dev.html
;; install deps:
;; - npm install -g standardx
;; - npm install -g prettier

(use-package tide
  :ensure t
  :mode ("\\.tsx?\\'" . js-mode)
  :init
  (use-package company
    :ensure t)
  (use-package flycheck
    :ensure t)
  (use-package prettier-js
    :ensure t)

  ;; https://github.com/ananthakumaran/tide
  (defun setup-tide-mode ()
    "Setup function for tide."
    (interactive)
    (tide-setup)
    (flycheck-mode +1)
    (setq flycheck-check-syntax-automatically '(save mode-enabled))
    (eldoc-mode +1)
    (tide-hl-identifier-mode +1)
    (company-mode +1))

  (setq flycheck-javascript-standard-executable "/usr/bin/standardx")

  ;; https://prettier.io/docs/en/options.html
  (setq prettier-js-args '(
			   "--trailing-comma" "none"
			   "--bracket-spacing" "true"
			   "--single-quote" "true"
			   "--jsx-single-quote" "true"
			   "--jsx-bracket-same-line" "true"
			   "--print-width" "100"))

  :hook ((js-mode . setup-tide-mode)
	 (js-mode . prettier-js-mode))
  )
