#!/bin/bash
PACKAGES=(
aria2
autojump
cmake
curl
dstat
git
gitg
guake
htop
meld
tig
tmux
vim
silversearcher-ag
nnn
neofetch
gimp
vlc
ubuntu-restricted-extras
tldr
pydf
cloc
kazam
copyq
variety
python3-pip
ranger
filezilla
)

SNAPS=(
lnav
mathpix-snipping-tool
communitytheme
obs-studio
)

# others
# kdenlive
# obs-studio


#Stop if a command ends in an error
set -e

#Check to see if we are running with root privileges
if [[ $(id -u) -ne 0 ]] ; then
  echo "Please run this script as root (eg using sudo)"
  exit 1
fi

echo "Making sure all system software is up to date."
apt-get update --force-yes
apt-get -y upgrade --force-yes

#Intall packages
apt-get -y --force-yes install ${PACKAGES[@]}
snap install ${SNAPS[@]}

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
# fzf-extras
git clone https://github.com/atweiden/fzf-extras ~/.fzf-extras
cat >> ~/.bashrc <<'EOF'
[[ -e "$HOME/.fzf-extras/fzf-extras.sh" ]] \
  && source "$HOME/.fzf-extras/fzf-extras.sh"
EOF

# tmux
git clone https://github.com/gpakosz/.tmux.git ~/.tmux
ln -s -f ~/.tmux/.tmux.conf ~/.tmux.conf

# powerline
sudo pip3 install -U powerline-shell

# cargo
cargo install exa
cargo install procs
cargo install bat
cargo install ripgrep
cargo install fd-find
cargo install dust
