install_if_missing = \
if ! hash $(1) 2>/dev/null; \
then \
yaourt --needed -Sy $(1); \
fi;

all: yaourt base stumpwm

build_dir: ~/build
	if [ ! -d ~/build ]; then mkdir ~/build; fi;
	if [ ! -d ~/build/AUR ]; then mkdir ~/build/AUR; fi;

yaourt: build_dir
	if ! hash yaourt 2>/dev/null; \
	then \
	cd ~/build/AUR && \
	git clone https://aur.archlinux.org/package-query.git && \
	cd package-query && \
	makepkg -si && \
	cd ~/build/AUR && \
	git clone https://aur.archlinux.org/yaourt.git && \
	cd ~/build/AUR/yaourt && \
	makepkg -si; \
	fi; 

emacs: yaourt 
	$(call install_if_missing emacs)
	if [ ! -d ~/.emacs.d ]; then mkdir ~/.emacs.d; fi;
	ln -f emacs/.emacs ~/.emacs
	ln -f emacs/.emacs.elget ~/.emacs.d/.emacs.elget
	ln -f emacs/.emacs.flyspell ~/.emacs.d/.emacs.flyspell
	ln -f emacs/.emacs.latex ~/.emacs.d/.emacs.latex
	ln -f emacs/.emacs.orgmode ~/.emacs.d/.emacs.orgmode
	ln -f emacs/.emacs.python ~/.emacs.d/.emacs.python
	if [ ! -f ~/.emacs.d/custom-agenda.el ]; then echo "(defvar custom-org-agenda-files \"\")" > ~/.emacs.d/custom-agenda.el; fi;

tmux:
	$(call install_if_missing tmux)
	ln -f .tmux.conf ~/.tmux.conf
zsh: yaourt 
	$(call install_if_missing zsh)
	$(call install_if_missing powerline)
	ln -f zsh/.zshrc ~/.zshrc
ssh: yaourt 
	$(call install_if_missing openssh)

google-chrome: yaourt
	$(call install_if_missing google-chrome)

base: emacs tmux zsh ssh alacritty google-chrome
	if [ ! -d ~/Downloads ]; then mkdir ~/Downloads; fi;
	if [ ! -d ~/Documents ]; then mkdir ~/Documents; fi;

X: yaourt X/.xinitrc
	$(call install_if_missing xorg-server)
	$(call install_if_missing xorg-xinit)
	$(call install_if_missing xorg-xdpyinfo)
	$(call install_if_missing xsel)
	$(call install_if_missing xtrlock)

rustup:
	if [ ! -d ~/.cargo ]; then \
	curl https://sh.rustup.rs -sSf | sh; \
	fi

alacritty: X rustup yaourt 
	if ! hash alacritty 2>/dev/null; \
	then \
	source ~/.cargo/env; \
	rustup override set nightly; \
	yaourt --needed -Sy alacritty-git; \
	fi;

pulseaudio: X yaourt 
	$(call install_if_missing pulseaudio)
	$(call install_if_missing pavucontrol)

stumpwm: X zsh pulseaudio alacritty yaourt google-chrome
	$(call install_if_missing stumwm-git)
	ln -f zsh/.zprofile ~/.zprofile
	ln -f X/.xinitrc ~/.xinitrc
	ln -f .stumpwmrc ~/.stumpwmrc
