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
(defvar tc-el-get-bin-dir (expand-file-name "el-get" tc-el-get-dir))
;; contient les modules qui ne sont pas dans el-get
(defvar tc-vendor-dir (expand-file-name "vendor" tc-dir))

;; on add le loadpath pour les requires
(add-to-list 'load-path tc-vendor-dir)

;; init PATH & exec-path from current shell
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (shell-command-to-string "$SHELL -c 'echo $PATH'")))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))
(when window-system (set-exec-path-from-shell-PATH))

(when (version< emacs-version "24.1")
  (error "Prelude requires at least GNU Emacs 24.1, but you're running %s" emacs-version))

;; ici on load cedet si on le souhaite

;; special timconf dir
(add-to-list 'load-path tc-dir)
(add-to-list 'load-path (expand-file-name "modules" tc-dir))

;; el-get section "load install all packages"
(load "el-get.el")

;; lauch tc loading
(load "tc-modules.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flycheck-color-mode-line-error-face ((t (:inherit flycheck-fringe-error :background "red" :weight normal))))
 '(flycheck-color-mode-line-info-face ((t (:inherit flycheck-fringe-info :background "deep sky blue" :weight normal))))
 '(flycheck-color-mode-line-warning-face ((t (:inherit flycheck-fringe-warning :background "yellow" :weight normal)))))

(put 'dired-find-alternate-file 'disabled nil)

(provide 'init)
;;; init.el ends here
