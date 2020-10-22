;;; Code.

;; PlantUML
;; Enable plantuml-mode for PlantUML files.
(use-package plantuml-mode
  :ensure t
  :mode "\\.puml\\'"
  :init (setq plantuml-jar-path "$HOME/plantuml.jar")
  )

(provide 'init-plantuml)
;;; init-plantuml.el ends here
