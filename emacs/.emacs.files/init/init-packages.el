;;; Initialize packages.
;; custom-set-variables was added by Package.el.
(package-initialize)

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

;; Refresh package management.
(package-initialize)
;; (package-refresh-contents)

;; List of packages we want to install.
(defvar package-list)
(setq package-list
      '(
	;; Major modes.
	;; go-mode
        markdown-mode
	yaml-mode
	plantuml-mode
	terraform-mode
	js2-mode
	dockerfile-mode

	;; Minor modes.
	lsp-mode
	multiple-cursors
	origami

	;; Golang.
	;; flycheck-golangci-lint
        ;; go-guru
        ;; go-rename

	;; YAML.
	flycheck-yamllint

	;; JSON.
	json-mode

	;; Web.
	flycheck-css-colorguard
	js-import
	js-format

	;; PlantUML.
	flycheck-plantuml

	;; Utilities.
	ag ;; Simple and quick searching.
	company
	company-lsp
	;; flycheck
	lsp-ui
	use-package
	use-package-ensure-system-package
	yasnippet
	))

;; Install the missing packages.
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(provide 'init-packages)

;;; End of package initialization.
