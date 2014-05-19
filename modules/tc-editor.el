;;; init.el --- Initialize main feature of timconf
;;
;; Copyright (c) Timothée Bineau
;;
;; Author: Timothée Bineau <jatimix@gmail.com>
;; keyword: emacs conf
;; Requirements : none
;;; Commentary: none
;;; code:

;; active le diminish mode (fait disparaitre les mineurs dans la modeline)
(require 'diminish)
(eval-after-load "filladapt" '(diminish 'filladapt-mode))

;; on to the visual settings
(setq inhibit-splash-screen t)		; no splash screen, thanks
(line-number-mode 1)			; have line numbers and
(column-number-mode 1)			; column numbers in the mode line

(tool-bar-mode -1)			; no tool bar with icons
(scroll-bar-mode -1)			; no scroll bars
(menu-bar-mode -1)                      ; no menu bar (who use it anyway ?)
(blink-cursor-mode -1)                  ; no blink, life don't blink

(size-indication-mode t)                ; ?

(setq scroll-margin 0                   ;; better srcolling
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; make the fringe (gutter) smaller
;; the argument is a width in pixels (the default is 8)
(if (fboundp 'fringe-mode)
    (fringe-mode 4))

;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

;; choose your own fonts, in a system dependant way
(when (window-system)
  (set-frame-font "Source Code Pro")
  (set-face-attribute 'default nil :font "Source Code Pro" :height 110)
  (set-face-font 'default "Source Code Pro"))
;;  (set-face-font 'default "Monospace-10")

(global-hl-line-mode)			; highlight current line
(global-linum-mode 1)			; add line numbers on the left

;; avoid compiz manager rendering bugs
(add-to-list 'default-frame-alist '(alpha . 100))

;; Navigate windows with M-<arrows>
(require 'windmove)
(windmove-default-keybindings 'meta)
(setq windmove-wrap-around t)


;; copy/paste with C-c and C-v and C-x, check out C-RET too
(cua-mode)
(setq x-select-enable-clipboard t)
;; whenever an external process changes a file underneath emacs, and there
;; was no unsaved changes in the corresponding buffer, just revert its
;; content to reflect what's on-disk.
(global-auto-revert-mode 1)

;; apply this previous shit to dired mode too (quiet mod)
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

;; M-x shell is a nice shell interface to use, let's make it colorful.  If
;; you need a terminal emulator rather than just a shell, consider M-x term
;; instead.
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(setq explicit-shell-file-name "bash")
(setq explicit-bash-args '("-c" "export EMACS=; stty echo; bash"))
(setq comint-process-echoes t)

;; If you do use M-x term, you will notice there's line mode that acts like
;; emacs buffers, and there's the default char mode that will send your
;; input char-by-char, so that curses application see each of your key
;; strokes.
;;
;; The default way to toggle between them is C-c C-j and C-c C-k, let's
;; better use just one key to do the same.
(require 'term)
(define-key term-raw-map  (kbd "C-'") 'term-line-mode)
(define-key term-mode-map (kbd "C-'") 'term-char-mode)

;; Have C-y act as usual in term-mode, to avoid C-' C-y C-'
;; Well the real default would be C-c C-j C-y C-c C-k.
(define-key term-raw-map  (kbd "C-y") 'term-paste)

;; garbage collector
(setq gc-cons-threshold 20000000)

;; Ajoute une couleur sur la parathese enfante
(show-paren-mode 1)

;; beep deviens visible
(setq visible-bell t)

;; change le titre de la fenetre
(setq frame-title-format '(buffer-file-name "Emacs: %b (%f)" "Emacs : %b"))

;; supprime les trailing space a la savegarde
;; pour un mode en particulier : (add-hook ‘c-mode-hook (lambda () (add-to-list ‘write-file-functions ‘delete-trailing-whitespace)))
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; dossier d'autosave
(defvar tc-backup-dir (expand-file-name "backups" tc-dir))

;; save les auto saves et les backups dans tmp
(setq backup-directory-alist
      `((".*" . ,tc-backup-dir)))
(setq auto-save-file-name-transforms
      `((".*" ,tc-backup-dir t)))

;; crée des ~ dans tout les cas meme sous vc
(setq vc-make-backup-files t)

;; Emacs modes typically provide a standard means to change the
;; indentation width -- eg. c-basic-offset: use that to adjust your
;; personal indentation width, while maintaining the style (and
;; meaning) of any files you load.
(setq-default indent-tabs-mode nil)   ;; don't use tabs to indent
(setq-default tab-width 8)            ;; but maintain correct appearance

;; smart tab behavior - indent or complete
(setq tab-always-indent 'complete)

;; diminish keeps the modeline tidy
;;(requireo
;; (require 'volatile-highlights)
;; (volatile-highlights-mode t)
;; (diminish 'volatile-highlights-mode)

;; anzu-mode enhances isearch by showing total matches and current match position
(require 'anzu)
(diminish 'anzu-mode)
(global-anzu-mode)

;; clean up obsolete buffers automatically
(require 'midnight)

(require 'browse-kill-ring)
(browse-kill-ring-default-keybindings)
(global-set-key (kbd "s-y") 'browse-kill-ring)

(load-theme 'zenburn t)
;;(load-theme 'solarized-dark t)

;; choose your own fonts, in a system dependant way
(when (window-system)
  (set-frame-font "Source Code Pro")
  (set-face-attribute 'default nil :font "Source Code Pro" :height 110)
  (set-face-font 'default "Source Code Pro"))
;;  (set-face-font 'default "Monospace-10") (si y'a pas source code)

;; Navigate windows with M-<arrows>
(require 'windmove)
(windmove-default-keybindings 'meta)
(setq windmove-wrap-around t)

;; saveplace remembers your location in a file when saving files
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name "saveplace" tc-savefile-dir))


;; permet de delete des regions marqués
(delete-selection-mode t)

;; disable annoying blink-matching-paren
(setq blink-matching-paren nil)

;; active le rainbow mode
(rainbow-mode)
(diminish 'rainbow-mode)

;; active rainbow delimiter : les paranthèses changes de couleurs en fonction de leurs depth
(rainbow-delimiters-mode t)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(diminish 'rainbow-delimiters-mode)
(diminish 'auto-complete-mode)

;; Make dired less verbose (reprint with "(" and ")" )
(require 'dired-details)
(setq-default dired-details-hidden-string "--- ")
(dired-details-install)
;(diminish 'dired-details)

;; dired sort bitch (option pour "ls")
(setq dired-listing-switches "-laGhD --group-directories-first")

;; dired color ??
(eval-after-load 'dired '(progn (require 'dired-filetype-face)))

;; delete les auto save si une sauvegarde reussie
(setq delete-auto-save-file-if-necessary t)

;; auto save interval (tout les 100 caractères)
(setq auto-save-interval 100)

;; auto save time out (toute les 40 sec (default: 30)
(setq auto-save-timeout 40)

;; get rid of buffer<2> label
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; nice looking power line bitch
(require 'powerline)
(powerline-default-theme)
;;(powerline-center-evil-theme)
;;(diminish 'powerline-minor-modes)

;; powerline print flycheck state
(require 'flycheck-color-mode-line)
(eval-after-load "flycheck"
  '(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))

;; move les selections avec M-up et M-down
(require 'move-text)
(move-text-default-bindings)

(provide 'tc-editor)
;;; tc-editor.el ends here
