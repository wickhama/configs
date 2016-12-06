(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (manoj-dark)))
 '(inhibit-startup-screen t)
 '(org-agenda-files (quote ("~/Documents/notes/notes.org" "~/Documents/notes/school/third_year"))))
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
			     (flyspell-mode)))

;;C-c g to bring up magit status
(global-set-key (kbd "C-c g") 'magit-status)

;;C-c a brings up org agenda
(global-set-key (kbd "C-c a") 'org-agenda)


;------------------- EL-GET SETUP --------------------
;add el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)


;list all packages you want installed  
(setq my-el-get-packages  
      (append  
       '(magit flycheck jedi company-mode flyspell company-math)))  

;make sure all of the required packages are installed
(el-get 'sync my-el-get-packages)  


;------------------- PYTHON MODE CONFIG --------------------
;show line numbers in python files and set flycheck-mode
(add-hook 'python-mode-hook '(lambda ()
			       (linum-mode)
			       (flycheck-mode)))


;------------------- ORG MODE CONFIG --------------------
;company mode + flyspell in org mode
(add-hook 'org-mode-hook '(lambda ()
			     (flyspell-mode)
			     (company-mode)
			     (local-set-key (kbd "C-c m") 'company-math-symbols-unicode)))


;------------------- FLYSPELL MODE CONFIG --------------------
;;flyspell correct word on f12
(add-hook 'flyspell-mode-hook '(lambda ()
				 (local-set-key (kbd "<f12>") 'ispell-word)))

