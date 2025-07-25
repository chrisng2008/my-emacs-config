;; -*- lexical-binding: t -*-
;; Emacs 换源
(require 'package)
(setq package-archives '(("gnu"    . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("nongnu" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
                         ("melpa"  . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(package-initialize) ;; You might already have this line

;;防止反复调用 package-refresh-contents 会影响加载速度
(when (not package-archive-contents)
  (package-refresh-contents))

;; 增强补全
(package-install 'keycast)
(keycast-mode-line-mode)

(add-to-list 'load-path "~/.emacs.d/manual-packages/vertico-main")
(require 'vertico)
(vertico-mode t)
;; 开启模糊搜索
(package-install 'orderless)
(setq completion-styles '(orderless))

(package-install 'marginalia)
(marginalia-mode t)

(package-install 'embark)
(global-set-key (kbd "C-;") 'embark-act)
(setq prefix-help-command 'embark-prefix-help-command)


(setq mac-option-modifier 'meta
      mac-command-modifier 'super)

;; 开启行号
(global-display-line-numbers-mode 1) ; show the line number

(setq inhibit-startup-screen t) ; Inhibit the startup screen display

(setq tab-always-indent 'complete)

(setq electric-pair-mode t)

;;(toggle-frame-maximized)

; Edit the apperacne of Emacs
(tool-bar-mode -1)

(setq-default cursor-type '(bar . 3))
(show-paren-mode t)

(add-to-list 'load-path (expand-file-name "~/.emacs.d/awesome-tab/"))
(require 'awesome-tab)
(awesome-tab-mode t)

;; 自动补全插件
(global-company-mode 1)
(setq company-minimum-prefix-length 1)
(setq company-idle-delay 0)
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)

;; Org Mode 自动断行
(add-hook 'org-mode-hook 'toggle-truncate-lines)


(global-set-key (kbd "C-h C-f") 'find-function)

;; 同时设置英文字体和中文字体
;;(set-face-attribute 'default nil :font "JetBrains Mono-16")
;;(set-fontset-font t 'han (font-spec :family "PingFang SC"))

;; Windows按键设置
(when (eq system-type 'windows-nt)
  ;; Windows 特定的键绑定
  (setq w32-apps-modifier 'super)       ; 通过SharpKeys改成了 Application
  (global-set-key (kbd "s-a") 'mark-whole-buffer) ;;对应Windows上面的Ctrl-a 全选
  (global-set-key (kbd "s-c") 'kill-ring-save) ;;对应Windows上面的Ctrl-c 复制
  (global-set-key (kbd "s-s") 'save-buffer) ;; 对应Windows上面的Ctrl-s 保存
  (global-set-key (kbd "s-v") 'yank) ;对应Windows上面的Ctrl-v 粘贴
  (global-set-key (kbd "s-z") 'undo) ;对应Windows上面的Ctrol-z 撤销
  (global-set-key (kbd "s-x") 'kill-region) ;对应Windows上面的Ctrol-x 剪切
  )

;; Linux的按键配置
(when (eq system-type 'gnu/linux)
  (global-set-key (kbd "<menu>") nil)
  (define-key key-translation-map (kbd "<menu>") 'event-apply-super-modifier)
  (global-set-key (kbd "s-a") 'mark-whole-buffer) ;;对应Windows上面的Ctrl-a 全选
  (global-set-key (kbd "s-c") 'kill-ring-save) ;;对应Windows上面的Ctrl-c 复制
  (global-set-key (kbd "s-s") 'save-buffer) ;; 对应Windows上面的Ctrl-s 保存
  (global-set-key (kbd "s-v") 'yank) ;对应Windows上面的Ctrl-v 粘贴
  (global-set-key (kbd "s-z") 'undo) ;对应Windows上面的Ctrol-z 撤销
  (global-set-key (kbd "s-x") 'kill-region) ;对应Windows上面的Ctrol-x 剪切
)



;; 字体配置
(when (eq system-type 'darwin)
;;  (setq fonts '("Menlo" "PingFang SC"))
  (setq fonts '("Jetbrains Mono" "PingFang SC"))
  ;; 设置默认英文字体（JetbrainsMono NF Regular）
  (set-face-attribute 'default nil :font
                      (format "%s:pixelsize=%d" (car fonts) 16))
  (set-fontset-font t 'han (font-spec :family (cadr fonts)))
 ;; 添加emoji字体支持
  (set-fontset-font t 'unicode "Apple Color Emoji" nil 'prepend))

(when (eq system-type 'windows-nt)
  (setq fonts '("JetbrainsMono Regular" "MiSans VF"))
  (set-face-attribute 'default nil :font
                      (format "%s:pixelsize=%d" (car fonts) 16))
  (set-fontset-font t 'han (font-spec :family (cadr fonts)))
  (set-fontset-font t 'unicode "Segoe UI Emoji" nil 'prepend))

(when (eq system-type 'gnu/linux)
  ;;(setq fonts '("Jetbrains Mono" "Source Han Sans SC"))
  (setq fonts '("Jetbrains Mono" "MiSans VF"))
  ;; 设置默认英文字体
  (set-face-attribute 'default nil :font
                      (format "%s:pixelsize=%d" (car fonts) 24))
  (set-fontset-font t 'han (font-spec :family (cadr fonts)))
  (set-fontset-font t 'unicode "Noto Color Emoji" nil 'prepend))


;;让鼠标滚动更好用
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)

;;latex preview
;;(require 'org-latex-preview)
;;(setq org-latex-preview-auto-generate t) ; 自动预览

;; html preview
(require 'org-preview-html)

;; org mode 换行
;;(add-hook 'org-mode-hook 'visual-line-mode)

(load-theme 'doom-solarized-light t)

;; 配置跨平台输入法方案
;; Rime需要支持动态模块的Emacs，Linux默认支持
(when (eq system-type 'gnu/linux)
(require 'rime)
(setq rime-user-data-dir "~/.config/fcitx/rime")
(setq rime-posframe-properties
      (list :background-color "#333333"
            :foreground-color "#dcdccc"
;;            :font "WenQuanYi Micro Hei Mono-14"
            :font "Source Han Sans SC-14"
            :internal-border-width 10))
(setq default-input-method "rime"
      rime-show-candidate 'posframe))


;; 高亮当前行
(global-hl-line-mode 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("5c7720c63b729140ed88cf35413f36c728ab7c70f8cd8422d9ee1cedeb618de5"
     default))
 '(package-selected-packages nil)
 '(warning-suppress-log-types '((ox-latex))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; hugo blog
(use-package ox-hugo
  :ensure t   ;Auto-install the package from Melpa
  :pin melpa  ;`package-archives' should already have ("melpa" . "https://melpa.org/packages/")
  :after ox)

(with-eval-after-load 'org-capture
  (defun org-hugo-new-subtree-post-capture-template ()
    "Returns `org-capture' template string for new Hugo post.
See `org-capture-templates' for more information."
    (let* ((title (read-from-minibuffer "Post Title: ")) ;Prompt to enter the post title
           (fname (org-hugo-slug title)))
      (mapconcat #'identity
                 `(
                   ,(concat "* TODO " title)
                   ":PROPERTIES:"
                   ,(concat ":EXPORT_FILE_NAME: " fname)
                   ":END:"
                   "\n\n")          ;Place the cursor here finally
                 "\n")))

  (add-to-list 'org-capture-templates
               '("h"                ;`org-capture' binding + h
                 "Hugo post"
                 entry
                 ;; It is assumed that below file is present in `org-directory'
                 ;; and that it has a "Blog Ideas" heading. It can even be a
                 ;; symlink pointing to the actual location of all-posts.org!
                 (file+headline "~/myblog/all-blog.org" "Blog Ideas")
                 (function org-hugo-new-subtree-post-capture-template))))


;; eww proxy macos
(when (eq system-type 'darwin)
(setq url-proxy-services
      '(("http" . "127.0.0.1:7899")
        ("https" . "127.0.0.1:7899"))))

(when (eq system-type 'gnu/linux)
(setq url-proxy-services
      '(("http" . "127.0.0.1:7897")
        ("https" . "127.0.0.1:7897"))))

;; mac
(use-package exec-path-from-shell
  :ensure t
  :config
  (when (memq window-system '(mac ns x)) ; 通常只在 GUI 环境下需要
    (exec-path-from-shell-initialize)))

;; mac title bar
;;(when (eq system-type 'darwin) (ns-auto-titlebar-mode))

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


;; org mode
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

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

;; macos
(when (eq system-type 'darwin)
(setq TeX-view-program-selection '((output-pdf "Skim")))
;; Skim 的参数，--unique 确保只打开一个窗口
(setq TeX-view-program-Skim-args '("--unique" "%o")))

;; --- GNU/Linux (包括 WSL) 的通用 pdf-tools 配置 ---
;; 这个 use-package 块保持不变，它会安装 pdf-tools 并设置其内部查看器的行为。
;; 但是，在 WSL 环境下，我们将在后面的代码中覆盖 TeX-view-program-selection。
(when (eq system-type 'gnu/linux)
  (use-package pdf-tools
    :init
    (pdf-tools-install) ; 运行安装脚本，可能需要编译一些东西
    :config
    ;; 这里依然会把 "PDF Tools" 注册为 AUCTeX 的一个查看器选项
    (setq TeX-view-program-selection '((output-pdf "PDF Tools")))
    (setq TeX-view-program-list '(("PDF Tools" TeX-pdf-tools-sync-view)))
    (setq TeX-source-correlate-start-server t) ; 启用 SyncTeX
    (add-hook 'TeX-after-compilation-finished-functions #'TeX-revert-document-buffer) ; 编译完成后自动刷新PDF
    ;; 其他 pdf-tools 的自定义设置，例如按键绑定等
    )

  ;; 启用 AUCTeX 的 SyncTeX 模式
  (setq TeX-source-correlate-mode t)
  (add-hook 'pdf-view-mode-hook (lambda () (display-line-numbers-mode -1))))


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

;; Markdown preview
(add-to-list 'load-path "~/.emacs.d/plugins/markdown-preview-mode")
(require 'markdown-preview-mode)
(setq markdown-preview-stylesheets (list "http://thomasf.github.io/solarized-css/solarized-light.min.css"))
(add-to-list 'markdown-preview-javascript "http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-MML-AM_CHTML")
(add-to-list 'markdown-preview-javascript "http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-MML-AM_CHTML")

