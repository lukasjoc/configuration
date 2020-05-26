#!/bin/bash

# bash setup
cp -a .bashrc .bash_profile .profile ~

# vim setup
cp -a .vim .vimrc .gvimrc ~

# installing pathogen bundles into rtp

git clone git://github.com/zah/nim.vim.git ~/.vim/bundle/toml
git clone git://github.com/wakatime/vim-wakatime.git ~/.vim/bundle/toml
git clone --depth=1 https://github.com/vim-syntastic/syntastic.git ~/.vim/bundle/toml
git clone https://github.com/cespare/vim-toml.git ~/.vim/bundle/toml
git clone https://github.com/fatih/vim-go.git ~/.vim/bundle/vim-go

# tmux and inputrc
cp -a .tmux.conf .inputrc

# git setup
cp -a .gitconfig .gitignore ~
