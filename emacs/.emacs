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
 '(inhibit-startup-screen t)
 '(package-selected-packages (quote (darcula-theme general))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;------------------- END OF AUTO GENERATED CODE --------------------

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
;------------------- EVIL MODE CONFIG --------------------
(load-file "~/.emacs.d/.emacs.evil")
;-------------------- MISC CONFIGS --------------------
(load-file "~/.emacs.d/.emacs.misc")
;-------------------- IDE CONFIGS --------------------
(load-file "~/.emacs.d/.emacs.ide")
