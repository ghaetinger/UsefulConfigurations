(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
(load-file (concat user-emacs-directory "/packages.el"))

;; Path
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; Visual
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(require 'telephone-line)
(setq telephone-line-primary-left-separator 'telephone-line-cubed-left
      telephone-line-secondary-left-separator 'telephone-line-cubed-hollow-left
      telephone-line-primary-right-separator 'telephone-line-cubed-right
      telephone-line-secondary-right-separator 'telephone-line-cubed-hollow-right
      telephone-line-height 24)
(telephone-line-mode 1)

(setq doom-themes-enable-bold t
      doom-themes-enable-italic t)
(load-theme 'doom-dracula t)

(doom-themes-visual-bell-config)
(doom-themes-neotree-config)
(doom-themes-org-config)

(setq custom-file (concat user-emacs-directory "/custom.el"))

(set-face-attribute 'default nil :font "JetBrains Mono" :height 120)

(load-file (concat user-emacs-directory "/ligatures.el"))

(setq hl-todo-keyword-faces
      '(("TODO"   . "#FF0000")
        ("FIXME"  . "#FF0000")
        ("DEBUG"  . "#A020F0")
        ("GOTCHA" . "#FF4500")
        ("STUB"   . "#1E90FF")))

(global-hl-todo-mode 1)

;; Dashboard
(setq dashboard-items '((recents  . 5)
                        (projects . 10)
                        (agenda . 5)))

(dashboard-setup-startup-hook)

;; Usability
(setq evil-want-keybinding nil)
(require 'evil)
(require 'evil-collection)
(evil-collection-init)

(setq-default indent-tabs-mode nil)

(require 'undo-tree)
(global-undo-tree-mode)
(evil-mode)
(evil-set-undo-system 'undo-tree)

(setq vterm-shell "/bin/zsh")
(setq make-backup-files nil)
(setq create-lockfiles nil)
(setq initial-major-mode 'org-mode)

(require 'which-key)
(which-key-mode)

;; Projects

(require 'projectile)
(require 'helm-projectile)
(setq projectile-project-search-path '("~/Build/"))
(projectile-mode +1)
(helm-projectile-on)

(direnv-mode)

;; LSP
(add-hook 'company-mode-hook 'company-box-mode)
(global-company-mode)

;; Langs
(require 'lsp-julia)
(require 'rustic)
(add-to-list 'auto-mode-alist '("\\.elixir2\\'" . elixir-mode))
(add-hook 'elixir-mode-hook 'lsp)
(add-hook 'rust-mode-hook 'lsp)
(setq lsp-enable-file-watchers t
      lsp-file-watch-threshold 2000)

(setq require-final-newline t)
(add-hook 'before-save-hook 'lsp-format-buffer)

;; Org

(require 'org)
(require 'ox-latex)
(setq org-latex-listings 'minted
      org-latex-packages-alist '(("" "minted"))
      org-latex-pdf-process '(
                              "xelatex -shell-escape %f"
                              "xelatex -shell-escape %f"
                              ))
(add-hook 'org-mode-hook 'auto-fill-mode)

(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(setq initial-major-mode 'org-mode)

;; Keybinds
(load-file (concat user-emacs-directory "/general.el"))


