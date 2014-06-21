;; see https://gist.github.com/kmakita13714/5405653
(when (and (= emacs-major-version 24) (eq window-system 'x))
  ;; フォントセットを作る
  (let* ((fontset-name "myfonts") ; フォントセットの名前
         (size 10) ; ASCIIフォントのサイズ [9/10/12/14/15/17/19/20/...]
         ;;(asciifont "Source Code Pro") ; ASCIIフォント
         (asciifont "Ricty Diminished") ; ASCIIフォント
         ;;(asciifont "MotoyaLMaru")
         ;;(jpfont "MotoyaLMaru") ; ASCIIフォント
         (jpfont "VLゴシック") ; 日本語フォント
         (font (format "%s-%d:weight=normal:slant=normal" asciifont size))
         (fontspec (font-spec :family asciifont))
         (jp-fontspec (font-spec :family jpfont))
         (fsn (create-fontset-from-ascii-font font nil fontset-name)))
    (set-fontset-font fsn 'japanese-jisx0213.2004-1 jp-fontspec)
    (set-fontset-font fsn 'japanese-jisx0213-2 jp-fontspec)
    (set-fontset-font fsn 'katakana-jisx0201 jp-fontspec) ; 半角カナ
    (set-fontset-font fsn '(#x0080 . #x024F) fontspec) ; 分音符付きラテン
    (set-fontset-font fsn '(#x0370 . #x03FF) fontspec) ; ギリシャ文字
    )
  ;; デフォルトのフレームパラメータでフォントセットを指定
  (add-to-list 'default-frame-alist '(font . "fontset-myfonts"))
  ;; フォントサイズの比を設定
  (dolist (elt '(
                 ("*VL*" . 0.8)
                 ))
    (add-to-list 'face-font-rescale-alist elt))
  ;; デフォルトフェイスにフォントセットを設定
  ;; # これは起動時に default-frame-alist に従ったフレームが作成されない現象への対処
  (set-face-font 'default "fontset-myfonts"))

;; http://misohena.jp/blog/2017-09-26-symbol-font-settings-for-emacs25.html
(when (and (>= emacs-major-version 25) (eq window-system 'x))
  (let* ()
    ;; デフォルトはASCII用のフォントでなければダメっぽい。
    (set-face-attribute 'default nil :family "Inconsolata" :height 100)
    ;; ASCII以外のUnicodeコードポイント全部を一括で設定する。他国語を使用する人は細かく指定した方が良いかも。
    (set-fontset-font nil '(#x80 . #x10ffff) (font-spec :family "Ricty Diminished"))
    ;; 記号をデフォルトのフォントにしない。(for Emacs 25.2)
    (setq use-default-font-for-symbols nil)))

;; Mac用フォント設定
;; see http://tcnksm.sakura.ne.jp/blog/2012/04/02/emacs/
(when (and (>= emacs-major-version 24) (eq window-system 'ns))
  ;; 英語
  (set-face-attribute 'default nil
                      :family "Menlo" ;; font
                      :height 120)    ;; font size
  ;; 日本語
  (set-fontset-font
   nil 'japanese-jisx0208
   ;; (font-spec :family "Hiragino Mincho Pro")) ;; font
   (font-spec :family "Hiragino Kaku Gothic ProN")) ;; font

  ;; 半角と全角の比を1:2にしたければ
  (setq face-font-rescale-alist
        ;;        '((".*Hiragino_Mincho_pro.*" . 1.2)))
        '((".*Hiragino_Kaku_Gothic_ProN.*" . 1.2)));; Mac用フォント設定
  )
