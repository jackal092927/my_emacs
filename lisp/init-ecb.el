;;==============================================================
;;ecb配置
;;==============================================================
(add-to-list 'load-path "~/.emacs.d/tools/ecb.bak2")
;; (require-package 'ecb)
;; (load-file "~/.emacs/tools/ecb.bak2/ecb-autoloads.el")
;; (require 'ecb)

(require 'ecb-autoloads)
;;自动启动ecb并且不显示每日提示
;; (setq ecb-auto-activate t)
 (setq ecb-tip-of-the-day nil)

(provide 'init-ecb)
