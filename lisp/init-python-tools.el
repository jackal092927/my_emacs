;; setting for Python env
(require 'python-mode)

;; load pymacs
(require 'pymacs)

(setq pymacs-load-path '("~/.emacs.d/el-get/rope"
                         "~/.emacs.d/el-get/ropemacs"))

(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
(setq py-load-pymacs-p nil)
;;(eval-after-load "pymacs"
;;  '(add-to-list 'pymacs-load-path YOUR-PYMACS-DIRECTORY"))



;; load ropmacs
(pymacs-load "ropemacs" "rope-")
(setq ropemacs-enable-autoimport t)

;; load flymake
(when (load "flymake" t)
     (defun flymake-pyflakes-init ()
       (let* ((temp-file (flymake-init-create-temp-buffer-copy
                          'flymake-create-temp-inplace))
      (local-file (file-relative-name
               temp-file
               (file-name-directory buffer-file-name))))
         (list "pyflakes" (list local-file))))

     (add-to-list 'flymake-allowed-file-name-masks
          '("\\.py\\'" flymake-pyflakes-init)))

(add-hook 'find-file-hook 'flymake-find-file-hook)

(defun my-flymake-show-help ()
  (when (get-char-property (point) 'flymake-overlay)
   (let ((help (get-char-property (point) 'help-echo)))
    (if help (message "%s" help)))))

(add-hook 'post-command-hook 'my-flymake-show-help)



;; pycomplete
(require 'pycomplete)
(setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
(autoload 'python-mode "python-mode" "Python editing mode." t)
(setq interpreter-mode-alist(cons '("python" . python-mode)
                           interpreter-mode-alist))



(provide 'init-python-tools)
