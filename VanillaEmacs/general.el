(require 'general)

(general-define-key
 "M-x" 'helm-M-x)

(general-define-key
 :keymaps 'normal
 :prefix "SPC"
 "p" '(:keymap projectile-command-map :wk "projectile prefix" :package projectile)
 )
