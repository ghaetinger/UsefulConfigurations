(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
(load-file (concat user-emacs-directory "/packages.el"))
(load-file (concat user-emacs-directory "/general.el"))

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
(load-theme 'doom-one t)

(doom-themes-visual-bell-config)
(doom-themes-neotree-config)
(doom-themes-org-config)

(setq custom-file (concat user-emacs-directory "/custom.el"))

(set-face-attribute 'default nil :font "JetBrainsMono Nerd Font Mono" :height 160)

(load-file (concat user-emacs-directory "/ligatures.el"))

;; Usability
(setq evil-want-keybinding nil)
(require 'evil)
(require 'evil-collection)
(evil-mode 1)
(evil-collection-init)

(require 'which-key)
(which-key-mode)

(require 'projectile)
(require 'helm-projectile)
(setq projectile-project-search-path '("~/Desktop/"))
(projectile-mode +1)
(helm-projectile-on)

(setq-default indent-tabs-mode nil)

(require 'undo-tree)
(global-undo-tree-mode)
(evil-set-undo-system 'undo-tree)

(setq vterm-shell "/bin/zsh")
(setq make-backup-files nil)

;; LSP
(add-hook 'company-mode-hook 'company-box-mode)
(global-company-mode)

;; Langs
(require 'lsp-julia)
(require 'rustic)
(add-to-list 'auto-mode-alist '("\\.elixir2\\'" . elixir-mode))
(add-to-list 'exec-path (expand-file-name "~/Documents/elixir-ls/"))
(add-hook 'elixir-mode-hook 'lsp)
(add-hook 'rust-mode-hook 'lsp)

;; Org

(require 'org)
(require 'ox-latex)
(setq org-latex-listings 'minted
      org-latex-packages-alist '(("" "minted"))
      org-latex-pdf-process '("xelatex -shell-escape %f"))

