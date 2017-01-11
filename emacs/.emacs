(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (manoj-dark)))
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;------------------- END OF AUTO GENERATED CODE --------------------


;------------------- MODIFY GLOBAL SETTINGS --------------------
;;get rid of toolbar
(tool-bar-mode -1)
(menu-bar-mode -1) 

;;replace highlighted text
(delete-selection-mode 1)

;;no bell, flash instead
(setq visible-bell t)

;;copy out of emacs
(setq x-select-enable-clipboard t)

;;create directory to save in if it doesn't already exist
(add-hook 'before-save-hook
          (lambda ()
            (when buffer-file-name
              (let ((dir (file-name-directory buffer-file-name)))
                (when (and (not (file-exists-p dir))
                           (y-or-n-p (format "Directory %s does not exist. Create it?" dir)))
                  (make-directory dir t))))))

;;C-c l to show line-numbers
(global-set-key (kbd "C-c l") 'linum-mode)

;;flyspell mode in all text modes
(add-hook 'text-mode-hook '(lambda ()
			     (flyspell-mode)
			     (company-mode)))

;;C-c g to bring up magit status
(global-set-key (kbd "C-c g") 'magit-status)

;******************* IMPORT CONFIGS *******************
;------------------- EL-GET SETUP --------------------
(load-file "~/.emacs.d/.emacs.elget")
;------------------- PYTHON MODE CONFIG --------------------
(load-file "~/.emacs.d/.emacs.python")
;------------------- ORG MODE CONFIG --------------------
(load-file "~/.emacs.d/.emacs.orgmode")
;------------------- FLYSPELL MODE CONFIG --------------------
(load-file "~/.emacs.d/.emacs.flyspell")
;------------------- LATEX MODE CONFIG --------------------
(load-file "~/.emacs.d/.emacs.latex")

;------------------- C++ MODE CONFIG --------------------
; Create Header Guards with f12
;(global-set-key [f12] 
;		'(lambda () 
;		   (interactive)
;		   (if (buffer-file-name)
;		       (let*
;			   ((fName (upcase (file-name-nondirectory (file-name-sans-extension buffer-file-name))))
;			    (ifDef (concat "#ifndef " fName "_H" "\n#define " fName "_H" "\n"))
;			    (begin (point-marker))
;			    )
;			 (progn
;					; If less then 5 characters are in the buffer, insert the class definition
;			   (if (< (- (point-max) (point-min)) 5 )
;			       (progn
;				 (insert "\nclass " (capitalize fName) "{\npublic:\n\nprivate:\n\n};\n")
;				 (goto-char (point-min))
;				 (next-line-nomark 3)
;				 (setq begin (point-marker))
;				 )
;			     )
;			   
;					;Insert the Header Guard
;			   (goto-char (point-min))
;			   (insert ifDef)
;			   (goto-char (point-max))
;			   (insert "\n#endif" " //" fName "_H")
;			   (goto-char begin))
;			 )
;		     ;else
;		     (message (concat "Buffer " (buffer-name) " must have a filename"))
;		     )
;		   )
;		)
