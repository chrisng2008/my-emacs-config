;; Emacs UI

;; 开启行号
(global-display-line-numbers-mode 1) ; show the line number

;; Theme
(load-theme 'doom-solarized-light t)

;; 同时设置英文字体和中文字体
;;(set-face-attribute 'default nil :font "JetBrains Mono-16")
;;(set-fontset-font t 'han (font-spec :family "PingFang SC"))

;; mac title bar
;;(when (eq system-type 'darwin) (ns-auto-titlebar-mode))

;; Fonts Configs
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

;; 高亮当前行
(global-hl-line-mode 1)


; Edit the apperacne of Emacs
(tool-bar-mode -1)

;;(toggle-frame-maximized)

(setq-default cursor-type '(bar . 3))
(show-paren-mode t)

(setq inhibit-startup-screen t) ; Inhibit the startup screen display



;; awesome-tab
(add-to-list 'load-path (expand-file-name "~/.emacs.d/awesome-tab/"))
(require 'awesome-tab)
(awesome-tab-mode t)


(provide 'init-ui)
