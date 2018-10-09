[[ $TERM == "dumb" ]] && unsetopt zle && PS1='$ ' && return

include () {
    [[ -f "$1" ]] && source "$1"
}

include $HOME/.zsh/alias.zsh
include $HOME/.zsh/env.zsh
include $HOME/.zsh/zsh_opts.zsh
include $HOME/.local.zsh

#zsh needs to update emacs' default directory
if [ -n "$INSIDE_EMACS" ]; then
  chpwd() { print -P "\033AnSiTc %d" }
  print -P "\033AnSiTu %n"
  print -P "\033AnSiTc %d"
fi
