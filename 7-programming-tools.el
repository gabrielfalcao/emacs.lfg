(setq save-abbrevs 'silently)

;;(use-package flycheck-mypy)
(use-package react-snippets)

(set-variable 'flycheck-python-mypy-args '("--ignore-missing-imports" "--check-untyped-defs"))
;; (flycheck-add-next-checker 'python-flake8 'python-mypy)

(use-package yasnippet)
;; (use-package yasnippet-snippets)
;; (use-package yasnippet-classic-snippets)

(setq yas-snippet-dirs
      '(
        "~/.emacs.d/snippets"
        ))

(yas-global-mode 1)
(yas-minor-mode 1)
(yas-define-snippets 'python-mode
                     '(("xmpp" "# <xmpp - stateless and concurrency-agnostic XMPP library for python>\n#\n# (C) Copyright 2016 Gabriel Falcao <gabriel@nacaolivre.org>\n#\n# This program is free software: you can redistribute it and/or modify\n# it under the terms of the GNU Lesser General Public License as\n# published by the Free Software Foundation, either version 3 of the\n# License, or (at your option) any later version.\n#\n# This program is distributed in the hope that it will be useful,\n# but WITHOUT ANY WARRANTY; without even the implied warranty of\n# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\n# GNU General Public License for more details.\n#\n# You should have received a copy of the GNU General Public License\n# along with this program.  If not, see <http://www.gnu.org/licenses/>.\n" "xmpp" nil nil nil "/Users/gabrielfalcao/.emacs.d/snippets/python-mode/xmpp" "direct-keybinding" nil)
                       ("pdb" "import ipdb;ipdb.set_trace()  # fmt: skip" "pdb" nil nil nil "/Users/gabrielfalcao/.emacs.d/snippets/python-mode/pdb" "direct-keybinding" nil)
                       ("noqa" "# -*- coding: utf-8 -*-\n# flake8: noqa\n" "noqa" nil nil nil "/Users/gabrielfalcao/.emacs.d/snippets/python-mode/noqa" "direct-keybinding" nil)
                       ("from" "from $1 import $2" "pdb" nil nil nil "/Users/gabrielfalcao/.emacs.d/snippets/python-mode/from" nil nil)
                       ("coding" "# -*- coding: utf-8 -*-\n" "coding" nil nil nil "/Users/gabrielfalcao/.emacs.d/snippets/python-mode/coding" "direct-keybinding" nil)))


(global-set-key [(shift tab)] 'yas-expand)

(setq python-indent-offset 4)

(use-package company-tabnine :ensure t)
(add-to-list 'company-backends #'company-tabnine)
;; Trigger completion immediately.
(setq company-idle-delay 0)

;; Number the candidates (use M-1, M-2 etc to select completions).
(setq company-show-numbers t)
(add-hook 'after-init-hook 'global-company-mode)
