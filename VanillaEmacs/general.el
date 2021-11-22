(require 'general)

;; (general-define-key
;;  :keymaps 'ryo-modal-mode-map
;;  :prefix "SPC"
;;  "p" '(:keymap projectile-command-map :wk "projectile" :package projectile)
;;  "b" (general-simulate-key "C-x" :which-key "buffer")
;;  "SPC" 'helm-M-x
;; )

;; (general-define-key
;;  :keymaps 'ryo-modal-mode-map
;;  :prefix "SPC f"
;;  :which-key "file"
;;  "f" 'find-file
;;  "s" 'swiper
;;  "w" 'save-buffer
;;  )

;; (general-define-key "<escape>" 'ryo-modal-mode)

(general-define-key
 :keymaps 'normal
 :prefix "SPC"
 "p" '(:keymap projectile-command-map :wk "projectile" :package projectile)
 "b" (general-simulate-key "C-x" :which-key "buffer")
 "SPC" 'helm-M-x
)

(general-define-key
 :keymaps 'normal
 :prefix "SPC f"
 :which-key "file"
 "f" 'find-file
 "s" 'swiper
 "w" 'basic-save-buffer
 "e" 'sudo-edit
 )

(general-define-key "M-x" 'helm-M-x)
