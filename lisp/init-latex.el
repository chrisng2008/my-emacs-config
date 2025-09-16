;; Latex
(load "auctex.el" nil t t)
;; 下面这行有时会导致bug，若出现问题请注掉
;;(load "preview-latex.el" nil t t)

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(setq TeX-output-view-style (quote (("^pdf$" "." "evince %o %(outpage)"))))
(add-hook 'LaTeX-mode-hook
(lambda()
(add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
(setq TeX-command-default "XeLaTeX")))

;; --- 针对 WSL 环境的特定覆盖 ---
;; 这一段代码放在 pdf-tools 配置之后，以确保它能覆盖之前的设置。
(when (string-equal system-type "gnu/linux")
  (let ((uname-output (shell-command-to-string "uname -a")))
    (when (string-match-p "microsoft" uname-output)
      ;; 覆盖 AUCTeX 的 PDF 查看器设置，让它默认使用 wslview
      ;; 'output-pdf 是指编译输出是 PDF 文件
      ;; "WSLViewPDF" 是我们自定义的查看器名称
      (setq TeX-view-program-selection '((output-pdf "WSLViewPDF")))
      ;; 定义 "WSLViewPDF" 的实际执行命令
      ;; %o 是 AUCTeX 传递给查看器的输出文件路径
      (setq TeX-view-program-list '(("WSLViewPDF" "wslview %o")))

      ;; 确保 browse-url-browser-function 也正确设置，以防 Org-mode 使用它
      (setq browse-url-browser-function 'browse-url-generic
            browse-url-generic-program "wslview")

      ;; HTML 规则 (保持不变)
      (setq org-file-apps
            (cons '("\\.x?html?\\'" . "wslview %s")
                  (assq-delete-all "\\.x?html?\\'" org-file-apps)))

      ;; PDF 规则 (使用 wslview 打开 Windows 默认 PDF 浏览器)
      (setq org-file-apps
            (cons '("\\.pdf\\'" . "wslview %s")
                  (assq-delete-all "\\.pdf\\'" org-file-apps)))
      )))


(when (string-equal system-type "gnu/linux")
  (let ((uname-output (shell-command-to-string "uname -a")))
    (when (string-match-p "microsoft" uname-output)
      ;; 这行代码确保 Emacs 在 WSL 中被识别为使用 wslview
      (setq browse-url-browser-function 'browse-url-generic
            browse-url-generic-program "wslview")

      ;; 修改 org-file-apps，让它使用 wslview 打开 HTML 文件
      (setq org-file-apps
            (cons '("\\.x?html?\\'" . "wslview %s") ; 新规则：使用 wslview 打开 HTML
                  (assq-delete-all "\\.x?html?\\'" org-file-apps))) ; 删除旧的 HTML 规则

      ;; --- Add this section for PDF files ---
            ;; --- 修正后的 PDF 规则 (使用默认 PDF 浏览器) ---
      (setq org-file-apps
            (cons '("\\.pdf\\'" . "wslview %s") ; 简化的规则，让 wslview 打开 Windows 默认 PDF 浏览器
                  (assq-delete-all "\\.pdf\\'" org-file-apps)))

      ;; 缺少最外层的一个右括号
      ))) ; 补齐最外层的右括号

;; 启用 AUCTeX 的 SyncTeX 模式
(setq TeX-source-correlate-mode t)
(add-hook 'pdf-view-mode-hook (lambda () (display-line-numbers-mode -1)))

;; emacs TUI using mouse mode
(when (not (display-graphic-p))
  (xterm-mouse-mode +1))

(add-to-list 'load-path
              "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)
(use-package yasnippet-snippets)




(provide 'init-latex)
