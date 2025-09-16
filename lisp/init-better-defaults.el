;; 自动补全插件
(global-company-mode 1)
(setq company-minimum-prefix-length 1)
(setq company-idle-delay 0)
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)

(setq tab-always-indent 'complete)


(setq electric-pair-mode t)

;;让鼠标滚动更好用
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)

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



(provide 'init-better-defaults)
