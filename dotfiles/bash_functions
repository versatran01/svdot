#Define Colors
red='\[\e[0;31m\]'
RED='\[\e[1;31m\]'
blue='\[\e[0;34m\]'
BLUE='\[\e[1;34m\]'
cyan='\[\e[0;36m\]'
CYAN='\[\e[1;36m\]'
NC='\[\e[0m\]'          # No Color
black='\[\e[0;30m\]'
BLACK='\[\e[1;30m\]'
green='\[\e[0;32m\]'
GREEN='\[\e[1;32m\]'
yellow='\[\e[0;33m\]'
YELLOW='\[\e[1;33m\]'
magenta='\[\e[0;35m\]'
MAGENTA='\[\e[1;35m\]'
white='\[\e[0;37m\]'
WHITE='\[\e[1;37m\]'

# get current host related info
function ii()
{
    echo -e "\nYou are logged on ${RED}$HOST"
    echo -e "\nAdditionnal information:$NC " ; uname -a
    echo -e "\n${RED}Users logged on:$NC " ; w -h
    echo -e "\n${RED}Current date :$NC " ; date
    echo -e "\n${RED}Machine stats :$NC " ; uptime
    echo -e "\n${RED}Memory stats :$NC " ; free
    MY_IP=$(/sbin/ifconfig ath0 | awk '/inet/ { print $2 } ' | sed -e s/addr://)
    echo -e "\n${RED}Local IP Address :$NC" ; echo ${MY_IP:-"Not connected"}
}

# ssh to nanoplus
function overo()
{
  OK=1
  case "$1" in
    "13")
      IP=162
      ;;
    "14")
      IP=163
      ;;
    "15")
      IP=164
      ;;
    *)
      echo "Not a valid overo"
      return
      ;;
  esac

  ssh "root@192.168.129.$IP"
}

# cd to last modified directory
cl()
{
  last_dir="$(ls -Frt | grep '/$' | tail -n1)"
    if [ -d "$last_dir" ]; then
      cd "$last_dir"
        fi
}
