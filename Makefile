install_if_missing = \
if ! hash $(1) 2>/dev/null; \
then \
yaourt --needed -Sy $(1); \
fi;

all: 
	@echo "use 'init_system' to install packages and configs (requires you to be on arch)\nor 'install_configs' to install only configs"

init_system: base emacs tmux zsh ssh stumpwm

install_configs: emacs_conf tmux_conf zsh_conf X_conf

build_dir: 
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

emacs_pkg: yaourt
	$(call install_if_missing emacs)

emacs_conf: 
	if [ ! -d ~/.emacs.d ]; then mkdir ~/.emacs.d; fi;
	ln -f emacs/.emacs ~/.emacs
	ln -f emacs/.emacs.elget ~/.emacs.d/.emacs.elget
	ln -f emacs/.emacs.flyspell ~/.emacs.d/.emacs.flyspell
	ln -f emacs/.emacs.latex ~/.emacs.d/.emacs.latex
	ln -f emacs/.emacs.orgmode ~/.emacs.d/.emacs.orgmode
	ln -f emacs/.emacs.python ~/.emacs.d/.emacs.python
	if [ ! -f ~/.emacs.d/custom-agenda.el ]; then echo "(defvar custom-org-agenda-files '(\"\"))" > ~/.emacs.d/custom-agenda.el; fi;

emacs: emacs_pkg emacs_conf

tmux_pkg: yaourt
	$(call install_if_missing tmux)

tmux_conf:
	ln -f .tmux.conf ~/.tmux.conf

tmux: tmux_pkg tmux_conf

zsh_pkg: yaourt 
	$(call install_if_missing zsh)
	$(call install_if_missing powerline)

zsh_conf:
	ln -f zsh/.zshrc ~/.zshrc

zsh: zsh_pkg zsh_conf

ssh: yaourt 
	$(call install_if_missing openssh)

google-chrome: yaourt
	$(call install_if_missing google-chrome)

base:
	if [ ! -d ~/Downloads ]; then mkdir ~/Downloads; fi;
	if [ ! -d ~/Documents ]; then mkdir ~/Documents; fi;

X_pkg: yaourt
	$(call install_if_missing xorg-server)
	$(call install_if_missing xorg-xinit)
	$(call install_if_missing xorg-xdpyinfo)
	$(call install_if_missing xsel)
	$(call install_if_missing xtrlock)

X_conf: X/00-keyboard.conf
	ln -f X/00-keyboard.conf /etc/X11/xorg.conf.d/00-keyboard.conf

X: X_pkg X_conf

rustup:
	if [ ! -d ~/.cargo ]; then \
	curl https://sh.rustup.rs -sSf | sh; \
	fi

alacritty: X_pkg rustup yaourt 
	if ! hash alacritty 2>/dev/null; \
	then \
	source ~/.cargo/env; \
	rustup override set nightly; \
	yaourt --needed -Sy alacritty-git; \
	fi;

pulseaudio: X_pkg yaourt 
	$(call install_if_missing pulseaudio)
	$(call install_if_missing pavucontrol)

stumpwm: X zsh pulseaudio alacritty yaourt google-chrome
	$(call install_if_missing stumwm-git)
	ln -f zsh/.zprofile ~/.zprofile
	ln -f X/.xinitrc ~/.xinitrc
	ln -f .stumpwmrc ~/.stumpwmrc
