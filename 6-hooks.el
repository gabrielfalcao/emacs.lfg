;;https://www.masteringemacs.org/article/removing-blank-lines-buffer
;;; _     _  _____   _____  _     _ _______
;;; |_____| |     | |     | |____/  |______
;;; |     | |_____| |_____| |    \_ ______|

;;; before safe
;;; ~~~~~~~~~~~
(add-hook 'before-save-hook 'delete-trailing-whitespace)
