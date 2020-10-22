;; Nuke buffers.
(defun nuke-all-buffers ()
  "Kill all buffers, leaving *scratch* only."
  (interactive)
  (mapc
   (lambda (buffer)
     (kill-buffer buffer))
   (buffer-list))
  (delete-other-windows))
(global-set-key (kbd "C-c 9") 'nuke-all-buffers)
