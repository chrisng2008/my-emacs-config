(setq mac-option-modifier 'meta
      mac-command-modifier 'super)

(global-display-line-numbers-mode 1) ; show the line number

(setq inhibit-startup-screen t) ; Inhibit the startup screen display

(setq tab-always-indent 'complete)

(setq electric-pair-mode t)

(toggle-frame-maximized)

; Edit the apperacne of Emacs
(tool-bar-mode -1)
(setq cursor-type '(bar . 5))

;;(global-set-key (kbd "C-h C-f") 'find-function)


;; 同时设置英文字体和中文字体
;;(set-face-attribute 'default nil :font "JetBrains Mono-16")
;;(set-fontset-font t 'han (font-spec :family "PingFang SC"))

(when (eq system-type 'darwin)
  (setq fonts '("Jetbrains Mono" "PingFang SC"))
  ;; 设置默认英文字体（JetbrainsMono NF Regular）
  (set-face-attribute 'default nil :font
                      (format "%s:pixelsize=%d" (car fonts) 16))
  (set-fontset-font t 'han (font-spec :family (cadr fonts)))
  ;; 添加emoji字体支持
  (set-fontset-font t 'unicode "Apple Color Emoji" nil 'prepend))

(when (eq system-type 'windows-nt)
  (setq fonts '("JetbrainsMono NF Regular"))
  (set-fontset-font t 'unicode "Segoe UI Emoji" nil 'prepend)
  (set-face-attribute 'default nil :font
                      (format "%s:pixelsize=%d" (car fonts) 24)))

(when (eq system-type 'gnu/linux)
  (setq fonts '("JetbrainsMono NF Regular"))
  (set-fontset-font t 'unicode "Noto Color Emoji" nil 'prepend)
  (set-face-attribute 'default nil :font
                      (format "%s:pixelsize=%d" (car fonts) 24)))
