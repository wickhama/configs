. ~/.zsh/alias.zsh
. ~/.zsh/env.zsh
. ~/.zsh/zsh_opts.zsh

#zsh needs to update emacs' default directory
if [ -n "$INSIDE_EMACS" ]; then
  chpwd() { print -P "\033AnSiTc %d" }
  print -P "\033AnSiTu %n"
  print -P "\033AnSiTc %d"
fi
