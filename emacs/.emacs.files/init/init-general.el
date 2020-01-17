;;; Code:

;; Theme.
(load-theme 'tango-dark)

;; Store temp file outside current dir.
(setq temporary-file-directory "~/.emacs.d/tmp/")
(setq backup-directory-alist         `((".*" . , temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" , temporary-file-directory t)))
(setq create-lockfiles nil)

;; Highlight matching ( [ { } ] ).
(require 'paren)
(show-paren-mode t)

;; ido-mode for file browsing.
(when (require 'ido nil t) (ido-mode t)) ; (Much) Better file/buffer browsing.

;; No bell.
(setq ring-bell-function 'ignore)
(setq bell-volume 0)

;;; Enable mouse support. ;;;
(xterm-mouse-mode t)

;; Wheel support.
(global-set-key [mouse-4] (lambda ()
                            (interactive)
                            (scroll-down 5)))
(global-set-key [mouse-5] (lambda ()
                            (interactive)
                            (scroll-up 5)))

;; Enforce end of file new line.
(setq require-final-newline 1 mode-require-final-newline 1)

;; Show trailing whitespaces.
(setq-default show-trailing-whitespace t)

;; Prevent emacs asking to follow sybolic link to VC'd file.
(setq vc-follow-symlinks nil)

;; Disable line wrap.
(set-default 'truncate-lines t)

;; Custom funcs for compiling.
(defun end-of-line-compile()
  (setq curbuf (current-buffer))
  (pop-to-buffer "*compilation*")
  (end-of-buffer)
  (pop-to-buffer curbuf)
  )

;; Save all files then run M-x compile.
(defun my-recompile()
        "Save any unsaved buffers and compile"
        (interactive)
        (save-some-buffers t)
	(end-of-line-compile)
        (recompile)
	(end-of-line-compile))

(defun save-and-compile-program()
        "Save any unsaved buffers and compile"
        (interactive)
        (save-some-buffers t)
        (compile "bash -c 'go install && go build -o /tmp/a.out && /tmp/a.out'")
	(end-of-line-compile))

(defun save-and-test-program()
        "Save any unsaved buffers and compile"
        (interactive)
        (save-some-buffers t)
        (compile "go test -v -cover -coverprofile=coverprofile -covermode=count")
	(end-of-line-compile))

(defun save-and-make-test-program()
        "Save any unsaved buffers and compile"
        (interactive)
        (save-some-buffers t)
        (compile "make test SKIP_FMT=1 NOPULL=1 TEST_OPTS='-v .'")
	(end-of-line-compile))

(defun save-and-make-clean-program()
        "Save any unsaved buffers and compile"
        (interactive)
        (save-some-buffers t)
        (compile "make clean")
	(end-of-line-compile))

(defun save-and-make-program()
        "Save any unsaved buffers and compile"
        (interactive)
        (save-some-buffers t)
        (compile "make start NOPULL=1")
	(end-of-line-compile))

(global-set-key (kbd "C-c C-c") 'comment-region)
(global-set-key (kbd "C-c C-u") 'uncomment-region)
(global-set-key (kbd "C-c C-r") 'my-recompile)
(global-set-key (kbd "C-c   r") 'save-and-compile-program)
(global-set-key (kbd "C-c C-k") 'kill-compilation)
(global-set-key (kbd "C-c C-l") 'linum-mode)


;; Editing emacs.
(global-set-key (kbd "C-c C-p") 'eval-region)

(provide 'init-general)
;;; init-general.el ends here
