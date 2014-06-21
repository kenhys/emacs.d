(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get/el-get/recipes")

(el-get-bundle logalimacs)
(el-get-bundle color-theme-solarized)
(el-get-bundle twittering-mode)
(el-get-bundle paredit)
(el-get-bundle cl-lib)
(el-get-bundle howm)
(el-get-bundle request)
(el-get-bundle git-modes)
(el-get-bundle nsis-mode)
(el-get-bundle origami)
(el-get-bundle yafolding)

(load "config/packages/howm")
(load "config/packages/linum")
;;(load "config/packages/color-theme-solarized")
(load "config/packages/ginger-api")

