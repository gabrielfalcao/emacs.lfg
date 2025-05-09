;; (use-package editorconfig
;;   :ensure t
;;   :config
;;   (editorconfig-mode 1))

(use-package company)
(use-package go-mode)
(use-package coffee-mode)
(use-package jinja2-mode)
(use-package jira-markup-mode)
(use-package js2-mode)
(use-package web-mode)
;;(use-package pyenv)
;;(use-package tide :hook ((web-mode . tide-setup)))
(use-package json-mode)
;;(use-package lua-mode)
(use-package markdown-mode)
(use-package nginx-mode)
(use-package php-mode)
(use-package protobuf-mode)
(use-package python-mode)
(use-package ruby-test-mode)
(use-package sass-mode)
(use-package terraform-mode)
(use-package toml-mode)
(use-package prettier-js)
;;(use-package eslintd-fix)
(use-package blacken)
(use-package flycheck-pycheckers)

(use-package yaml-mode)
(use-package cask)
(use-package elpy)
(use-package cask-package-toolset)
(use-package dockerfile-mode)
(use-package jsonnet-mode)
(use-package flycheck-color-mode-line)

(eval-after-load "flycheck"
  '(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))

(setq rust-format-on-save t)

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
;;(add-hook 'before-save-hook 'tide-format-before-save)
;;(add-hook 'typescript-mode-hook #'setup-tide-mode)


(add-to-list 'auto-mode-alist '("/bin/py/[^/.]*" . python-mode))
(add-to-list 'auto-mode-alist '("^---$" . yaml-mode))
(add-to-list 'auto-mode-alist '("/bin/[^/.]*" . shell-script-mode))
(add-to-list 'auto-mode-alist '("/bin/sh/[^/.]*" . shell-script-mode))
(add-to-list 'auto-mode-alist '("/.flkwnlib/" . python-mode))
(add-to-list 'auto-mode-alist '("/bashrc.d/" . shell-script-mode))
(add-to-list 'auto-mode-alist '("Dockerfile.*" . dockefile-mode))
(add-to-list 'auto-mode-alist '("\\.sh$" . shell-script-mode))
(add-to-list 'auto-mode-alist '("\\.shell$" . shell-script-mode))
(add-to-list 'auto-mode-alist '("\\.bash$" . shell-script-mode))
(add-to-list 'auto-mode-alist '("\\.bashrc$" . shell-script-mode))
(add-to-list 'auto-mode-alist '("\\.j2$" . jinja2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . json-mode))
(add-to-list 'auto-mode-alist '("\\.json-*$" . json-mode))
(add-to-list 'auto-mode-alist '("\\.jsonnet$" . jsonnet-mode))
(add-to-list 'auto-mode-alist '("\\.libsonnet$" . jsonnet-mode))
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.sls$" . yaml-mode)) ; salt stack

;;; Map file extensions to modes
(add-to-list 'auto-mode-alist '("Pipfile" . toml-mode))           ;; pipenv
(add-to-list 'auto-mode-alist '("Pipfile.lock" . toml-mode))      ;; pipenv
(add-to-list 'auto-mode-alist '("Vagrantfile$" . ruby-mode))      ;; Vagrant
(add-to-list 'auto-mode-alist '(".urls" . ruby-mode))      ;; Vagrant
(add-to-list 'auto-mode-alist '("Makefile[.].*" . makefile-mode)) ;; Makefile-alikes
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))            ;; PHP
(add-to-list 'auto-mode-alist '("\\.js$" . web-mode))             ;; Javascript and ES6
(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))            ;; Javascript and ES6
(add-to-list 'auto-mode-alist '("\\.tsx?$" . typescript-mode))     ;; Javascript and ES6
(add-to-list 'auto-mode-alist '("\\.proto$" . protobuf-mode))     ;; Protobuf (GRPC)
(add-hook 'js-mode-hook 'prettier-js-mode)
(add-hook 'web-mode-hook 'prettier-js-mode)
(add-hook 'rjsx-mode-hook 'prettier-js-mode)
(add-hook 'typescript-mode-hook 'prettier-js-mode)
(eval-after-load 'web-mode-mode
  '(add-hook 'web-mode-hook (lambda () (add-hook 'after-save-hook 'eslint-fix nil t))))



(add-to-list 'auto-mode-alist '("\\.tf$" . terraform-mode))       ;; Terraform

(add-to-list 'auto-mode-alist '("nginx.conf$" . nginx-mode)) ;; nginx
(add-to-list 'auto-mode-alist '("\\.plist$" . xml-mode))     ;; Mac OS X .plist files
(add-to-list 'auto-mode-alist '("\\.erl$" . erlang-mode))    ;; erlang
(add-to-list 'auto-mode-alist '("/mutt" . mail-mode))        ;; Files created under a /mutt dir
(add-hook 'html-mode-hook (lambda() (setq sgml-basic-offset 4)))  ;; html mode

;;; remove all sorts of trailing spaces

;;; (require 'pyimpsort)
;;; (eval-after-load 'python
;;;   '(define-key python-mode-map "\C-c\C-u" #'pyimpsort-buffer))

(require 'whitespace)
(setq whitespace-style 'empty)
(setq web-mode-content-types-alist
      '(("json" . ".*[.]json$'")
        ("jsx"  . ".*[.]js[x]?")))
(setq-default web-mode-comment-formats
              '(("java"       . "/*")
                ("javascript" . "//")
                ("php"        . "/*")))
;;; css config
(setq cssm-indent-function #'cssm-c-style-indenter)
(setq cssm-indent-level 4)

                                        ; Set CSS colors with themselves
(require 'jira-markup-mode)
(add-to-list 'auto-mode-alist '("\\.jira$" . jira-markup-mode))

(require 'sass-mode)
(add-to-list 'auto-mode-alist '("\\.sass$" . sass-mode))
(add-to-list 'auto-mode-alist '("\\.scss$" . sass-mode))
(setq sass-indent-offset 2)

;;; less mode
(require 'less-css-mode)
(add-to-list 'auto-mode-alist '("\\.less$" . less-css-mode))
(setq less-compile-at-save nil)

;;; Web mode

(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(add-hook 'js2-mode-hook #'setup-tide-mode)
;; configure javascript-tide checker to run after your default javascript checker
;; (flycheck-add-next-checker 'javascript-eslint 'javascript-tide 'append)
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "jsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))))
;; configure jsx-tide checker to run after your default jsx checker
(flycheck-add-mode 'javascript-eslint 'web-mode)
;; (flycheck-add-next-checker 'javascript-eslint 'jsx-tide 'append)

;; <http://codewinds.com/blog/2015-04-02-emacs-flycheck-eslint-jsx.html>
;; turn on flychecking globally
(add-hook 'after-init-hook #'global-flycheck-mode)

;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(javascript-jshint)))

;; customize flycheck temp file prefix
(setq-default flycheck-temp-prefix ".flycheck")

;; disable json-jsonlist checking for json files
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(json-jsonlist)))

;; https://github.com/purcell/exec-path-from-shell
;; only need exec-path-from-shell on OSX
;; this hopefully sets up path and other vars better
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))
;; </http://codewinds.com/blog/2015-04-02-emacs-flycheck-eslint-jsx.html>

;;; Markdown mode
(require 'markdown-mode)
(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-hook 'markdown-mode-hook '(lambda() (flyspell-mode)))

;;; Vala mode
(autoload 'vala-mode "vala-mode" "Major mode for editing Vala code." t)
(add-to-list 'auto-mode-alist '("\\.vala$" . vala-mode))
(add-to-list 'auto-mode-alist '("\\.vapi$" . vala-mode))
(add-to-list 'file-coding-system-alist '("\\.vala$" . utf-8))
(add-to-list 'file-coding-system-alist '("\\.vapi$" . utf-8))

;;; CoffeScript mode
(require 'coffee-mode)
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))
(defun coffee-custom () "coffee-mode-hook"
       (set (make-local-variable 'tab-width) 2))
(add-hook 'coffee-mode-hook '(lambda() (coffee-custom)))

;;; Earl gray mode
;;; (add-to-list 'load-path "~/.emacs.d/elisp/earl-grey-mode")
;;; (require 'earl-mode)
;;; (add-to-list 'auto-mode-alist '("\\.eg$" . earl-mode))

;; ;;; Auto complete
;; (require 'auto-complete)
;; (require 'auto-complete-config)
;; (global-auto-complete-mode t)
;; (setq ac-dwim 2)
;; (ac-config-default)
;; (define-key ac-complete-mode-map "\C-n" 'ac-next)
;; (define-key ac-complete-mode-map "\C-p" 'ac-previous)

;;; Loading YAS personal snippets

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flymake-error ((t (:underline "tomato"))))
 '(flymake-warning ((t (:underline (:color "firebrick" :style wave))))))
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(defalias 'yes-or-no-p 'y-or-n-p)

(custom-set-variables
 '(flycheck-python-flake8-executable "python3")
 '(flycheck-python-pycompile-executable "python3")
 ;;'(flycheck-python-pylint-executable "python3")
 )

;;; ensure that this has priority over `auto-mode-alist`
(add-to-list 'interpreter-mode-alist '("python" . python-mode))
(add-to-list 'interpreter-mode-alist '("python3" . python-mode))
(add-to-list 'interpreter-mode-alist '("osascript" . apples-mode))
(add-to-list 'interpreter-mode-alist '("bash" . shell-script-mode))
(add-to-list 'interpreter-mode-alist '("markdown" . shell-script-mode))

;;https://www.masteringemacs.org/article/removing-blank-lines-buffer
;;; _     _  _____   _____  _     _ _______
;;; |_____| |     | |     | |____/  |______
;;; |     | |_____| |_____| |    \_ ______|

;;; before safe
;;; ~~~~~~~~~~~
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;; python-mode

;; (require 'flycheck-virtualenv)
;;(require 'blacken)
;; (require 'pipenv)
;;(require 'py-isort)

;;(add-hook 'python-mode-hook 'pipenv-mode)
;; (defun python-find-module (name)
;;   "Open the file that declares the received python module"
;;   (interactive "MPython module to open: ")
;;   (find-file
;;    (let ((command (concat "python -c 'import sys, " name " as m; sys.stdout.write(m.__file__)'")))
;;      (replace-regexp-in-string ".py.$" ".py" (shell-command-to-string command)))))



;; (defun pipenv-switch-flake8-path ()
;;   "When a Pipenv project is found, activate the virtual environment, \
;; and open a Pipenv shell and a Python interpreter."
;;   ;; '(setq flycheck-python-pyflakes-executable )
;;   ;; Always clean up, in case we were in a Python project previously.
;;   (pipenv-deactivate)
;;   ;; Only activate if we can verify this is a Pipenv project.
;;   (when (pipenv-project?)
;;     (pipenv-activate)
;;     (pipenv-shell)
;;     ;; Tell blacken that the executable changed
;;     '(setq blacken-executable (concat (file-name-as-directory python-shell-virtualenv-root) "/bin/blacken"))
;;     ;; Tell flycheck that the flake8 executable changed
;;     (flycheck-set-checker-executable (quote python-flake8)
;;                                      (concat (file-name-as-directory python-shell-virtualenv-root) "/bin/flake8"))
;;     (message (concat (file-name-as-directory python-shell-virtualenv-root) "/bin/flake8"))

;;     ))

;; (setq pipenv-projectile-after-switch-function #'pipenv-switch-flake8-path)
;; (setq-default pipenv-projectile-after-switch-function #'pipenv-switch-flake8-path)


;; (defun set-flychecker-executables ()
;;   "Configure virtualenv for flake8 and lint."

;;     (setq blacken-executable (concat (file-name-as-directory python-shell-virtualenv-root) "/bin/blacken"))
;;     (flycheck-set-checker-executable (quote python-flake8)
;;                                      ;; (concat (file-name-as-directory python-shell-virtualenv-root) "/bin/flake8")))
;;                                      "/usr/local/bin/flake8"))


;; (add-hook 'flycheck-before-syntax-check-hook
;;           #'set-flychecker-executables 'local)

;;(setq blacken-executable  "/Users/gabrielfalcao/.pyenv/shims/black")
;; (add-hook 'python-mode-hook 'yas-minor-mode-on)
;; (add-hook 'python-mode-hook #'yas-minor-mode)
;;(add-hook 'python-mode-hook 'blacken-mode)
;;(setq py-isort-options '("--fass" "--star-first" "--honor-noqa" "--profile" "black" ))
;;(add-hook 'before-save-hook 'py-isort-before-save)


(flycheck-define-checker sh-shellcheck
  "A shell script syntax and style checker using Shellcheck.

See URL `https://github.com/koalaman/shellcheck/'."
  :command ("shellcheck" "-x" "-f" "checkstyle"
            "-s" (eval (symbol-name sh-shell))
            source)
  :modes sh-mode
  :error-parser flycheck-parse-checkstyle)

(add-hook 'sh-mode-hook 'flycheck-mode)
(add-hook 'shell-script-mode-hook 'flycheck-mode)


;;; (package-refresh-contents)

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


(use-package golden-ratio
  :ensure t
  :config
  (golden-ratio-mode 0))


(use-package expand-region
  :ensure t
  :config
  (global-set-key (kbd "C-=") 'er/expand-region)
  )

;;; (use-package golden-ratio
;;;   :ensure t
;;;   :config
;;;   (golden-ratio-mode 1))

(use-package restclient
  :ensure t)

;;; ; buffer registry mgmt
;;; (use-package perspective
;;;   :ensure t
;;;   :config
;;;   (persp-mode)) ;; TODO came up with some better keybindings


(use-package rjsx-mode
  :ensure t
  :config
  ;; (add-to-list 'auto-mode-alist '("\\.js$" . rjsx-mode))
  ;; (define-key js2-mode-map (kbd "M-.") nil)
  (setq js2-mode-show-parse-errors nil)
  (setq js2-mode-show-strict-warnings nil)
  (add-hook 'js2-mode-hook (lambda ()
                             (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)
                             (superword-mode 1)
                             )))

;; (defun sort-lines-nocase ()
;;   (interactive)
;;   (let ((sort-fold-case t))
;;     (call-interactively 'sort-lines)))


;; (defun isortlines
;;     (interactive)
;;   (let ((sort-fold-case t))
;;     (call-interactively 'sort-lines)))

;; (setq gofmt-command "goimports")
;; ;;; (require 'go-mode-autoloads)
;; (add-hook 'before-save-hook 'gofmt-before-save)

;; (message "reminder: C-c t brings a file-tree")
;; (add-hook 'after-init-hook 'global-company-mode)

;; (load-file "~/.emacs.d/flow-for-emacs/flow.el")

;; ;(add-hook 'after-init-hook #'global-flycheck-mode)
;; ;; http://www.howardism.org/Technical/Emacs/capturing-content.html


;; ;; I have all the packages installed in subdirectories of ~/elisp
;; (dolist (lib '("font-utils" "unicode-fonts" "ucs-utils" "list-utils"))
;;   (add-to-list 'load-path
;; 	       (expand-file-name lib (concat (getenv "HOME") "/elisp"))))
;; ;; keep only the Emoticons block, change only the default fontset
;; (require 'unicode-fonts)
;; (setq unicode-fonts-block-font-mapping
;;       '(("Emoticons"
;; 	 ("Apple Color Emoji" "Symbola" "Quivira")))
;;       unicode-fonts-fontset-names '("fontset-default"))




;;(setq python-shell-interpreter "/usr/local/bin/python3")
(cask-initialize)


(setq-default flycheck-disabled-checkers '(go))


(flycheck-define-checker
    python-mypy ""
    :command ("mypy"
              "--ignore-missing-imports" "--fast-parser"
              "--python-version" "3.6"
              source-original)
    :error-patterns
    ((error line-start (file-name) ":" line ": error:" (message) line-end))
    :modes python-mode)

;; (add-to-list 'flycheck-checkers 'python-mypy t)
;; (flycheck-add-next-checker 'python-pylint 'python-mypy t)
