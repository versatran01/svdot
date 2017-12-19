#!/bin/bash
PACKAGES=(
          autojump
          cmake
          curl
          dstat
          git
          gitg
          guake
          htop
          indicator-multiload
          meld
          oracle-java8-installer
          tig
          tmux
          vim
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
apt-add-repository ppa:webupd8team/java
apt-add-repository ppa:numix/ppa
apt-add-repository ppa:noobslab/themes

apt-get update --force-yes

#Intall packages
apt-get -y --force-yes install ${PACKAGES[@]}
