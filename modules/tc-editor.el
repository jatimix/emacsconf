;;; init.el --- Initialize main feature of timconf
;;
;; Copyright (c) Timothée Bineau
;;
;; Author: Timothée Bineau <jatimix@gmail.com>
;; keyword: emacs conf
;; Requirements : none
;;; Commentary: none
;;; code:


;; Navigate windows with M-<arrows>
(require 'windmove)
(windmove-default-keybindings 'meta)
(setq windmove-wrap-around t)

;; saveplace remembers your location in a file when saving files
(require 'saveplace)
(setq save-place-file (expand-file-name "saveplace" tc-savefile-dir))
;; activate it for all buffers
(setq-default save-place t)


;; permet de delete des regions marqués
(delete-selection-mode t)

(provide 'tc-editor)
;;; tc-editor.el ends here
