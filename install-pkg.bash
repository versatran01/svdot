#!/bin/bash
PACKAGES=(git
          git-review
          mercurial
          vim
          vim-gtk
          guake
          pkg-config
          cmake
          tmux
          ubuntu-tweak
          gimp
          openshot
          autojump
          python-pip
          python-numpy
          python-scipy
          python-matplotlib
          openjdk-7-jre
          openjdk-7-jdk
          gitg
          nemiver
          filezilla
          texmaker
          texmacs
          bpython
          calibre
          indicator-multiload
          indicator-cpufreq
          copyq
          indicator-sensors
          lm-sensors
          fluxgui
          indicator-notifications
          recent-notifications
          tracker-gui
          )

#Stop if a command ends in an error
set -e

#Check to see if we are unning with root privileges
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
#copyq
add-apt-repository -y ppa:samrog131/ppa
#notification
add-apt-repository -y ppa:jconti/recent-notifications
#sensor
add-apt-repository -y ppa:noobslab/indicators
#brightness
add-apt-repository -y ppa:indicator-brightness/ppa
#flux
add-apt-repository -y ppa:noobslab/indicators
apt-get update --force-yes

#Intall packages
apt-get -y --force-yes install ${PACKAGES[@]}

#git setup
git config --global color.ui true
