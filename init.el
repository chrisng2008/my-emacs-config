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

(global-set-key (kbd "C-h C-f") 'find-function)



