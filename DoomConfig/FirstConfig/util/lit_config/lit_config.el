(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(require 'lsp-julia)

(require 'org)
(require 'ox)
(require 'ox-hugo)
(require 'org-ref)

(require 'kaolin-themes)
(require 'treemacs)

(require 'auto-complete)

(kaolin-treemacs-theme)
(setq doom-themes-treemacs-theme "kaolin")

(setq doom-font                  (font-spec :family "Iosevka" :size 13)
      doom-big-font              (font-spec :family "Iosevka" :size 25)
      doom-theme                 'doom-gruvbox
      display-line-numbers-type  'relative)

(setq +doom-dashboard-banner-file (expand-file-name "util/logo.png" doom-private-dir))

 (setq split-width-threshold  0
       split-height-threshold 0)

(setq org-file-apps
  '((auto-mode . emacs)
    ("\\.mm\\'" . default)
    ("\\.x?html?\\'" . "brave %s")
    ("\\.pdf\\'" . "zathura %s")))

(load-file "~/.doom.d/util/yt_org.el")

(setq org-image-actual-width 500
      org-ellipsis           " ▼")

(setq org-agenda-files '("~/Dropbox/org"))

(setq org-confirm-babel-evaluate nil)

(setq org-latex-pdf-process
      '("latexmk -pdf %f"))

(setq org-latex-listings t)
(add-to-list 'org-latex-packages-alist '("" "listings"))
(add-to-list 'org-latex-packages-alist '("" "color"))

(with-eval-after-load 'ox-latex
  (add-to-list 'org-latex-classes
               '("IEEEtran"
                 "\\documentclass{IEEEtran}"
                  ("\\section{%s}" . "\\section*{%s}")
                  ("\\subsection{%s}" . "\\subsection*{%s}")
                  ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))))

(map! :map org-agenda-mode-map "C-c v" 'org-agenda-entry-text-mode)

(map! :g "C-x t" 'treemacs
      :g "C-c c" 'open-literate-config);

(global-set-key (kbd "C-<prior>")  'centaur-tabs-backward)
(global-set-key (kbd "C-<next>") 'centaur-tabs-forward)

(set-popup-rule! "*Python*"              :side 'right :width 0.5)
(set-popup-rule! "*julia*"               :side 'right :width 0.5)

(setq lsp-julia-package-dir nil
      lsp-julia-package-dir (concat lsp-julia--self-path "languageserver")
      lsp-julia-flags       `(,(concat "--project=" lsp-julia-package-dir)
                                       "--startup-file=no"
                                       "--history-file=no"))

(add-hook 'julia-repl-mode-hook #'lsp-mode)
(add-to-list 'auto-mode-alist '("\\.jl\\'" . julia-mode))

(load-file "~/.doom.d/util/osl_mode.el")
(setq auto-mode-alist (append '(("\\.osl$" . osl-mode))
      auto-mode-alist))

(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "brave")

(setq doom-scratch-buffer-major-mode 'org-mode)
(set-popup-rule! "^\\*doom:scratch.*\\*" :side 'right)

(setq user-full-name    "Guilherme Gomes Haetinger"
      user-mail-address "ghaetinger@gmail.com")

(global-auto-complete-mode 1)
(add-to-list 'ac-modes 'org-mode)
