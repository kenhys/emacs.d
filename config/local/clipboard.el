(cond ((version<= "25.1" emacs-version)
       (setq select-enable-primary t))
      (t
       (setq x-select-enable-primary t)))

(when (eq window-system 'x)
  (cond ((version<= "25.1" emacs-version)
         (setq select-enable-clipboard t))
        (t
         (setq x-select-enable-clipboard t))))
