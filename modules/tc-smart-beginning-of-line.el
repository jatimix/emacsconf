;;; packaqe --- tc-smart-beginning-of-line.el
;;
;; Copyright (C) Timothée Bineau
;;
;; Author: Timothée Bineau <jatimix@gmail.com>
;; Keywords:
;; Requirements: --
;; Status: not intended to be distributed yet
;;; Commentary:
;;
;;
;;; Code:


(defun smart-beginning-of-line ()
  "Move point to first non-whitespace character or \"beginning-of-line\".
More pages point to the first non-whitespace character on this line.
If point was already at that position, move point to beginning of line."

  (interactive) ; Use (interactive "^") in Emacs 23 to make shift-select work
  (let ((oldpos (point)))
    (back-to-indentation)
    (and (= oldpos (point))
         (beginning-of-line))))


(provide 'tc-smart-beginning-of-line)
;;; tc-smart-beginning-of-line.el ends here
