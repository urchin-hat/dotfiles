;; init el

;;; パッケージレポジトリ
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;;; MELPA
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;;; 言語の設定
(set-language-environment 'Japanese)

;;; UTF-8
(prefer-coding-system 'utf-8)

;;; 行番号の表示
(require 'linum)
;;(global-linum-mode)

;;; f2キーで行数の表示切替
(global-set-key [f2] 'linum-mode)

;;; 行の先頭でC-kを一回押すだけで行全体を消去する
(setq kill-whole-line t)

;;; バックアップファイルの設定
(setq make-backup-files nil)
(setq auto-save-default nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (web-mode company-go flycheck-elixir ac-alchemist alchemist elixir-mode add-node-modules-path vue-mode dockerfile-mode docker-compose-mode cython-mode angular-mode typescript go-mode php-mode typescript-mode dart-mode kotlin-mode rust-mode js2-mode csharp-mode ##))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; 使用する場合はpackage-installをしてコメントアウトを消す
;; Python
;(add-hook 'python-mode-hook 'jedi:setup)
;(setq jedi:complete-on-dot t)

;(require 'auto-complete-config)
;(ac-config-default)
;(global-auto-complete-mode t)

;; Golang
;;; gopath
;;(add-to-list 'exec-path (expand-file-name "/Users/sfukushima/.anyenv/envs/goenv/shims/go"))
;;; go get path
;;(add-to-list 'exec-path (expand-file-name "/Users/sfukushima/.go/bin/"))

;;; flycheck-mode
;(add-hook 'go-mode-hook 'flycheck-mode)
;(add-hook 'go-mode-hook (lambda()
;       (add-hook 'before-save-hook' 'gofmt-before-save)
;       (local-set-key (kbd "M-.") 'godef-jump)
;       (set (make-local-variable 'company-backends) '(company-go))
;       (setq indent-tabs-mode nil)
;       (setq c-basic-offset 4)    ; tab=4
;       (setq tab-width 4)))

;;; company-mode
;(require 'company-go)
;(add-hook 'go-mode-hook (lambda()
;      (company-mode)
;      (setq company-transformers '(company-sort-by-backend-importance))
;      (setq company-idle-delay 0)
;      (setq company-minimum-prefix-length 3)
;      (setq company-selection-wrap-around t)
;      (setq completion-ignore-case t)
;      (setq company-dabbrev-downcase nil)
;      (global-set-key (kbd "C-M-i") 'company-complete)
;      (define-key company-active-map (kbd "C-n") 'company-select-next)
;      (define-key company-active-map (kbd "C-p") 'company-select-previous)
;      (define-key company-active-map (kbd "C-s") 'company-filter-candidates)
;      (define-key company-active-map [tab] 'company-complete-selection)
;      (define-key emacs-lisp-mode-map (kbd "C-M-i") 'company-complete)
;      ))

;; Elixir
;(require 'elixir-mode)
;(require 'alchemist)
;(require 'flycheck-elixir)
;(add-to-list 'elixir-mode-hook 'ac-alchemist-setup)

;;web-mode
;(require 'web-mode)
;(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
;(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
;(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
;(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
;(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
;(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
;(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
;(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(custom-set-faces
 '(web-mode-doctype-face           ((t (:weight bold "#FFFFFF"))))
 '(web-mode-html-tag-face          ((t (:foreground "#DC143C"))))
 '(web-mode-html-tag-bracket-face  ((t (:foreground "#FFFFFF"))))
 '(web-mode-html-attr-name-face    ((t (:foreground "#87CEEB"))))
 '(web-mode-html-attr-equal-face   ((t (:foreground "#FFFFFF"))))
 '(web-mode-html-attr-value-face   ((t (:foreground "#D78181"))))
 '(web-mode-comment-face           ((t (:foreground "#587F35"))))
 '(web-mode-server-comment-face    ((t (:foreground "#587F35"))))

 '(web-mode-css-at-rule-face       ((t (:foreground "#DFCF44"))))
 '(web-mode-comment-face           ((t (:foreground "#587F35"))))
 '(web-mode-css-selector-face      ((t (:foreground "#DFCF44"))))
 '(web-mode-css-pseudo-class       ((t (:foreground "#DFCF44"))))
 '(web-mode-css-property-name-face ((t (:foreground "#87CEEB"))))
 '(web-mode-css-string-face        ((t (:foreground "#D78181"))))
 )
