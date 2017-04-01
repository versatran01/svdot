#!/bin/bash
FILES=(bash_local
bash_aliases
bash_functions
tmuxline
tmux.conf
gitconfig
gitignore
inputrc
promptline.sh
ycm_extra_conf.py
)


for file in "${FILES[@]}"
do
    echo Linking "$file" to $HOME
    ln -sf $(pwd)/$file ~/.$file
done
