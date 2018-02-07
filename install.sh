install () {
    if [ -z $(command -v $1) ]
    then
	if [ -n $(command -v pacman) ]
	then
	    if [ -z $(command -v yaourt) ]
	    then
		pacman -S yaourt
	    fi
	    yaourt -S $1 --noconfirm
	fi
    fi
}

#TODO install stumpwm via quicklisp

install zsh
chsh -s zsh
install emacs
install google-chrome-stable

