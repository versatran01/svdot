#!/bin/bash
PACKAGES=(
          autojump
          calibre
          clang
          cmake
          curl
          dstat
          exuberant-ctags
          gimp
          git
          gitg
          git-review
          guake
          htop
          indicator-multiload
          meld
          nemiver
          oracle-java8-installer
          sublime-text-installer
          tig
          tmux
          valgrind
          vim
          vim-gtk
          vlc
          )

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

#Add ppa
#oracle java
add-apt-repository ppa:webupd8team/java
#sublime-text-3
add-apt-repository ppa:webupd8team/sublime-text-3
apt-add-repository ppa:numix/ppa
add-apt-repository ppa:noobslab/themes

apt-get update --force-yes

#Intall packages
apt-get -y --force-yes install ${PACKAGES[@]}
