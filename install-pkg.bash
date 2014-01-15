#!/bin/bash
PACKAGES=(autojump
          banshee
          bpython
          calibre
          cmake
          compiz
          compizconfig-settings-manager
          compiz-plugins
          copyq
          filezilla
          fluxgui
          gimp
          git
          git-review
          gitg
          guake
          handbrake
          indicator-cpufreq
          indicator-multiload
          indicator-notifications
          indicator-sensors
          lm-sensors
          mercurial
          nemiver
          openjdk-7-jdk
          openjdk-7-jre
          openshot
          pkg-config
          python-matplotlib
          python-numpy
          python-pip
          python-scipy
          recent-notifications
          texmacs
          texmaker
          tmux
          tracker-gui
          ubuntu-tweak
          vim
          vim-gtk
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
