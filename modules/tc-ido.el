;;; init.el --- Initialize main feature of timconf
;;
;; Copyright (c) Timothée Bineau
;;
;; Author: Timothée Bineau <jatimix@gmail.com>
;; keyword: emacs conf
;; Requirements : none
;;; Commentary: none
;;; code:

(add-to-list 'load-path (expand-file-name "flx" tc-vendor-dir))

(require 'ido)
(require 'ido-ubiquitous)
(require 'flx-ido)

(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-max-prospects 10
      ido-save-directory-list-file (expand-file-name "ido.hist" tc-savefile-dir)
      ido-default-file-method 'selected-window
      ido-auto-merge-work-directories-length -1)
(ido-mode +1)
(ido-ubiquitous-mode +1)

;;; smarter fuzzy matching for ido
(flx-ido-mode +1)
;; disable ido faces to see flx highlights
(setq ido-use-faces nil)

;;; smex, remember recently and most frequently used commands
(require 'smex)
(setq smex-save-file (expand-file-name ".smex-items" tc-savefile-dir))
(smex-initialize)

(provide 'tc-ido.el)

;;; tc-ido.el ends here
