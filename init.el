;; Emacs 换源
(setq package-archives '(("gnu"    . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("nongnu" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
                         ("melpa"  . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(package-initialize) ;; You might already have this line

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

(setq cursor-type '(bar . 5))

;; 自动补全插件
(global-company-mode 1)
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)


(global-set-key (kbd "C-h C-f") 'find-function)

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


;; 同时设置英文字体和中文字体
;;(set-face-attribute 'default nil :font "JetBrains Mono-16")
;;(set-fontset-font t 'han (font-spec :family "PingFang SC"))

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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("65a4ed5f62a21ad331b18db2bdd519e0404f9f34278051ce2a0807be8dc30d6b"
     default))
 '(package-selected-packages
   '(company doom-themes flucui-themes org-preview-html
	     org-preview-html-mode))
 '(warning-suppress-log-types '((ox-latex))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;latex preview
;;(require 'org-latex-preview)
;;(setq org-latex-preview-auto-generate t) ; 自动预览

;; html preview
(require 'org-preview-html)

;; org mode 换行
(add-hook 'org-mode-hook 'visual-line-mode)

(load-theme 'doom-one-light t)
