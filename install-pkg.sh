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
          gimp
          vlc
          ubuntu-restricted-extras
          tldr
          pydf
          cloc
          kazam
          copyq
          variety
          )

SNAPS=(
    lnav
    mathpix-snipping-tool
    communitytheme
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

sudo snap install communitytheme
sudo snap install mathpix-snipping-tool
sudo snap install lnav
