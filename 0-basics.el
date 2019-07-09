;; disable ugly scrollbar, toolbar and menu
(scroll-bar-mode 0)
(menu-bar-mode 0)
(tool-bar-mode 0)

;; enable commands that might be disabled by default for emacs rookies.
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
;; enable server mode
(server-mode 1)

;; Keybindings

(global-set-key [(ctrl c) (c)] 'comment-region)
(global-set-key [(ctrl c) (d)] 'uncomment-region)


(global-set-key (kbd "C-c u") 'uncomment-region)
(global-set-key (kbd "C-c c") 'comment-region)
(global-set-key (kbd "C-#") 'comment-region)

(global-set-key [(ctrl <)] 'decrease-left-margin)
(global-set-key [(ctrl >)] 'increase-left-margin)

;;; moving from one frame to another
(global-set-key [(C-tab)] 'other-window)
(global-set-key [(shift C-tab)] '(lambda () (interactive) (other-window -1)))

;;; scrolling without changing the cursor
(global-set-key [(meta n)] '(lambda () (interactive) (scroll-up 1)))
(global-set-key [(meta p)] '(lambda () (interactive) (scroll-down 1)))

;;; scrolling other window
(global-set-key [(meta j)] '(lambda () (interactive) (scroll-other-window 1)))
(global-set-key [(meta k)] '(lambda () (interactive) (scroll-other-window -1)))

;;; regexp search
(global-set-key [(ctrl s)] 'isearch-forward-regexp)
(global-set-key [(ctrl shift s)] 'isearch-backward-regexp)

;;; resize windows
(global-set-key (kbd "C-}") 'shrink-window-horizontally)
(global-set-key (kbd "C-{") 'enlarge-window-horizontally)
(global-set-key (kbd "C-M-}") 'shrink-window)
(global-set-key (kbd "C-M-{") 'enlarge-window)


;;; OSX Keybindings

(when (eq system-type 'darwin)
  (setq mac-option-modifier 'meta)
  (setq mac-command-modifier 'meta)
  (global-set-key [kp-delete] 'delete-char)
  (menu-bar-mode 1))

;; Encoding UTF-8 Everywhere

(prefer-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)
(setq current-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)


;;; UI Configuration
(column-number-mode)                    ;; Basic config for columns

(setq ring-bell-function 'ignore)       ;; No freaking bell
(setq inhibit-splash-screen t)          ;; No splash screen
(setq inhibit-startup-screen t)

(global-font-lock-mode 1)               ;; Always do syntax highlighting
(transient-mark-mode 1)                 ;; highlight mark region

(set-frame-font "Monaco-14")            ;; Font face/size
(set-face-attribute 'default t :font "Monaco-14")
;; (set-frame-font "Anonymous Pro-15")            ;; Font face/size
;; (set-face-attribute 'default t :font "Anonymous Pro-15")

(global-prettify-symbols-mode 1)        ;; See prettify-symbols-alist

(require 'linum)                        ;; show line numbers
(global-linum-mode 1)
(setq linum-format "%4d")

(setq-default truncate-lines t)        ;; Do not wrap lines

;;; Also highlight parenthesis
(setq show-paren-delay 0 show-paren-style 'parenthesis)
(show-paren-mode 1)

;;; Editing options
(setq-default cursor-type 'bar)
(setq-default indent-tabs-mode nil)    ;; spaces instead of tabs
(setq scroll-conservatively 10000)     ;; scroll smoothly
(setq show-trailing-whitespace t)      ;; Whitespaces
(setq x-select-enable-clipboard t)     ;; Clipboard shared with the DE
(setq default-directory "~/")        ;; There's no place like home



(defun ask-user-about-supersession-threat (filename)
  ;; (revert-buffer t t)
  (message "This buffer was refreshed due to external changes"))


;;https://www.masteringemacs.org/article/removing-blank-lines-buffer
;;; _     _  _____   _____  _     _ _______
;;; |_____| |     | |     | |____/  |______
;;; |     | |_____| |_____| |    \_ ______|

;;; before safe
;;; ~~~~~~~~~~~
(add-hook 'before-save-hook 'delete-trailing-whitespace)


(defun uniquify-all-lines-region (start end)
  "Find duplicate lines in region START to END keeping first occurrence."
  (interactive "*r")
  (save-excursion
    (let ((end (copy-marker end)))
      (while
          (progn
            (goto-char start)
            (re-search-forward "^\\(.*\\)\n\\(\\(.*\n\\)*\\)\\1\n" end t))
        (replace-match "\\1\n\\2")))))

(defun uniquify-all-lines-buffer ()
  "Delete duplicate lines in buffer and keep first occurrence."
  (interactive "*")
  (uniquify-all-lines-region (point-min) (point-max)))
