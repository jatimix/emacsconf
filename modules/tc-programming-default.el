;;; init.el --- Initialize main feature of timconf
;;
;; Copyright (c) Timothée Bineau
;;
;; Author: Timothée Bineau <jatimix@gmail.com>
;; keyword: emacs conf
;; Requirements : none
;;; Commentary: none
;;; code:

;;; active le spelling de function dans le mini buffer
(require 'which-func)
;;(add-to-list 'which-func-modes 'ruby-mode)
(add-to-list 'which-func-modes 'prog-mode)
(which-function-mode 1)

(global-flycheck-mode +1)
(add-hook 'prog-mode-hook 'flycheck-mode)

;; disable annoying blink-matching-paren
(setq blink-matching-paren nil)

;; smart pairing for all
(require 'smartparens-config)
(setq sp-base-key-bindings 'paredit)
(setq sp-autoskip-closing-pair 'always)
(setq sp-hybrid-kill-entire-symbol nil)
(sp-use-paredit-bindings)

(show-smartparens-global-mode +1)

(require 'compile)
(setq compilation-ask-about-save nil  ; Just save before compiling
      compilation-always-kill t       ; Just kill old compile processes before
					; starting the new one
      compilation-scroll-output 'first-error ; Automatically scroll to first
                                             ; error
      )


;; permet d'expand des regions (lettre -> mot -> paragraphe)
(require 'expand-region)
;;; TODO (dans un file separer) (global-set-key (kbd "C-=") 'er/expand-region)

;; .zsh file is shell script too
(add-to-list 'auto-mode-alist '("\\.zsh\\'" . shell-script-mode))

;; make a shell script executable automatically on save
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)


(provide 'tc-programming-default.el)
;;; tc-programming-default.el ends here