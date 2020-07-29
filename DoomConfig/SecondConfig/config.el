;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!
;;


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Guilherme G. Haetinger"
      user-mail-address "ghaetinger@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "Iosevka" :size 12 :weight 'semi-light))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-dracula)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(require 'org)
(setq org-directory "~/Dropbox/org/"
      org-agenda-files (list org-directory))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

(setq neo-theme 'icons
      neo-window-width 50)


(defun toggle-80-editting-columns ()
  "Set the right window margin so the edittable space is only 80 columns."
  (interactive)
  (let ((margins (window-margins)))
    (if (or (car margins) (cdr margins))
        (set-window-margins nil 0 0)
      (set-window-margins nil 0 (max (- (window-width) 80) 0)))))

(defun toggle-80-editting-columns-balanced ()
  "Set both window margins so the edittable space is only 80 columns."
  (interactive)
  (let ((margins (window-margins)))
    (if (or (car margins) (cdr margins))
        (set-window-margins nil 0 0)
      (let* ((change (max (- (window-width) 80) 0))
             (left (/ change 2))
             (right (- change left)))
        (set-window-margins nil left right)))))

(map! :leader :g "o p" 'neotree-toggle
      :leader :g "o c" 'fci-mode)

(require 'jupyter)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (julia . t)
   (python . t)
   (jupyter . t)))

(eval-after-load "tex-mode" '(fset 'tex-font-lock-subscript 'ignore))

(defun set-tex-method ()
  (set-input-method 'TeX)
  (define-key evil-insert-state-local-map (kbd "_ _")
    (lambda () (interactive) (insert "_")))
  (define-key evil-insert-state-local-map (kbd "^ ^")
    (lambda () (interactive) (insert "^"))))

(with-eval-after-load 'org
  (setq org-startup-indented t) ; Enable `org-indent-mode' by default
  (add-hook 'org-mode-hook #'auto-fill-mode))


(require 'neotree)
(setq neo-smart-open t)

(setq org-ellipsis " ↴")

(require 'ess-site)
(setq inferior-julia-program "~/.Util/.julia1.5/bin/julia")
(add-hook 'ess-julia-mode-hook
            (lambda ()
              (company-mode)
              (setq-local
               company-backends
               (add-to-list 'company-backends 'company-math-symbols-unicode))))


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
