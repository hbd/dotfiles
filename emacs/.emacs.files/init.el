;;; package --- Emacs config for prj2501.

;;; Commentary:
;;; Emacs config for prj2501 -- streamed live @ twitch.tv/prj2501.

;;; Code:

(add-to-list 'load-path "~/.emacs.files/init")

(load "init-packages")
(load "init-general")
(load "init-duplicate")
(load "init-docker")
(load "init-fold")
(load "init-flycheck")
(load "init-go")
(load "init-highlight")
(load "init-javascript")
(load "init-json")
(load "init-multi-cursor")
(load "init-nuke")
(load "init-org")
(load "init-plantuml")
(load "init-snippet")
(load "init-yaml")
(load "init-whichkey")
(load "init-transpose")

;;; init.el ends here

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (multiple-cursors go-mode markdown-mode ag))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
