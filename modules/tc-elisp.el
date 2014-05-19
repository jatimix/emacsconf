;;; packaqe --- tc-elisp.el
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

;; recompile les elisp si un elc exist pendant la sauvegarde
(defun byte-compile-current-buffer ()
  "`byte-compile' current buffer if it's emacs-lisp-mode and compiled file exists."
  (interactive)
  (when (and (eq major-mode 'emacs-lisp-mode)
             (file-exists-p (byte-compile-dest-file buffer-file-name)))
    (byte-compile-file buffer-file-name)))

(add-hook 'after-save-hook 'byte-compile-current-buffer)

(provide 'tc-elisp)
;;; tc-elisp.el ends here
