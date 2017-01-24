configs_dir = ${PWD}
install_if_missing = \
if ! hash $(1) 2>/dev/null; \
then \
yaourt --needed -Sy $(1); \
fi;

all: 
	@printf "use 'init_system' to install packages and configs (requires you to be on arch)\nor 'install_configs' to install only configs"

init_system: base emacs tmux zsh ssh stumpwm

install_configs: emacs_conf tmux_conf zsh_conf X_conf stumpwm_conf

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

emacs_pkg: yaourt
	$(call install_if_missing emacs)

emacs_conf: emacs/.emacs emacs/.emacs.elget emacs/.emacs.flyspell emacs/.emacs.latex emacs/.emacs.orgmode emacs/.emacs.python ~/.emacs.d ~/.emacs.d/custom-agenda.el
	if [ ! -d ~/.emacs.d ]; then mkdir ~/.emacs.d; fi;
	ln -fs $(configs_dir)/emacs/.emacs ~/.emacs
	ln -fs $(configs_dir)/emacs/.emacs.elget ~/.emacs.d/.emacs.elget
	ln -fs $(configs_dir)/emacs/.emacs.flyspell ~/.emacs.d/.emacs.flyspell
	ln -fs $(configs_dir)/emacs/.emacs.latex ~/.emacs.d/.emacs.latex
	ln -fs $(configs_dir)/emacs/.emacs.orgmode ~/.emacs.d/.emacs.orgmode
	ln -fs $(configs_dir)/emacs/.emacs.python ~/.emacs.d/.emacs.python
	if [ ! -f ~/.emacs.d/custom-agenda.el ]; then echo "(defvar custom-org-agenda-files '(\"\"))" > ~/.emacs.d/custom-agenda.el; fi;

emacs: emacs_pkg emacs_conf

tmux_pkg: yaourt
	$(call install_if_missing tmux)

tmux_conf: .tmux.conf
	ln -fs $(configs_dir)/.tmux.conf ~/.tmux.conf

tmux: tmux_pkg tmux_conf

zsh_pkg: yaourt 
	$(call install_if_missing zsh)
	$(call install_if_missing powerline)

zsh_conf:
	ln -fs $(configs_dir)/zsh/.zshrc ~/.zshrc

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
	sudo ln -fs $(configs_dir)/X/00-keyboard.conf /etc/X11/xorg.conf.d/00-keyboard.conf

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

stumpwm_pkg: X zsh pulseaudio alacritty yaourt google-chrome
	$(call install_if_missing stumwm-git)

stumpwm_conf: X/.xinitrc zsh/.zprofile .stumpwmrc
	ln -fs $(configs_dir)/zsh/.zprofile ~/.zprofile
	ln -fs $(configs_dir)/X/.xinitrc ~/.xinitrc
	ln -fs $(configs_dir)/.stumpwmrc ~/.stumpwmrc
stumpwm: stumpwm_pkg stumpwm_conf
