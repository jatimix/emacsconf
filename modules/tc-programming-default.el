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

;; smart pairing for all
;; (require 'smartparens-config)
;; (setq sp-base-key-bindings 'paredit)
;; (setq sp-autoskip-closing-pair 'always)
;; (setq sp-hybrid-kill-entire-symbol nil)
;; (sp-use-paredit-bindings)
;; (smartparens-global-mode t)
;; (show-smartparens-global-mode +1)

;;(diminish 'smartparens-global-mode)

(require 'compile)
(setq compilation-ask-about-save nil  ; Just save before compiling
      compilation-always-kill t       ; Just kill old compile processes before
					; starting the new one
      compilation-scroll-output 'first-error ; Automatically scroll to first
                                        ; error
      )


;; permet d'expand des regions (lettre -> mot -> paragraphe)
(require 'expand-region)

;; .zsh file is shell script too
(add-to-list 'auto-mode-alist '("\\.zsh\\'" . shell-script-mode))

;; make a shell script executable automatically on save
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)

;; evite les lignes inutiles a la fin d'un fichier
(setq next-line-add-newlines nil)

;; enable hide show mode only for prog mode
(add-hook 'prog-mode-hook 'hs-minor-mode)

;; enable git gutter
(require 'git-gutter-fringe)
(global-git-gutter-mode +1)
(setq-default left-fringe-width  7)
(diminish 'git-gutter-mode)

;; gdb stuff
(setq gdb-many-windows +1)

(provide 'tc-programming-default.el)
;;; tc-programming-default.el ends here
