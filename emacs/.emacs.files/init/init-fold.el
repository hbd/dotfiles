(use-package origami
  :ensure t
  :hook ((go-mode . origami-mode)
	 (json-mode . origami-mode)
	 (yaml-mode . origami-mode))
  :bind (("C-c TAB" . origami-toggle-node))
  )

;; File-level toggle. Testing Origami instead but kept here for reference.
;; (defun aj-toggle-fold ()
;;   "Toggle fold all lines larger than indentation on current line"
;;   (interactive)
;;   (let ((col 1))
;;     (save-excursion
;;       (back-to-indentation)
;;       (setq col (+ 1 (current-column)))
;;       (set-selective-display
;;        (if selective-display nil (or col 1))))))
;; (global-set-key (kbd "C-c TAB") 'aj-toggle-fold)

