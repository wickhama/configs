[[ $TERM == "dumb" ]] && unsetopt zle && PS1='$ ' && return

include () {
    [[ -f "$1" ]] && source "$1"
}

include ~/.zsh/alias.zsh
include ~/.zsh/env.zsh
include ~/.zsh/zsh_opts.zsh
include ~/.local.zsh

#zsh needs to update emacs' default directory
if [ -n "$INSIDE_EMACS" ]; then
  chpwd() { print -P "\033AnSiTc %d" }
  print -P "\033AnSiTu %n"
  print -P "\033AnSiTc %d"
fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
