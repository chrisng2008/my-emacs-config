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
  (setq fonts '("Jetbrains Mono" "PingFang SC"))
  ;; 设置默认英文字体（JetbrainsMono NF Regular）
  (set-face-attribute 'default nil :font
                      (format "%s:pixelsize=%d" (car fonts) 16))
  (set-fontset-font t 'han (font-spec :family (cadr fonts)))
  ;; 添加emoji字体支持
  (set-fontset-font t 'unicode "Apple Color Emoji" nil 'prepend))

(when (eq system-type 'windows-nt)
  (setq fonts '("JetbrainsMono Regular"))
  (set-fontset-font t 'unicode "Segoe UI Emoji" nil 'prepend)
  (set-face-attribute 'default nil :font
                      (format "%s:pixelsize=%d" (car fonts) 24)))

(when (eq system-type 'gnu/linux)
  (setq fonts '("Jetbrains Mono" "Source Han Sans SC"))
  (set-fontset-font t 'unicode "Noto Color Emoji" nil 'prepend)
  (set-face-attribute 'default nil :font
                      (format "%s:pixelsize=%d" (car fonts) 24)))

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

(load-theme 'doom-dracula t)


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
 '(package-selected-packages nil))
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


(setq org-hugo-export-with-author nil)

