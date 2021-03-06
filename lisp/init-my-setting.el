;; (add-to-list 'exec-path "/usr/local/bin")
;; (add-to-list 'load-path "~/.emacs.d/lisp")
;; (add-to-list 'load-path "~/.emacs.d/elpa")
(prefer-coding-system 'utf-8)

(tool-bar-mode -1)


;; el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)


;; ;; 鼠标颜色设置为白色   
;; (set-mouse-color "white")   
;; ;; 设置背景颜色和字体颜色   
;; (set-foreground-color "grey")   
;; (set-background-color "black")   
;; ;; 设置另外一些颜色：语法高亮显示的背景和主题，区域选择的背景和主题，二次选择的背景和选择   
;; (set-face-foreground 'highlight "white")   
;; (set-face-background 'highlight "blue")   
;; (set-face-foreground 'region "cyan")   
;; (set-face-background 'region "blue")   
;; (set-face-foreground 'secondary-selection "skyblue")   
;; (set-face-background 'secondary-selection "darkblue")   
;; ;;设置日历的一些颜色   
;; (setq calendar-load-hook   
;;     '(lambda ()   
;;     (set-face-foreground 'diary-face "skyblue")   
;;     (set-face-background 'holiday-face "slate blue")   
;;     (set-face-foreground 'holiday-face "white")))  
;; ;;外观设置   
;; ;;去掉工具栏   
;; (tool-bar-mode nil)   
;; ;;去掉菜单栏，我将F10绑定为显示菜单栏，万一什么东西忘了，需要菜单栏了可以摁F10调出，再摁F10就去掉菜单   
;; (menu-bar-mode nil)   
;; ;;不要滚动栏，现在都用滚轴鼠标了，可以不用滚动栏了   
;; (scroll-bar-mode nil)   
;;   
;; ;;备份设置   
;; ;;emacs还有一个自动保存功能，默认在~/.emacs.d/auto-save-list里，这个非常有用，我这里没有改动，具体可以参见Sams teach yourself emacs in 24hours(我简称为sams24)   
;; ;;启用版本控制，即可以备份多次   
;; (setq version-control t)   
;; ;;备份最原始的版本两次，记第一次编辑前的文档，和第二次编辑前的文档   
;; (setq kept-old-versions 2)   
;; ;;备份最新的版本五次，理解同上   
;; (setq kept-new-versions 5)   
;; ;;删掉不属于以上7中版本的版本   
;; (setq delete-old-versions t)   
;; ;;设置备份文件的路径   
;; (setq backup-directory-alist '(("." . "~/.emacs.tmp")))   
;; ;;备份设置方法，直接拷贝   
;; (setq backup-by-copying t)   
;;   
;;自动补全功能，这事从王垠的网站直接Copy过来的，引用一些他对此的说明   
;;你可以设置以下 hippie-expand 的补全方式。它是一个优先列表， hippie-expand 会优先使用表最前面的函数来补全   
;;这是说，首先使用当前的buffer补全，如果找不到，就到别的可见的窗口里寻找，如果还找不到，那么到所有打开的buffer去找，如果还……那么到kill-ring里，到文件名，到简称列表里，到list，…… 当前使用的匹配方式会在 echo 区域显示。   
;;特别有意思的是 try-expand-line，它可以帮你补全整整一行文字。我很多时后有两行文字大致相同，只有几个字不一样，但是我懒得去拷贝粘贴以下。那么我就输入这行文字的前面几个字。然后多按几下 M-/ 就能得到那一行。  
(global-set-key [(meta ?/)] 'hippie-expand)   
(setq hippie-expand-try-functions-list   
'(try-expand-line   
try-expand-line-all-buffers   
try-expand-list   
try-expand-list-all-buffers   
try-expand-dabbrev   
try-expand-dabbrev-visible   
try-expand-dabbrev-all-buffers   
try-expand-dabbrev-from-kill   
try-complete-file-name   
try-complete-file-name-partially   
try-complete-lisp-symbol   
try-complete-lisp-symbol-partially   
try-expand-whole-kill))   
;;   
;; ;;时间戳设置(time-stamp)，设定文档上次保存的信息   
;; ;;只要里在你得文档里有Time-stamp:的设置，就会自动保存时间戳   
;; ;;启用time-stamp   
;; (setq time-stamp-active t)   
;; ;;去掉time-stamp的警告？   
;; (setq time-stamp-warn-inactive t)   
;; ;;设置time-stamp的格式，我如下的格式所得的一个例子：<hans 05/18/2004 12:01:12>   
;; (setq time-stamp-format "%:u %02m/%02d/%04y %02H02M02S")   
;; ;;将修改时间戳添加到保存文件的动作里。   
;; (add-hook 'write-file-hooks 'time-stamp)   
;;   
;; ;;时间显示设置   
;; ;;启用时间显示设置，在minibuffer上面的那个杠上（忘了叫什么来着）   
(display-time-mode 1)   
;;时间使用24小时制   
(setq display-time-24hr-format t)   
;;时间显示包括日期和具体时间   
(setq display-time-day-and-date t)   
;;时间栏旁边启用邮件设置   
(setq display-time-use-mail-icon t)   
;;时间的变化频率，单位多少来着？   
(setq display-time-interval 10)   
   
;; hvj的讨论和推广emacs贴3：   
;; 这里继续帖我得hvj-basic-config.el，讲另外一些比较零碎的设置   
;; 引用:;;启用minibuffer，好像是默认设置吧   
(minibuffer-electric-default-mode 1)   
;;启用部分补全功能，如输入M-x q r r相当于M-x query-replace-regexp   
;;(partial-completion-mode 1)   
;; ;;在minibuffer里启用自动补全函数和变量   
;; (icomplete-mode 1)   
;; ;;所有的问题用y/n方式，不用yes/no方式。有点懒，只想输入一个字母   
;; (fset 'yes-or-no-p 'y-or-n-p)   
;; ;;允许minibuffer自由变化其大小（指宽度）   
;; (setq resize-mini-windows t)   
;; ;;当寻找一个同名的文件，自动关联上那个文件？   
;; (setq uniquify-buffer-name-style 'forward)   
;; ;;在emacs读man文档时，使用当前buffer   
;; (setq Man-notify-method 'pushy)   
;; ;;鼠标自动避开指针，如当你输入的时候，指针到了鼠标的位置，鼠标有点挡住视线了   
;; (mouse-avoidance-mode 'animate)   
;; ;;允许自动打开图片，如wiki里面   
;; (auto-image-file-mode)   
;; ;;可以操作压缩文档   
;; (auto-compression-mode 1)   
;; ;;在minibuffer上面可以显示列号   
;; (column-number-mode t)   
;; ;;显示默认的文档的宽度，看起来比较舒服？   
;; (setq default-fill-column 60)   
;; ;;指针不要闪，我得眼睛花了   
;; (blink-cursor-mode -1)   
;; ;;当指针到一个括号时，自动显示所匹配的另一个括号   
;; (show-paren-mode 1)   
;; ;;是用滚轴鼠标   
;; (mouse-wheel-mode t)   
;; ;;去掉烦人的警告铃声   
;; (setq visible-bell nil)   
;; ;;滚动页面时比较舒服，不要整页的滚动   
;; (setq scroll-step 1   
;; scroll-margin 3   
;; scroll-conservatively 10000)   
;; ;;设定句子结尾，主要是针对中文设置   
;; (setq sentence-end "\\([¡££¡£¿]\\|¡¡\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")   
;; (setq sentence-end-double-space nil)   
;; ;;去掉Emacs和gnus启动时的引导界面   
;; (setq inhibit-startup-message t)   
;; (setq gnus-inhibit-startup-message t)   
;; ;;当指针移到另一行，不要新增这一行？d   
;; (setq next-line-add-newlines nil)   
;; ;;在文档最后自动插入空白一行，好像某些系统配置文件是需要这样的   
;; (setq require-final-newline t)   
;; (setq track-eol t)   
;; ;;使用C-k删掉指针到改行末的所有东西   
;; (setq-default kill-whole-line t)   
;; ;;设定删除保存记录为200，可以方便以后无限恢复   
;; (setq kill-ring-max 200)   
;; ;;增大使用查找函数和变量的寻找范围   
;; (setq apropos-do-all t)   
;; ;;是用aspell程序作为Emacs的拼写检查成学   
;; (setq-default ispell-program-name "aspell")   
;; ;;使用narrow功能时的一个设置   
;; (put 'narrow-to-region 'disabled nil)   
;; ;;启动Emacs自动设置为两个窗口(上下各一个)   
;; (split-window-vertically)   
;; ;;改变emacs标题栏的标题   
;; (setq frame-title-format "%b@vj.org")   
;; ;;允许emacs和外部其他程序的粘贴   
;; (setq x-select-enable-clipboard t) 
;; 

;;(starter-kit-load "python")

(set-background-color "black")
(set-foreground-color "grey") ;; 使用白色前景
 
;; (set-face-foreground 'region "red")  ;; 区域前景颜色设为红色
;; (set-face-background 'region "blue") ;; 区域背景色设为蓝色

(setq inhibit-startup-message t) ;关闭启动画面

(setq column-number-mode t) ;显示列号
(global-linum-mode 1) ;左侧行号显示
(setq linum-format "%d ") ;设置行号显示格式
(windmove-default-keybindings 'meta) ;快速切换窗口
;;; 括号匹配时显示另一个括号而不是跳到另一个括号

(show-paren-mode t)
(setq show-paren-style 'parentheses)
(setq frame-title-format "%b %I") ;显示文件名和大小

(auto-image-file-mode t) ;让Emacs可以直接打开、显示图片
(fset 'yes-or-no-p 'y-or-n-p) ;以Y/N代表yes/no
(setq auto-save-default nil) ;不生成名为#filename#的临时文件
(setq x-select-enable-clipboard t) ;支持和外部程序的拷贝
(global-font-lock-mode t) ;打开语法高亮
(transient-mark-mode 1)   ;高亮显示区域选择


;; other settings
(setq frame-title-format "%n%F/%b")
(setq user-full-name "Cheng Xin")
(setq user-mail-address "jackal092927@gmail.com")

;; 自动补全括号
;; 填入大中小括号，双单引号的匹配
;; 详细格式可以参照C-h f skeleton-pair-alist  
(setq skeleton-pair-alist  
      '((?\" _ "\"" >)
	(?\' _ "\'" >)
	(?\( _ ")" >)
	(?\[ _ "]" >)
	(?\{ _ "}" >)))

(setq skeleton-pair t)

;; 绑定全局键值
;; 也可以绑定单独到某个mode，比如cc-mode (define-key cc-mode-map (kbd "(") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "(")  'skeleton-pair-insert-maybe)
(global-set-key (kbd "{")  'skeleton-pair-insert-maybe)
(global-set-key (kbd "\'") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "\"") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "[")  'skeleton-pair-insert-maybe)


(setq-default cursor-type 'bar)	; 设置光标为竖线 
(blink-cursor-mode -1) ; 光标闪烁

;; (add-to-list 'exec-path "/opt/local/bin") ;; for ggdb

;; 缓冲区
(setq kill-ring-max 200)

;; 默认工作路径
(setq default-dirctory "~/work/")

;; deal with the problem:
;; ''Quit: "empty or unsupported pasteboard type" 
(setq save-interprogram-paste-before-kill nil)

;; now
(defun now () 
  (interactive) 
  ( insert (current-time-string))) 

;; load theme
(load-theme 'tangotango t)


(provide 'init-my-setting)

