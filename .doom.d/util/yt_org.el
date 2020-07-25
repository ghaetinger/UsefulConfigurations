;;; ~/.doom.d/yt_org.el -*- lexical-binding: t; -*-
(defvar yt-iframe-format
  ;; You may want to change your width and height.
  (concat "<iframe"
          " src=\"https://www.youtube.com/embed/%s\""
          " frameborder=\"0\""
          " allowfullscreen>%s</iframe>"))

(let ((inhibit-message t))
  (org-add-link-type
   "yt"
   (lambda (handle)
     (browse-url
      (concat "https://www.youtube.com/embed/"
              handle)))
   (lambda (path desc backend)
     (cl-case backend
       (html (format yt-iframe-format
                     path (or desc "")))
       (latex (format "\href{%s}{%s}"
                      path (or desc "video")))))))
