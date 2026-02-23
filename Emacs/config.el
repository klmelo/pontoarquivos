(setq doom-font (font-spec :family "Fantasque Sans Mono" :size 16 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "Fantasque Sans Mono" :size 17))

(setq doom-theme 'doom-gruvbox-light)


(setq display-line-numbers-type t)

(setq org-directory "~/org/")


(use-package! eldoc-box
  :hook (eglot-managed-mode . eldoc-box-hover-mode)
  :config
  (setq eldoc-box-max-pixel-width 600)
  (setq eldoc-box-max-pixel-height 300))

(after! eglot
  (add-to-list 'eglot-ignored-server-capabilities :inlayHintProvider)
    (setq eglot-jl-language-server-project
        (expand-file-name "~/.julia/environments/v1.12/")))

(setq fancy-splash-image "./doom-emacs-color.png")

(use-package! org-fragtog
  :after org
  :hook (org-mode . org-fragtog-mode))

 (after! org
  (setq olivetti-body-width 80)
  (add-hook 'org-mode-hook #'olivetti-mode)
  (add-hook 'org-mode-hook #'visual-line-mode)

  (add-hook 'org-mode-hook
            (lambda ()
              (text-scale-set 1.1)
              (setq line-spacing 0.15)
              (setq indicate-empty-lines nil)))

  (setq org-preview-latex-default-process 'dvisvgm)

  (setq org-format-latex-options
        (plist-put (plist-put org-format-latex-options :scale 2.0)
                   :background 'default))

  (custom-set-faces!
    '(org-latex-and-related :background nil :inherit default))

  (add-hook 'org-mode-hook #'org-superstar-mode)
  (setq org-superstar-headline-bullets-list '("◉" "○" "✸" "✿"))
  (setq org-hide-leading-stars t)

  (setq org-hide-emphasis-markers t)


  (custom-set-faces!

    '(org-document-title :height 1.8 :weight bold :foreground "#A0522D")


    '(org-document-info-keyword :height 0.8 :foreground "#888888" :slant italic)
    '(org-latex-and-related :background nil :inherit default)
    '(org-document-title :height 1.8 :weight bold :foreground "#A0522D")
    '(org-document-info-keyword :height 0.8 :foreground "#888888" :slant italic)


    '(org-meta-line :inherit shadow :slant italic :height 0.75)
    )

)
