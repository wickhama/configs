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
 '(org-agenda-files
   (quote
    ("/home/warnock/Documents/code/cpsc371_ai/doc/planning.org" "/home/warnock/Documents/code/clojure/pathfinder/doc/design.org" "/home/warnock/Documents/notes/notes.org" "/home/warnock/Documents/notes/shows.org" "/home/warnock/Documents/notes/misc/daniel_computer.org" "/home/warnock/Documents/notes/misc/required_stuff.org" "/home/warnock/Documents/notes/misc/work.org" "/home/warnock/Documents/notes/misc/property.org" "/home/warnock/Documents/notes/recipies.org" "/home/warnock/Documents/notes/shopping_list.org" "/home/warnock/Documents/notes/school/fourth_year/cpsc495/intern_assignment.org" "/home/warnock/Documents/notes/school/fourth_year/cpsc320/lecture4.org" "/home/warnock/Documents/notes/school/fourth_year/cpsc320/lecture2.org" "/home/warnock/Documents/notes/school/fourth_year/cpsc320/assignments_320.org" "/home/warnock/Documents/notes/school/fourth_year/cpsc320/lecture1.org" "/home/warnock/Documents/notes/school/fourth_year/cpsc320/lecture3.org" "/home/warnock/Documents/notes/school/fourth_year/cpsc699/assignments_699.org" "/home/warnock/Documents/notes/school/fourth_year/cpsc699/lecture1.org" "/home/warnock/Documents/notes/school/fourth_year/phil205/lecture4.org" "/home/warnock/Documents/notes/school/fourth_year/phil205/lecture1.org" "/home/warnock/Documents/notes/school/fourth_year/phil205/lecture3.org" "/home/warnock/Documents/notes/school/fourth_year/phil205/assignments_205.org" "/home/warnock/Documents/notes/school/fourth_year/eng104/lecture6.org" "/home/warnock/Documents/notes/school/fourth_year/eng104/assignments_104.org" "/home/warnock/Documents/notes/school/fourth_year/eng104/lecture4.org" "/home/warnock/Documents/notes/school/fourth_year/eng104/lecture5.org" "/home/warnock/Documents/notes/school/fourth_year/eng104/lecture2.org" "/home/warnock/Documents/notes/school/fourth_year/eng104/lecture1.org" "/home/warnock/Documents/notes/school/fourth_year/eng104/lecture7.org" "/home/warnock/Documents/notes/school/fourth_year/eng104/lecture3.org" "/home/warnock/Documents/notes/school/fourth_year/schedule.org" "/home/warnock/Documents/notes/school/fourth_year/cpsc472/lecture6.org" "/home/warnock/Documents/notes/school/fourth_year/cpsc472/lecture4.org" "/home/warnock/Documents/notes/school/fourth_year/cpsc472/assignments_472.org" "/home/warnock/Documents/notes/school/fourth_year/cpsc472/lecture5.org" "/home/warnock/Documents/notes/school/fourth_year/cpsc472/lecture2.org" "/home/warnock/Documents/notes/school/fourth_year/cpsc472/lecture1.org" "/home/warnock/Documents/notes/school/fourth_year/cpsc472/lecture7.org" "/home/warnock/Documents/notes/school/fourth_year/cpsc472/lecture3.org" "/home/warnock/Documents/meal_plan.org" "/home/warnock/Documents/notes/school/fourth_year/cpsc472/assignments_472.org" "/home/warnock/Documents/notes/school/fourth_year/cpsc472/lecture1.org" "/home/warnock/Documents/notes/school/fourth_year/cpsc472/lecture2.org" "/home/warnock/Documents/notes/school/fourth_year/cpsc472/lecture3.org" "/home/warnock/Documents/notes/school/fourth_year/cpsc472/lecture4.org" "/home/warnock/Documents/notes/school/fourth_year/cpsc472/lecture5.org" "/home/warnock/Documents/notes/school/fourth_year/cpsc472/lecture6.org" "/home/warnock/Documents/notes/school/fourth_year/cpsc472/lecture7.org")))
 '(package-selected-packages (quote (slime queue cider darcula-theme general))))
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
;-------------------- LISP CONFIGS --------------------
(load-file "~/.emacs.d/.emacs.lisp")
