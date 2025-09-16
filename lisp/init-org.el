;; Org Settings


;; Org Mode 自动断行
(add-hook 'org-mode-hook 'toggle-truncate-lines)

;; html preview
(require 'org-preview-html)

;; org mode 换行
;;(add-hook 'org-mode-hook 'visual-line-mode)


;;latex preview
;;(require 'org-latex-preview)
;;(setq org-latex-preview-auto-generate t) ; 自动预览


(when (eq system-type 'darwin)
(use-package org-latex-impatient
  :defer t  ; 延迟加载，直到需要时才加载
  :hook (org-mode . org-latex-impatient-mode) ; 在打开 Org 文件时自动启用
  :init
  (setq org-latex-impatient-tex2svg-bin
        "/usr/local/bin/tex2svg-wrapper"))) ; 设置 tex2svg 的路径

(when (eq system-type 'gnu/linux)
(use-package org-latex-impatient
  :defer t  ; 延迟加载，直到需要时才加载
  :hook (org-mode . org-latex-impatient-mode) ; 在打开 Org 文件时自动启用
  :init
  (setq org-latex-impatient-tex2svg-bin
        "/home/chris/script/mathjax-converter/tex2svg"))) ; 设置 tex2svg 的路径

;;(add-hook 'org-mode-hook 'org-fragtog-mode)
(setq org-format-latex-options (plist-put org-format-latex-options :scale 1.5))


(provide 'init-org)
