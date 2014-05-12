;;; init.el --- Initialize main feature of timconf
;;
;; Copyright (c) Timothée Bineau
;;
;; Author: Timothée Bineau <jatimix@gmail.com>
;; keyword: emacs conf
;; Requirements : none
;;; Commentary: none
;;; code:

(defvar current-user
  (getenv
   (if (equal system-type 'windows-nt) "USERNAME" "USER")))

(message "Timconf is loading.. please wait %s" current-user)

(defvar tc-dir (file-name-directory load-file-name))
(defvar tc-savefile-dir (expand-file-name "savefile" tc-dir))
(defvar tc-el-get-dir (expand-file-name "el-get" tc-dir))

;; init PATH & exec-path from current shell
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (shell-command-to-string "$SHELL -c 'echo $PATH'")))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))
(when window-system (set-exec-path-from-shell-PATH))

(when (version< emacs-version "24.1")
  (error "Prelude requires at least GNU Emacs 24.1, but you're running %s" emacs-version))

;; ici on load cedet si on le souhaite

;; el-get section

(unless (require 'el-get nil 'noerror)
 (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp))
)

(setq el-get-recipe-path '(expand-file-name "recipes" tc-el-get-dir))

(setq
 my:el-get-packages
 '(el-get				; el-get is self-hosting
   php-mode-improved			; if you're into php...
   switch-window			; takes over C-x o
   auto-complete			; complete as you type with overlays
   color-theme		                ; nice looking emacs
   magit psvn org-mode auctex doxymacs
   emacs-w3m xml-rpc-el yasnippet
   android-mode json cmake-mode
   js2-mode markdown-mode
   auto-complete auto-complete-emacs-lisp
   auto-complete-css rainbow-mode rainbow-delimiters
   smartparens paredit expand-region color-theme-zenburn
   projectile projectile-rails windmove midnight
   browse-kill-ring bash-completion flycheck helm
   web-mode smex flx-ido ido-ubiquitous helm-misc helm-projectile
   ))

(el-get 'sync my:el-get-packages)

(add-to-list 'load-path tc-dir)
(load "vanilla-files.el")

(add-to-list 'load-path (expand-file-name "modules" tc-dir))
(load "tc-modules.el")

(provide 'init)
;;; init.el ends here
