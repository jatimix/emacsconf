;;; packaqe --- tc-company.el
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

(require 'company)

(setq company-idle-delay 0.5)
(setq company-tooltip-limit 10)
(setq company-minimum-prefix-length 2)

(global-company-mode 1)

;; special for ruby inf
;;(add-to-list 'load-path (expand-file-name "company-inf-ruby" tc-vendor-dir))
(require 'company-inf-ruby)

(eval-after-load 'company
  '(add-to-list 'company-backends 'company-inf-ruby))

(push 'company-robe company-backends)
(push 'company-readline company-backends)
(add-hook 'rlc-no-readline-hook (lambda () (company-mode -1)))

;; we fucking dont care about seeing company loaded or not
(diminish 'company-mode)

(provide 'tc-company)
;;; tc-company.el ends here
