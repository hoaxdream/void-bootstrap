#!/bin/sh
# https://github.com/hoaxdream
# Author: hoaxdream

# Install dots
inst_dot()
  {
    cd ~
    echo "dots" >> .gitignore
    git clone --bare https://github.com/hoaxdream/void-dots.git $HOME/.config/dots
    git --git-dir=$HOME/.config/dots/ --work-tree=$HOME checkout
    git --git-dir=$HOME/.config/dots/ --work-tree=$HOME config --local status.showUntrackedFiles no
  }

# Dwm,st,dmenu,startpage
inst_repo()
  {
    # Clone the repositories
    git clone https://github.com/hoaxdream/void-dwm ~/.config/dwm
    git clone https://github.com/hoaxdream/void-st ~/.config/st
    git clone https://github.com/hoaxdream/void-dmenu ~/.config/dmenu
    git clone https://github.com/hoaxdream/void-slock ~/.config/slock
    git clone https://github.com/hoaxdream/startpage ~/.config/startpage
    # Make install
    cd ~/.config/dwm
    make && sudo make install
    cd ~/.config/st
    make && sudo make install
    cd ~/.config/dmenu
    make && sudo make install
    cd ~/.config/slock
    make && sudo make install
  }

echo 'dotfiles'
inst_dot
echo 'repositories'
inst_repo

echo 'Run sudo ./partcore then sudo ./partdata for fresh disk, otherwise just run sudo ./postinstall then reboot'
