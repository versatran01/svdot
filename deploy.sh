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
    starship.toml
)

BINS=(
    cmk
    svbuild
)

for file in "${FILES[@]}"; do
    echo Linking "$file" to $HOME
    ln -sf $(pwd)/$file ~/.$file
done

for bin in "${BINS[@]}"; do
    echo Linking "$bin" to $HOME/.local/bin
    ln -sf $(pwd)/$bin $HOME/.local/bin/$bin
done
