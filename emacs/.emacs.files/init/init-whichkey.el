;; Reduce mode line display for which-key.
(use-package diminish
  :ensure t
  :demand t)

(use-package which-key
  :ensure t
  :diminish
  :custom
  (which-key-idle-delay 0.4)
  (which-key-idle-secondary-delay 0.4)
  :config
  (which-key-mode +1))
