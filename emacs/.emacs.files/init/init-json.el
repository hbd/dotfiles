;;; JSON reformat configuration.
(with-eval-after-load 'json-mode
  (setq json-reformat:indent-width 2
	json-reformat:pretty-string? nil))
