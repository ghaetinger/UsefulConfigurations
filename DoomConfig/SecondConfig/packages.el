;; -*- no-byte-compile: t; -*-
;;; ~/.doom.d/packages.el

(package! neotree)
(package! fill-column-indicator
  :recipe (:host github
           :repo "rocian/Fill-Column-Indicator"))

(package! org-attach-screenshot)

(package! julia-mode)
(package! julia-repl)

(package! org-literate-config
  :recipe (:host github
           :repo "GuilhermeHaetinger/org-literate-config"))
