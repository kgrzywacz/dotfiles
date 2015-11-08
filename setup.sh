#!/bin/bash

# Variables

dir=~/dotfiles
backup=~/dotfiles_old
files="vimrc gvimrc vim zshrc zsh oh-my-zsh tmux.conf"
dirs="jars sfdev/workspaces sfdev/tests sfdev/backup sfdev/settings sfdev/temp"

########

# create dotfiles_old in home
echo "Creating $backup for backup of any dotfiles existing in homedir"
mkdir -p $backup
echo "Done"

# change to dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "Done"

# move any existing dotfile in homedir to dotfiles_old directory, then create symlinks
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $backup"
    mv ~/.$file $backup/
    echo "Creating symlink to $file in home directory"
    ln -s $dir/$file ~/.$file
done

# initialize paths for force.com plugin
for dir in $dirs; do
    echo "Creating $dir in home directory"
    mkdir -p ~/$dir
done

# download jars needed for development
curl -o ~/jars/tooling-force.com.jar https://github.com/neowit/tooling-force.com/releases/download/v0.3.4.2/tooling-force.com-0.3.4.2.jar
