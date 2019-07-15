
;; (server-mode 1)
;; (scroll-bar-mode 0)
;; (menu-bar-mode 0)
;; (tool-bar-mode 0)

;; ;;; ---- key bindings ---
;; ;;; https://github.com/Lindydancer/el2markdown
;; ;;; comments
;; (global-set-key [(ctrl c) (c)] 'comment-region)
;; (global-set-key [(ctrl c) (d)] 'uncomment-region)


;; (global-set-key (kbd "C-c u") 'uncomment-region)
;; (global-set-key (kbd "C-c c") 'comment-region)
;; (global-set-key (kbd "C-#") 'comment-region)

;; (global-set-key [(ctrl <)] 'decrease-left-margin)
;; (global-set-key [(ctrl >)] 'increase-left-margin)

;; ;;; moving from one frame to another
;; (global-set-key [(C-tab)] 'other-window)
;; (global-set-key [(shift C-tab)] '(lambda () (interactive) (other-window -1)))

;; ;;; scrolling without changing the cursor
;; (global-set-key [(meta n)] '(lambda () (interactive) (scroll-up 1)))
;; (global-set-key [(meta p)] '(lambda () (interactive) (scroll-down 1)))

;; ;;; scrolling other window
;; (global-set-key [(meta j)] '(lambda () (interactive) (scroll-other-window 1)))
;; (global-set-key [(meta k)] '(lambda () (interactive) (scroll-other-window -1)))

;; ;;; regexp search
;; (global-set-key [(ctrl s)] 'isearch-forward-regexp)
;; (global-set-key [(ctrl shift s)] 'isearch-backward-regexp)

;; ;;; resize windows
;; (global-set-key (kbd "C-}") 'shrink-window-horizontally)
;; (global-set-key (kbd "C-{") 'enlarge-window-horizontally)
;; (global-set-key (kbd "C-M-}") 'shrink-window)
;; (global-set-key (kbd "C-M-{") 'enlarge-window)

;; (require 'package) ;; You might already have this line
;; (package-initialize) ;; You might already have this line

;; ;;(ignore-errors (package-refresh-contents))

;; (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
;; (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
;; ;;(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/")) ;; expired TLS Cert
;; (add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
;; ;;(add-to-list 'package-archives '("elpy" . "https://jorgenschaefer.github.io/packages/"))


;; ;;; Mac specific stuff
;; (when (eq system-type 'darwin)
;;   (setq mac-option-modifier 'meta)
;;   (setq mac-command-modifier 'meta)

;;   ;; Loads environment variables from the shell
;;   ;; (require 'exec-path-from-shell)
;;   ;; (when (memq window-system '(mac ns))
;;   ;;   (exec-path-from-shell-initialize))
;;   ;; sets fn-delete to be right-delete
;;   (global-set-key [kp-delete] 'delete-char)
;;   (menu-bar-mode 1))


;; (setq eval-expression-debug-on-error t)
;; (setq dired-listing-switches "-Dlatrh  --group-directories-first")


;; ;;; utf-8 for good (is there any other encoding related var I could set?)
;; (prefer-coding-system 'utf-8)
;; (setq locale-coding-system 'utf-8)
;; (setq current-language-environment "UTF-8")
;; (set-default-coding-systems 'utf-8)
;; (set-terminal-coding-system 'utf-8)
;; (set-keyboard-coding-system 'utf-8)
;; (set-selection-coding-system 'utf-8)

;; (require 'uniquify)
;; (setq uniquify-buffer-name-style 'reverse)

;; ;;; UI Configuration
;; (column-number-mode)                    ;; Basic config for columns

;; (setq ring-bell-function 'ignore)       ;; No freaking bell
;; (setq inhibit-splash-screen t)          ;; No splash screen
;; (setq inhibit-startup-screen t)

;; (global-font-lock-mode 1)               ;; Always do syntax highlighting
;; (transient-mark-mode 1)                 ;; highlight mark region

;; (set-frame-font "Monaco-14")            ;; Font face/size
;; (set-face-attribute 'default t :font "Monaco-14")
;; ;; (set-frame-font "Anonymous Pro-15")            ;; Font face/size
;; ;; (set-face-attribute 'default t :font "Anonymous Pro-15")

;; (global-prettify-symbols-mode 1)        ;; See prettify-symbols-alist

;; (require 'linum)                        ;; show line numbers
;; (global-linum-mode 1)
;; (setq linum-format "%4d")

;; (setq-default truncate-lines t)        ;; Do not wrap lines

;; ;;; Also highlight parenthesis
;; (setq show-paren-delay 0 show-paren-style 'parenthesis)
;; (show-paren-mode 1)

;; ;;; Editing options
;; (setq-default indent-tabs-mode nil)    ;; spaces instead of tabs
;; (setq scroll-conservatively 10000)     ;; scroll smoothly
;; (setq show-trailing-whitespace t)      ;; Whitespaces
;; (setq x-select-enable-clipboard t)     ;; Clipboard shared with the DE
;; ;;; ;; backups
;; ;;; (defun make-backup-file-name (FILE)
;; ;;;   (let ((dirname (concat "~/StrongSync/Backups/emacs-saves/"
;; ;;;                          (format-time-string "%y/%m/%d/"))))
;; ;;;     (if (not (file-exists-p dirname))
;; ;;;         (make-directory dirname t))
;; ;;;     (concat dirname (file-name-nondirectory FILE))))


;; ;;; ;; ;; store all backup and autosave files in the tmp dir
;; ;;; (setq backup-directory-alist
;; ;;;       `((".*" . ,make-backup-file-name)))

;; ;;; (setq auto-save-file-name-transforms
;; ;;;       `((".*" ,make-backup-file-name t)))


;; (setq
;;  backup-by-copying t      ; don't clobber symlinks
;;  backup-directory-alist
;;  '(("." . "~/.emacs.backups"))    ; don't litter my fs tree
;;  delete-old-versions t
;;  kept-new-versions 10
;;  kept-old-versions 10
;;  version-control t)                ; use versioned backups

;; ;;; Other small configurations
;; (setq gdb-many-windows 1)            ;; gdb
;; (setq default-directory "~/")        ;; There's no place like home


;; (defun ask-user-about-supersession-threat (filename)
;;   ;; (revert-buffer t t)
;;   (message "This buffer was refreshed due to external changes"))


;; ;;https://www.masteringemacs.org/article/removing-blank-lines-buffer
;; ;;; _     _  _____   _____  _     _ _______
;; ;;; |_____| |     | |     | |____/  |______
;; ;;; |     | |_____| |_____| |    \_ ______|

;; ;;; before safe
;; ;;; ~~~~~~~~~~~
;; (add-hook 'before-save-hook 'delete-trailing-whitespace)

;; ;;; python-mode


;; ;; (flycheck-define-checker sh-shellcheck
;; ;;   "A shell script syntax and style checker using Shellcheck.

;; ;; See URL `https://github.com/koalaman/shellcheck/'."
;; ;;   :command ("shellcheck" "-x" "-f" "checkstyle"
;; ;;             "-s" (eval (symbol-name sh-shell))
;; ;;             source)
;; ;;   :modes sh-mode
;; ;;   :error-parser flycheck-parse-checkstyle)

;; ;; (add-hook 'sh-mode-hook 'flycheck-mode)
;; ;; (add-hook 'shell-script-mode-hook 'flycheck-mode)



;; (defun uniquify-all-lines-region (start end)
;;   "Find duplicate lines in region START to END keeping first occurrence."
;;   (interactive "*r")
;;   (save-excursion
;;     (let ((end (copy-marker end)))
;;       (while
;;           (progn
;;             (goto-char start)
;;             (re-search-forward "^\\(.*\\)\n\\(\\(.*\n\\)*\\)\\1\n" end t))
;;         (replace-match "\\1\n\\2")))))

;; (defun uniquify-all-lines-buffer ()
;;   "Delete duplicate lines in buffer and keep first occurrence."
;;   (interactive "*")
;;   (uniquify-all-lines-region (point-min) (point-max)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (yasnippet-snippets yaml-mode web-mode use-package unicode-emoticons toml-mode terraform-mode sublime-themes sass-mode ruby-test-mode rjsx-mode restclient react-snippets python-mode protobuf-mode prettier-js php-mode nginx-mode markdown-mode lua-mode json-mode jira-markup-mode jinja2-mode golden-ratio go-mode flycheck-pycheckers flycheck-mypy expand-region exec-path-from-shell coffee-mode cask-package-toolset cask blacken))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flymake-error ((t (:underline "tomato"))))
 '(flymake-warning ((t (:underline (:color "firebrick" :style wave))))))
