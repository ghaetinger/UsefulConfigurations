;; -*- no-byte-compile: t; -*-
;;; ~/.doom.d/packages.el

(package! spacemacs-theme)
(package! emojify)
(package! neotree)
;; (package! fill-column-indicator
;;   :recipe (:host github
;;            :repo "rocian/Fill-Column-Indicator"))

(package! org-attach-screenshot)
(package! org-ref)
(package! org-roam)
(package! org-roam-server)
(package! org-superstar)
(package! org-projectile)

(package! julia-mode)
(package! julia-repl)

(package! impatient-mode)

(package! company-go)

(package! ess)

(package! org-literate-config
  :recipe (:host gitlab
           :repo "ghaetinger/org-literate-config"))

(package! gitmoji
  :recipe (:host github
           :repo "Tiv0w/gitmoji"))
