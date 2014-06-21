;; Change Cmd ond Opt
(setq ns-command-modifier (quote meta))
(setq ns-alternate-modifier (quote super))

;;(setq default-input-method "MacOSX")
;; See https://github.com/emacs-jp/issues/issues/10
(global-set-key
 [(control J)]
 (lambda ()
   (interactive)
   (call-process "osascript" nil t nil "-e" "tell application \"System Events\" to key code 104")))

(global-set-key
 [(control :)]
 (lambda ()
   (interactive)
   (call-process "osascript" nil t nil "-e" "tell application \"System Events\" to key code 102")))
