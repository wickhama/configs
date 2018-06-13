install () {
    if [ -z $(command -v $1) ]
    then
	if [ -n $(command -v pacman) ]
	then
	    if [ -z $(command -v yaourt) ]
	    then
		sudo pacman -S yaourt
	    fi
	    yaourt -S $1 --noconfirm
	fi
    fi
}

install base-devel
install git

install sbcl
install slime

. stumpwm/install_stump.sh

install zsh
if [ -z $(echo $SHELL | grep zsh) ]
then
    chsh -s /usr/bin/zsh
fi

install emacs
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

install google-chrome

