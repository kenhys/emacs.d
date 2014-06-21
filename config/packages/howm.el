;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; howm
;;

(require 'howm)
(setq auto-mode-alist
      (append '(("\\.howm$" . howm-mode)) auto-mode-alist))
(setq howm-directory "~/work/howm")
;; YYYY/MM/YYYY-MM-DD.howm
(setq howm-file-name-format "%Y/%m/%Y-%m-%d.md")
;;(setq howm-file-name-format "%Y%m%d.howm")

;; use external grep command
(setq howm-process-coding-system '(utf-8-dos . utf-8-unix))
(setq howm-view-use-grep t)


(set-face-foreground 'howm-mode-title-face "turquoise") ;; タイトル色
(set-face-foreground 'howm-mode-keyword-face "yellow") ;; <<<
(set-face-foreground 'howm-mode-ref-face "yellow") ;; >>>
(set-face-foreground 'action-lock-face "cyan") ;; 下線文字
(set-face-underline 'action-lock-face t) ;; 下線は文字と同色 (Emacs 21)
(set-face-underline 'action-lock-face "blue") ;; 下線 (Emacs 21)
(setq howm-template-date-format "[%Y-%m-%d %H:%M:%S]")
(setq howm-template-file-format "==>%s")
;;(setq howm-template "%date%file\n= p: %cursor ():\n\n")
(setq howm-view-title-header "■")
(setq howm-menu-expiry-hours 2) ;; メニューを 2 時間キャッシュ
(setq howm-menu-refresh-after-save nil) ;; メモ保存時のメニュー更新も止める
;; メニューの予定表の表示範囲
;; 14 日前から
(setq howm-menu-schedule-days-before 14)
;; 60 日後まで
(setq howm-menu-schedule-days 60)

(setq browse-url-mozilla-program "firefox")

(setq action-lock-no-browser t)
