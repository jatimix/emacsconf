;;; todo

;; (require 'auto-insert)

(add-hook 'find-file-hooks 'auto-insert)
(setq auto-insert-directory (expand-file-name "auto-insert" tc-dir))
(setq auto-insert 'other)
(setq auto-insert-query nil)

;; default list
(setq auto-insert-alist '(
                          ("\\.sh$" . ["insert.sh"          tc/auto-update-defaults])
                          ("\\.el$" . ["insert.el"          tc/auto-update-defaults])
                          ("Makefile$" . ["insert.makefile" tc/auto-update-defaults])
                          ("\\.pro$" . ["insert.makefile"   tc/auto-update-defaults])
                          ))

;; special func
(add-to-list 'auto-insert-alist '(".*/prog/.*\\.hpp$" . ["insert.h" tc/auto-update-header-file]))
(add-to-list 'auto-insert-alist '(".*/prog/.*\\.hh$" .  ["insert.h" tc/auto-update-header-file]))
(add-to-list 'auto-insert-alist '(".*/prog/.*\\.hxx$" . ["insert.h" tc/auto-update-header-file]))
(add-to-list 'auto-insert-alist '(".*/prog/.*\\.h$" .   ["insert.h" tc/auto-update-header-file]))
(add-to-list 'auto-insert-alist '(".*/prog/.*\\.c$" .   ["insert.c" tc/auto-update-c-source-file]))
(add-to-list 'auto-insert-alist '(".*/prog/.*\\.cc$" .  ["insert.c" tc/auto-update-c-source-file]))
(add-to-list 'auto-insert-alist '(".*/prog/.*\\.c$" .   ["insert.c" tc/auto-update-c-source-file]))
(add-to-list 'auto-insert-alist '(".*/prog/.*\\.cpp$" . ["insert.c" tc/auto-update-c-source-file]))

(defun tc/auto-replace-file-name ()
  (save-excursion
    (while (search-forward "(>>FILE<<)" nil t)
      (save-restriction
        (narrow-to-region (match-beginning 0) (match-end 0))
        (replace-match (file-name-nondirectory buffer-file-name) t)
        ))
    )
  )

(defun tc/auto-replace-file-name-no-ext ()
  (save-excursion
    (while (search-forward "(>>FILE_NO_EXT<<)" nil t)
      (save-restriction
        (narrow-to-region (match-beginning 0) (match-end 0))
        (replace-match (file-name-sans-extension (file-name-nondirectory buffer-file-name)) t)
        ))
    )
)

(defun tc/auto-replace-header-name ()
  (save-excursion
    (while (search-forward "###" nil t)
      (save-restriction
        (narrow-to-region (match-beginning 0) (match-end 0))
        (replace-match (upcase (file-name-nondirectory buffer-file-name)))
        (subst-char-in-region (point-min) (point-max) ?. ?_)
        (subst-char-in-region (point-min) (point-max) ?- ?_)
        ))
    )
  )

(defun tc/insert-today ()
  (interactive)
  (insert (format-time-string "%A, %B %e %Y" (current-time))))

(defun tc/auto-replace-date-time ()
  (save-excursion
    (while (search-forward "(>>DATE<<)" nil t)
      (save-restriction
        (narrow-to-region (match-beginning 0) (match-end 0))
        (replace-match "" t)
        (tc/insert-today)
        ))))

(defun tc/auto-update-header-file ()
  (tc/auto-replace-header-name)
  (tc/auto-replace-file-name)
)

(defun tc/auto-update-c-source-file ()
  (save-excursion
    (while (search-forward "HHHH" nil t)
      (save-restriction
        (narrow-to-region (match-beginning 0) (match-end 0))
        (replace-match (concat (file-name-sans-extension (file-name-nondirectory buffer-file-name)) ".h") t))))
  (tc/auto-replace-file-name)
  (tc/auto-replace-date-time))

(defun tc/auto-update-defaults ()
  (tc/auto-replace-file-name)
  (tc/auto-replace-file-name-no-ext)
  (tc/auto-replace-date-time)
)

(provide 'tc-auto-insert)

;;; tc-auto-insert.el ends here
