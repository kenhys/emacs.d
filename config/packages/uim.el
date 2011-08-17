(condition-case err
    (progn
      (require 'uim)
      (uim-reset-keymap)
      (defun uim-mode-force-on (&optional arg)
        (interactive "P")
        (if (and (= (prefix-numeric-value arg) 0)
                 uim-mode)
            (ignore)
          (uim-mode)
          (uim-process-input)
          (load-library "uim-var")))
      (setq uim-candidate-display-frame t)
      (setq uim-candidate-display-inline t)
      (define-key global-map "\C-o" 'uim-mode-force-on))
  (error
   (message (format "ignore error: %s" err))))
