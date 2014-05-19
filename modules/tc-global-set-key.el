;;; packaqe --- tc-global-set-key.el
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

;; for ido completion
;; (global-set-key (kbd "M-x") 'smex)
;; (global-set-key (kbd "M-X") 'smex-major-mode-commands)

;; helm shit
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-c h") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

;; go to first no white char
(global-set-key (kbd "C-a") 'smart-beginning-of-line)

;; expand les regions
(global-set-key (kbd "C-=") 'er/expand-region)

(global-set-key (kbd "C-c C-f") 'hs-toggle-hiding)

(provide 'tc-global-set-key)
;;; tc-global-set-key.el ends here
