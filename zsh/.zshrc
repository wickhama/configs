source /usr/share/zsh/site-contrib/powerline.zsh
zstyle ':completion:*' menu select
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -la'

alias pi-crate='docker run -it --rm -v $(pwd):/source dlecan/rust-crosscompiler-armv6:stable'

EDITOR=emacs
#when emacs is started from the terminal, keep it there
alias temacs='emacs -nw'

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/li/work/tools/lindo/l‌​indoapi/bin/linux64
