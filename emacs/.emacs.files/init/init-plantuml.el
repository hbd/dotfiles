;; PlantUML
;; Enable plantuml-mode for PlantUML files.
(add-to-list 'load-path "~/.emacs.files/packages/plantuml-mode")
(load "plantuml-mode")
(add-to-list 'auto-mode-alist '("\\.plantuml\\'" . plantuml-mode))
(add-to-list 'auto-mode-alist '("\\.puml\\'" . plantuml-mode))
(add-to-list 'auto-mode-alist '("\\.iuml\\'" . plantuml-mode)) ; Included uml files not detected by plantuml-
