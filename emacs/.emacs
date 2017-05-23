;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

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

(setq backup-directory-alist
                `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
          `((".*" ,temporary-file-directory t))) 


(defun git-commit-push (msg)
  "Commits the changes in the directory with the message and then pushes"
  (interactive "Mcommit message: ")
  (shell-command (concat "git commit . -m \"" msg "\""))
  (shell-command "git push"))

(defun git-pull ()
  "Pulls from git, merges will need to be handled manually"
  (interactive)
  (shell-command "git pull"))

;git push
(global-set-key (kbd "C-c C-g p") 'git-commit-push)
;git fetch
(global-set-key (kbd "C-c C-g f") 'git-pull)

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

(setq inferior-lisp-program "sbcl")

(evil-mode)
(defalias 'evil-insert-state 'evil-emacs-state)
(define-key evil-emacs-state-map [escape] `evil-normal-state)
(fset 'evil-visual-update-x-selection 'ignore)

(use-package darcula-theme
  :ensure t
  :config
  ;; your preferred main font face here
  (set-frame-font "Inconsolata-14"))
