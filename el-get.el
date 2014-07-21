;;; packaqe --- el-get.el
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

(add-to-list 'load-path tc-el-get-bin-dir)

(unless (require 'el-get nil 'noerror)
 (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp))
)

;(el-get-recipe-path '(expand-file-name "recipes" tc-el-get-bin-dir))

(setq
 my:el-get-packages
 '(el-get                               ; need a breif ?
   php-mode-improved			; if you're into php...
   switch-window			; takes over C-x o
   company-mode                         ; better autocomplete
   color-theme		                ; nice looking emacs
   package                              ;; for elpa binding
   magit                                ; git mode
   psvn                                 ; svn magit
   org-mode                             ; organisation mode
   auctex                               ; tex mode
   emacs-w3m                            ; ?
   xml-rpc-el                           ; ?
   yasnippet                            ; snippet (FIX : todo)
   android-mode                         ;
   json                                 ;
   cmake-mode                           ; Qt make mode
   js2-mode                             ; better js mode
   markdown-mode                        ; For syntax highligh
   rainbow-mode                         ; red blue bitch
   rainbow-delimiters                   ; different color parent
   smartparens                          ; autopair, color etc
   paredit                              ; no idea
   expand-region                        ; check C-=
   color-theme-zenburn                  ; best theme
   projectile                           ; project managment
   projectile-rails                     ; for rail
   browse-kill-ring                     ; C-Y M-Y
   bash-completion                      ; add bash completion in eshell mode
   flycheck                             ; generiqu syntax check (gem install rubocop for ruby)
   helm                                 ; new mini buffer logic
   web-mode                             ; html, php, js, sql etc
   smex                                 ; better M-X
   ido-ubiquitous                       ; fix for ido
   undo-tree                            ; check undo-mode
   anzu                                 ; better matching look
   inf-ruby                             ; call at ruby subprocess : console, gem etc
   dired-filetype-face                  ; colorize dired
   dired-details                        ; simplify driver
   readline-complete                    ; better readline
   slim-mode                            ; for slim templates
   powerline                            ; vim looking mode line
   flycheck-color-mode-line             ; for highligh mode ligne
   move-text                            ; check M-up M-down
   git-gutter-fringe                    ; + or - when adding smth
   ))

(el-get 'sync my:el-get-packages)

;; Spécial packages from melpa
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(defvar my-melpa-packages '(robe ;; some enhancement for ruby (get def, symbol etc)
flx-ido ;; fix for ido
company-inf-ruby ;; backend for ruby for company
;company-c-headers ;;enable c header completion
)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-melpa-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(provide 'el-get)
;;; el-get.el ends here
