#!/bin/bash
FILES=(
profile
bash_local
bash_aliases
bash_functions
tmux.conf.local
gitconfig
gitignore
inputrc
ideavimrc
pylintrc
condarc
starship.toml
)

for file in "${FILES[@]}"
do
  echo Linking "$file" to $HOME
  ln -sf $(pwd)/$file ~/.$file
done
