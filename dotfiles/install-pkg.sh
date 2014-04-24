#!/bin/bash
PACKAGES=(ack-grep
          astyle
          autojump
          bpython
          calibre
          cmake
          compiz
          compizconfig-settings-manager
          compiz-plugins
          dstat
          fluxgui
          gimp
          git
          gitg
          git-review
          guake
          htop
          indicator-multiload
          meld
          mercurial
          nemiver
          openjdk-7-jdk
          openjdk-7-jre
          openshot
          pep8
          pkg-config
          python-matplotlib
          python-numpy
          python-pip
          python-scipy
          texmaker
          tmux
          ubuntu-tweak
          vim
          vim-gtk
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
#ubuntu-tweak
add-apt-repository -y ppa:tualatrix/ppa
#flux
add-apt-repository -y ppa:noobslab/indicators
apt-get update --force-yes

#Intall packages
apt-get -y --force-yes install ${PACKAGES[@]}
