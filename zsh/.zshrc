#source /usr/share/zsh/site-contrib/powerline.zsh
#zstyle ':completion:*' menu select
export PS1='%B%F{green}[%D{%I:%M}] %F{blue}%d: %f%b'
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -la'

alias pi-crate='docker run -it --rm -v $(pwd):/source dlecan/rust-crosscompiler-armv6:stable'

EDITOR=emacs
#when emacs is started from the terminal, keep it there
alias temacs='emacs -nw'

. ~/.zsh_completion

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/li/work/tools/lindo/l‌​indoapi/bin/linux64
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=10000
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
