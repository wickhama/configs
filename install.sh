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

. stumpwm/install_stump.sh

install zsh
if [ -z $(echo $SHELL | grep zsh) ]
then
    chsh -s zsh
fi
install emacs
install google-chrome-stable

