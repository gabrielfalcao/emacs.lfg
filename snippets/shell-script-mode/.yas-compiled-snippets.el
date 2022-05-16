;;; Compiled snippets and support files for `shell-script-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'shell-script-mode
                     '(("while" "while [[ ${1:condition} ]]; do\n  ${0:statements}\ndone\n" "while ... done" nil nil nil "/Users/gabrielfalcao/.emacs.d/snippets/shell-script-mode/while.yasnippet" nil nil)
                       ("until" "until [[ ${1:condition} ]]; do\n  ${0:statements}\ndone\n" "until ... done" nil nil nil "/Users/gabrielfalcao/.emacs.d/snippets/shell-script-mode/until.yasnippet" nil nil)
                       ("ift" "if [[ ${1:condition} ]]; then\n  ${0:statements}\nfi\n" "if [[ test ]] ... fi" nil nil nil "/Users/gabrielfalcao/.emacs.d/snippets/shell-script-mode/ift.yasnippet" nil nil)
                       ("if" "if [ ${1:condition} ]; then\n  ${0:statements}\nfi\n" "if ... fi" nil nil nil "/Users/gabrielfalcao/.emacs.d/snippets/shell-script-mode/if.yasnippet" nil nil)
                       ("here" "<<${1:TOKEN}\n$0\n${1:TOKEN}\n" "Here Document" nil nil nil "/Users/gabrielfalcao/.emacs.d/snippets/shell-script-mode/here.yasnippet" nil nil)
                       ("fun" "function ${1:function_name}()\n{\n  $0\n}" "function name { ... }" nil nil nil "/Users/gabrielfalcao/.emacs.d/snippets/shell-script-mode/fun.yasnippet" nil nil)
                       ("forin" "for ${1:i} in ${2:words}; do\n  ${0:statements}\ndone\n" "for ... in ... done" nil nil nil "/Users/gabrielfalcao/.emacs.d/snippets/shell-script-mode/forin.yasnippet" nil nil)
                       ("for" "for ${1:condition}; do\n  ${0:statements}\ndone\n" "for ... done" nil nil nil "/Users/gabrielfalcao/.emacs.d/snippets/shell-script-mode/for.yasnippet" nil nil)
                       ("elif" "elif [[ ${1:condition} ]]; then\n  ${0:statements}\n" "elif ..." nil nil nil "/Users/gabrielfalcao/.emacs.d/snippets/shell-script-mode/elif.yasnippet" nil nil)
                       ("coding" "#!/bin/bash\n# -*- coding: utf-8 -*-\n" "coding" nil nil nil "/Users/gabrielfalcao/.emacs.d/snippets/shell-script-mode/coding" nil nil)
                       ("case" "case ${1:word} in\n  ${2:pattern} )\n    $0;;\nesac\n" "case ... esac" nil nil nil "/Users/gabrielfalcao/.emacs.d/snippets/shell-script-mode/case.yasnippet" nil nil)
                       ("bash" "#!/bin/bash\n# -*- coding: utf-8 -*-\n" "bash" nil nil nil "/Users/gabrielfalcao/.emacs.d/snippets/shell-script-mode/bash" nil nil)
                       ("!env" "#!/usr/bin/env `(file-name-nondirectory (getenv \"SHELL\"))`\n" "#!/usr/bin/env $SHELL" nil nil nil "/Users/gabrielfalcao/.emacs.d/snippets/shell-script-mode/!env.yasnippet" nil nil)))


;;; Do not edit! File generated at Thu May 27 20:21:19 2021
