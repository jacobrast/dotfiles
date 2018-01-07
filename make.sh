#!/bin/bash
# TODO: Automatically generate $FILES var. 
# TODO: Ask user if they want to copy each dotfile
# TODO: Add options for config files, ie .i3, .vim
# TODO: Add a dry run option

# home directory.
HOME="$( cd ~ && pwd )"
# dotfiles directory. This should be current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# directory for old dotfiles. This will be at root
BACKUPDIR="$HOME/dotfiles_backup"
# All the files that shoud be backed up.
FILES=".vimrc .bashrc .bash_aliases .Xresources"
CONFIGS="i3"
FIRST_INSTALL=""
BACKGROUND=NC27TKc.jpg

while [[ $FIRST_INSTALL != "y" && $FIRST_INSTALL != "n" ]]
do
    read -p "Is this your first install? (y/n): " $FIRST_INSTALL
    if [[ $FIRST_INSTALL != "y" && $FIRST_INSTALL != "n" ]]
    then
        printf "Please enter only 'y' or 'n'"
    fi
done

if [[ $FIRST_INSTALL == "y" ]]
then
    printf "Escalating to SU for to move to /usr/share folder \n"
    sudo cp $BACKGROUND /usr/share/backgrounds/
fi

# TODO: Ask user if they want to backup a given dot file, and if they do, add a
# version number.
# Backup existing dot files, then remove old file and create a new symlink to
# file in dotfiles dir
echo "Creating $BACKUPDIR for backup of any existing dotfiles in home dir"
mkdir -p $BACKUPDIR
for file in $FILES; do
    if [ -e $HOME/$file ] && [ ! -h $HOME/$file ]
        then
        echo "Backing up $file"
        mv -i $HOME/$file $BACKUPDIR
    fi
    rm $HOME/$file
    ln -s $DIR/$file $HOME/$file
done

# Do the same as above for ~/.config/ files and directories
for file in $CONFIGS; do
    echo "Moving ~/.config/ files or dirs from ~/.config/ to $~/.config/backup"
    mv -i ~/.config/$file ~/.config/backup
    echo "Creating symlinks to $file in ~/.config/"
    ln -s $DIR/$file ~/.config/$file
done
