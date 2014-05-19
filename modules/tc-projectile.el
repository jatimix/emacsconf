;;; packaqe --- tc-projectile.el
;;
;; Copyright (C) Timothée Bineau
;;
;; Author: Timothée Bineau <jatimix@gmail.com>
;; Keywords:
;; Requirements: --
;; Status: not intended to be distributed yet
;;; Commentary:
;;

;;; Code:

;; everywhere i'm shuffling
(projectile-global-mode)
(add-hook 'projectile-mode-hook 'projectile-rails-on)

;; couvre les deff ruby (fournis des semantics et des completions

(require 'robe)
(add-hook 'ruby-mode-hook 'robe-mode)

(provide 'tc-projectile)
;;; tc-projectile.el ends here
