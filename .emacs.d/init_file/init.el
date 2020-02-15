;; init el
;; Update 2019/02/15

;; Config
;;; language(ja)
(set-language-environment 'Japanese)

;;; default UTF-8
(prefer-coding-system 'utf-8)

;;; line
(require 'linum)
;;;; f2 in line-mode
(global-set-key [f2] 'linum-mode)

;;; line-delte
(setq kill-whole-line t)

;;; sound beep
(setq visible-bell t)

;;; config backup file
(setq make-backup-files nil)
(setq auto-save-default nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (csharp-mode web-mode auto-complete))))

;; package repository
;;; Melpa & Marmalade
;;;; ref https://qiita.com/Maizu/items/fee34328f559c7dc59d8
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(add-to-list 'package-archives  '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(package-initialize)
