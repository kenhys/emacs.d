(setq load-path (append '("~/.emacs.d/el-get/color-theme-solarized") load-path))
(setq custom-theme-load-path '("~/.emacs.d/el-get/color-theme-solarized"))

(el-get 'sync '(color-theme-solarized))
(when (or (eq window-system 'x) (eq window-system 'ns))
  (require 'color-theme-solarized)
  (load-theme 'solarized-dark))
