(setq quelpa-update-melpa-p nil)

(setq package-archives
'(("GNU ELPA" . "https://elpa.gnu.org/packages/")
("MELPA Stable" . "https://stable.melpa.org/packages/")
("MELPA" . "https://melpa.org/packages/"))
package-archive-priorities
'(("MELPA Stable" . 10)
("MELPA" . 5)
("GNU ELPA" . 0)))

(unless (package-installed-p 'quelpa)
  (with-temp-buffer
    (url-insert-file-contents "https://raw.githubusercontent.com/quelpa/quelpa/master/quelpa.el")
    (eval-buffer)
    (quelpa-self-upgrade)))

(quelpa 'gnu-elpa-keyring-update)
(quelpa 'exec-path-from-shell)

;; Usability
(quelpa 'evil)
(quelpa 'evil-collection)
(quelpa 'vterm)
(quelpa 'which-key)
(quelpa 'undo-tree)
(quelpa 'helm)
(quelpa 'general)
(quelpa 'use-package)
(quelpa 'swiper-helm)

;; Writing
(quelpa 'org)
(quelpa 'org-beamer)

;; Projects
(quelpa 'projectile)
(quelpa 'helm-projectile)
(quelpa 'magit)

;; Looks
(quelpa 'doom-themes)
(quelpa 'telephone-line)
(quelpa 'hl-todo)
(quelpa 'dashboard)

;; LSP
(quelpa 'lsp-mode)
(quelpa 'lsp-ui)
(quelpa 'yasnippet)
(quelpa 'company)
(quelpa 'company-box)

;; Langs
(quelpa 'elixir-mode)
(quelpa 'rustic)
(quelpa 'julia-mode)
(quelpa 'lsp-julia)
(quelpa 'protobuf-mode)
