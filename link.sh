configs_dir=$(pwd)
rm -f ~/.zsh #prevent creating the symlink to zsh inside of zsh
ln -sf $configs_dir/zsh ~/.zsh
ln -sf $configs_dir/zsh/.zshrc ~/.zshrc

ln -sf $configs_dir/stumpwm/.stumpwmrc ~/.stumpwmrc
sudo cp -f $configs_dir/stumpwm/stumpwm.desktop /usr/share/xsessions/
sudo ln -sf $configs_dir/stumpwm/stumpwm.sh /usr/local/bin/

ln -sf $configs_dir/X/.Xkbmap ~/.Xkbmap

ln -sf $configs_dir/emacs/.spacemacs ~/.spacemacs
ln -sf $configs_dir/emacs/configs.org ~/.emacs.d/configs.org
