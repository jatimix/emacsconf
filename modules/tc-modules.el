;;; init.el --- Initialize main feature of timconf
;;
;; Copyright (c) Timothée Bineau
;;
;; Author: Timothée Bineau <jatimix@gmail.com>
;; keyword: emacs conf
;; Requirements : none
;;; Commentary: none
;;; code:

(load "tc-editor")                   ;; editor specific conf
(load "tc-programming-default")      ;; prog mode specific
(load "tc-ido")
(load "tc-company")
(load "tc-cmode")
(load "tc-ruby")
(load "tc-web-mode")
(load "tc-helm")
(load "tc-elisp")
(load "tc-projectile")
(load "tc-auto-insert")
(load "tc-yasnippet")
(load "tc-smart-beginning-of-line")
(load "tc-global-set-key")
(load "tc-customs")

(provide 'tc-modules)
;;; tc-modules ends here
