(load-library "iso-transl")
(add-to-list 'load-path "~/elisp")
(add-to-list 'load-path "~/.emacs.d/elpa")
(add-to-list 'load-path "~/.emacs.d/vendor/")

(setq package-list '(auctex auto-complete popup base16-theme color-theme-solarized color-theme css-comb erlang esqlite pcsv exec-path-from-shell expand-region flappymacs floobits highlight flycheck let-alist pkg-info epl dash flymake-jshint flymake-easy flymake-json flymake-easy flymake-sass flymake-easy fringe-helper git-gutter go-mode haml-mode handlebars-mode helm-css-scss helm helm-core async async helm-itunes helm helm-core async async highlight highlight-numbers parent-mode json-mode json-snatcher json-reformat json-reformat json-snatcher latex-preview-pane let-alist lua-mode magit magit-popup dash git-commit with-editor dash dash with-editor dash dash magit-popup dash markdown-mode+ markdown-mode matlab-mode mkdown markdown-mode move-text moz multi multiple-cursors neotree parent-mode pcsv php-mode pkg-info epl popup rainbow-delimiters rainbow-mode restclient s scss-mode smartparens dash sml-mode spotify sql-indent swift-mode web-mode with-editor dash yaml-mode yasnippet zenburn-theme))

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(load "~/elisp/autoloads" 'install)

(require 'package)

; activate all the packages (in particular autoloads)
(package-initialize)

; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))


(require 'git-gutter)
(require 'handlebars-mode)
;;(require 'yasnippet)



;; =======================================================
;; APPEARANCE
;; =======================================================

;; Disable startup screen
(setq inhibit-startup-message t)

;; Disable ring bell
(setq ring-bell-function 'ignore)

;; Theme
(load-theme 'zenburn t)

;; Show line numbers to the left of all buffers
(global-linum-mode 1)
(setq linum-format " %d ")

;; Auto refresh buffers when edits occur outside emacs
(global-auto-revert-mode 1)

;; Also auto refresh dired, but be quiet about it
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

;; Hide scroll and tool bar
(toggle-scroll-bar -1)
(tool-bar-mode -1)

;; Highlight numbers
(add-hook 'prog-mode-hook 'highlight-numbers-mode)

;; Font
(set-default-font "Source Code Pro 10")

;; Moving cursor down at bottom scrolls only a single line, not half page
;;(setq scroll-step 1)

;; Smooth Scroll
(setq mouse-wheel-scroll-amount '(1 ((shift) .1))) ;; one line at a time

;; Scroll one line when hitting bottom of window
(setq scroll-conservatively 10000)

;; Disable blinking in other windows on fuzzy matching
(setq ac-fuzzy-cursor-color nil)

;; Transparent background
(set-frame-parameter (selected-frame) 'alpha '(95 100))
(add-to-list 'default-frame-alist '(alpha 95 100))

;; Display the date and time on the mode line
(setq display-time-day-and-date t
                display-time-format "%a %b %d %R"
                display-time-interval 60
                display-time-default-load-average nil)
(display-time)

;; Display the battery on the mode line
(setq battery-mode-line-format " [%b%p%%|%t]")
(display-battery-mode t)

;; =======================================================
;; KEY BINDINGS
;; =======================================================

;; Set CMD as Meta
(setq mac-command-modifier 'meta
      mac-option-modifier nil
      mac-allow-anti-aliasing t
      mac-command-key-is-meta t)

;; Bind M-<arrow> to enlarge/shrink window
(global-set-key (kbd "M-<up>") 'shrink-window)
(global-set-key (kbd "M-<down>") 'enlarge-window)
(global-set-key (kbd "M-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "M-<right>") 'enlarge-window-horizontally)

;; Vim like window navigation using Shift-<arrow>
(windmove-default-keybindings)

;; Multiple cursors
(global-set-key (kbd "C->") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-<") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c <") 'mc/mark-all-like-this)

;; Move lines or a region up or down
(global-set-key (kbd "C-c <up>") 'move-text-up)
(global-set-key (kbd "C-c <down>") 'move-text-down)

;; Show Magit status
(global-set-key (kbd "C-x g") 'magit-status)

;; =======================================================
;; UTILITIES
;; =======================================================

;; sql editor (?)
(setq sql-mysql-program "/Applications/MAMP/Library/bin/mysql")

;; gofmt on save
(add-hook 'before-save-hook #'gofmt-before-save)

;; git-gutter+
(global-git-gutter-mode)
(git-gutter:linum-setup)

;; smartparens
(smartparens-global-mode t)

;; rainbow delimiters
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; yasnippet
;;(yas-global-mode 1)
;;(yas-initialize)
;;(setq yas/root-directory "~/.emacs.d/snippets")
;;(yas-load-directory yas/root-directory)

;; scss
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))

;; flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)
(defun my-flycheck-c-setup ()
  (setq flycheck-gcc-language-standard "c99"))
(add-hook 'c-mode-hook #'my-flycheck-c-setup)

;; auto-complete
;; dirty fix for having AC everywhere
(define-globalized-minor-mode real-global-auto-complete-mode
  auto-complete-mode (lambda ()
                       (if (not (minibufferp (current-buffer)))
			   (auto-complete-mode 1))
                       ))
(real-global-auto-complete-mode t)

;; php-mode
;;(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))

;; web-mode
(add-to-list 'auto-mode-alist '("\\.twig\\'" . web-mode))
(setq web-mode-code-indent-offset 4)
;;(setq web-mode-markup-indent-offset 4)
(setq-default indent-tabs-mode nil)

;; =======================================================
;; MISC
;; =======================================================

;; Cut current line with C-w
(defun slick-cut (beg end)
  (interactive
   (if mark-active
       (list (region-beginning) (region-end))
     (list (line-beginning-position) (line-beginning-position 2)))))

(advice-add 'kill-region :before #'slick-cut)

;; Copy current line with M-w
(defun slick-copy (beg end)
  (interactive
   (if mark-active
       (list (region-beginning) (region-end))
     (message "Copied line")
     (list (line-beginning-position) (line-beginning-position 2)))))

(advice-add 'kill-ring-save :before #'slick-copy)

;; Put backup files in ~/.emacs.d/backups
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

;; Put Auto-save files in ~/.emacs.d/auto-save
(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name
                (concat user-emacs-directory "auto-save")) t)))

;; Set up Emacs' exec-path and PATH environment variable to match that used by the user's shell.
(defun set-exec-path-from-shell-PATH ()
  (interactive)
  (let ((path-from-shell (replace-regexp-in-string "[ \t\n]*$" "" (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))
(set-exec-path-from-shell-PATH)

(put 'erase-buffer 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(markdown-css-path
   "~//Users/oskar/Library/Application\\ Support/Mou/CSS/GitHub2.css")
 '(php-mode-coding-style (quote psr2)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
