;;; vanilla-files.el --- Initialize main feature of timconf
;;
;; Copyright (c) Timothée Bineau
;;
;; Author: Timothée Bineau <jatimix@gmail.com>
;; keyword: emacs conf
;; Requirements : none
;;; Commentary: none
;;; code:

;; pour le ruby
(add-to-list 'auto-mode-alist
	     '("\\.\\(?:gemspec\\|irbrc\\|gemrc\\|rake\\|rb\\|ru\\|thor\\)\\'" . ruby-mode))
(add-to-list 'auto-mode-alist
	     '("\\(Capfile\\|Gemfile\\(?:\\.[a-zA-Z0-9._-]+\\)?\\|[rR]akefile\\)\\'" . ruby-mode))

;; We never want to edit Rubinius bytecode
(add-to-list 'completion-ignored-extensions ".rbc")
(inf-ruby-minor-mode +1)

;; must add pry and pry-doc to gemfile for this to work.. no workaround
(add-hook 'ruby-mode-hook 'robe-mode)

;; set flycheck rubocop special parser (need gem install rubocop to use it)
;(flycheck-select-checker ruby-rubocop)

;; slim-mode (auto via el-get)
;;(require 'slim-mode)

(provide 'tc-ruby)

;;; tc-ruby ends here
