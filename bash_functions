#!bin/bash
######################################################################
# This file is a collection of useful functions
######################################################################

# share internet
function basedir() {
  basename $(pwd)
}

function sharenet() {
  if [ $# -eq 0 ]; then
    echo "usage: sharenet <on/off>"
    return 0
  fi

  local if_from=wlp2s0
  local if_to=enx28f10e4f563b
  # check command-line commands
  cmd=$1
  case $cmd in
    on)
      sudo su -c "echo 1 > /proc/sys/net/ipv4/ip_forward"
      echo "Enable sharing internet from $if_from to $if_to"
      sudo /sbin/iptables -A FORWARD -i $if_to -o $if_from -j ACCEPT
      sudo /sbin/iptables -A FORWARD -i $if_from -o $if_to -m state --state RELATED,ESTABLISHED -j ACCEPT
      sudo /sbin/iptables -t nat -A POSTROUTING -o $if_from -j MASQUERADE
      ;;
    off)
      sudo su -c "echo 0 > /proc/sys/net/ipv4/ip_forward"
      echo "Disable sharing internet from $if_from to $if_to"
      ;;
    *)
      echo "sharenet: $1: invalid command"
      echo "usage: sharenet <on/off>"
      ;;
  esac
}

# Get my ip address
function myip() {
  local myip=$(w3m -dump http://checkip.dyndns.org:8245/)
  echo "${myip}"
}

# get current host related info
function ii() { 
  echo -e "\nYou are logged on ${bldpur}$(hostname)"
  echo -e "\nAdditionnal information:$txtrst "
  uname -a
  echo -e "\n${bldpur}Users logged on:$txtrst "
  w -h
  echo -e "\n${bldpur}Current date :$txtrst "
  date
  echo -e "\n${bldpur}Machine stats :$txtrst "
  uptime
  echo -e "\n${bldpur}Memory stats :$txtrst "
  free
  echo -e "\n${bldpur}Local IP Address :$txtrst"
  myip
  echo -e "\n${bldpur}eth0 ip Address :$txtrst"
  ethip
  echo -e "\n${bldpur}wlan0 ip Address :$txtrst"
  wlanip
  echo
}

# finds directory sizes and lists them for the current directory
function dirsize() {
  du -shx * .[a-zA-Z0-9_]* 2>/dev/null |
    egrep '^ *[0-9.]*[MG]' | sort -n >/tmp/list
      egrep '^ *[0-9.]*M' /tmp/list
      egrep '^ *[0-9.]*G' /tmp/list
      rm -rf /tmp/list
    }

# Easy extact
function extract() {
  if [ -f $1 ]; then
    case $1 in
      *.tar.bz2) tar xvjf $1 ;;
      *.tar.gz) tar xvzf $1 ;;
      *.bz2) bunzip2 $1 ;;
      *.rar) rar x $1 ;;
      *.gz) gunzip $1 ;;
      *.tar) tar xvf $1 ;;
      *.tbz2) tar xvjf $1 ;;
      *.tgz) tar xvzf $1 ;;
      *.apk) unzip $1 ;;
      *.epub) unzip $1 ;;
      *.xpi) unzip $1 ;;
      *.zip) unzip $1 ;;
      *.war) unzip $1 ;;
      *.jar) unzip $1 ;;
      *.Z) uncompress $1 ;;
      *.7z) 7z x $1 ;;
      *) echo "don't know how to extract '$1'..." ;;
    esac
  else
    echo "'$1' is not a valid file!"
  fi
}

# easy compress - archive wrapper
function compress() {
  if [ -n "$1" ]; then
    FILE=$1
    case $FILE in
      *.tar) shift && tar cf $FILE $* ;;
      *.tar.bz2) shift && tar cjf $FILE $* ;;
      *.tar.gz) shift && tar czf $FILE $* ;;
      *.tgz) shift && tar czf $FILE $* ;;
      *.zip) shift && zip $FILE $* ;;
      *.rar) shift && rar $FILE $* ;;
    esac
  else
    echo "usage: compress <foo.tar.gz> ./foo ./bar"
  fi
}

# set ROS_IP
function rosip() {
  # print current ip if no inputs
  if [ $# -eq 0 ]; then
    rosip_disp
    return 0
  fi

  # check command-line options
  if [ -n "$(echo $1 | grep '^-')" ]; then
    case $1 in
      --help | -h)
        rosip_help
        ;;
      *)
        echo "rosip: $1: invalid option"
        rosip_help
        ;;
    esac
    return 0
  fi

  cmd=$1
  local rx='([1-9]?[0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])'
  case $cmd in
    set)
      if [ "$2" == "-h" ]; then
        echo -e "rosip set set ROS_IP to the given IP address"
        echo -e "usage: rosip set 192.168.129.1"
      elif [[ ! $2 =~ ^$rx\.$rx\.$rx\.$rx$ ]]; then
        # validating IP address using regexp
        echo -e "rosip: set: invalid IP address"
        echo -e "usage: rosip set 192.168.129.1"
      else
        export ROS_IP="$2"
        rosip_disp
      fi
      ;;
    reset)
      if [ "$2" == "-h" ]; then
        echo -e "rosip reset reset ROS_IP to empty"
        echo -e "usage: rosip reset"
      else
        export ROS_IP=localhost
        rosip_disp
      fi
      ;;
    *)
      echo "rosip: $1: invalid command"
      rosip_help
      ;;
  esac
}

function rosip_disp() {
  echo -e "${bldylw}ROS_IP${txtrst}"
  echo -e "${bldgrn}$ROS_IP${txtrst}"
  return 0
}

function rosip_help() {
  echo -e "rosip is a command-line tool for managing ROS_MASTER_URI"
  echo -e "usage: rosip [--help|-h] <command> [<args>]\n"
  echo -e "The most commonly used rosip commands are:"
  echo -e "    set   \tSet ROS_IP to the given IP address"
  echo -e "    reset \tReset ROS_IP to empty"
  echo -e "\nType rosip <command> -h for more detailed usage, e.g. 'rosip set -h'\n"
  return 0
}

# set ROS_MASTER_URI
function rosmu() {
  # print current master uri if no inputs
  if [ $# -eq 0 ]; then
    rosmu_disp
    return 0
  fi

  # check command-line options
  if [ -n "$(echo $1 | grep '^-')" ]; then
    case $1 in
      --help | -h)
        rosmu_help
        ;;
      *)
        echo "rosmu: $1: invalid option"
        rosmu_help
        ;;
    esac
    return 0
  fi

  cmd=$1
  local rx='([1-9]?[0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])'
  case $cmd in
    set)
      if [ "$2" == "-h" ]; then
        echo -e "rosmu set set ROS_MASTER_URI to the given IP address"
        echo -e "usage: rosmu set 192.168.129.1"
      elif [[ ! $2 =~ ^$rx\.$rx\.$rx\.$rx$ ]]; then
        # validating IP address using regexp
        echo -e "rosmu: set: invalid IP address"
        echo -e "usage: rosmu set 192.168.129.1"
      else
        export ROS_MASTER_URI="http://$2:11311"
        rosmu_disp
      fi
      ;;
    reset)
      if [ "$2" == "-h" ]; then
        echo -e "rosmu reset reset ROS_MASTER_URI to local host"
        echo -e "usage: rosmu reset"
      else
        export ROS_MASTER_URI="http://localhost:11311"
        rosmu_disp
      fi
      ;;
    *)
      echo "rosmu: $1: invalid command"
      rosmu_help
      ;;
  esac
}

function rosmu_disp() {
  echo -e "${bldylw}ROS_MASTER_URI${txtrst}"
  echo -e "${bldgrn}$ROS_MASTER_URI${txtrst}"
  return 0
}

function rosmu_help() {
  echo -e "rosmu is a command-line tool for managing ROS_MASTER_URI"
  echo -e "usage: rosmu [--help|-h] <command> [<args>]\n"
  echo -e "The most commonly used rosmu commands are:"
  echo -e "    set   \tSet ROS_MASTER_URI to the given IP address"
  echo -e "    reset \tReset ROS_MASTER_URI to localhost"
  echo -e "\nType rosmu <command> -h for more detailed usage, e.g. 'rosmu set -h'\n"
  return 0
}

function srosm() {
  source /opt/ros/melodic/setup.bash
  export VIRTUAL_ENV=$ROS_DISTRO
}

function srosn()  {
  source /opt/ros/noetic/setup.bash
  export VIRTUAL_ENV=$ROS_DISTRO
}

function srosf() {
  source /opt/ros/foxy/setup.bash
  export VIRTUAL_ENV=$ROS_DISTRO
}

export ROSWS_HOME_DIR="/home/chao/Workspace/ws"

if [ -z $ROSWS_HOME_DIR ]; then
  echo rosws_switch: Please set ROSWS_HOME_DIR to the directory containing ROS workspaces for this script to work.
fi

_roscomplete_rosws_switch() {
  local cur WORKSPACES
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  WORKSPACES=$(find $ROSWS_HOME_DIR -mindepth 1 -maxdepth 1 -type d | grep -v "^.$" | sed 's/.*\///')

  COMPREPLY=($(compgen -W "${WORKSPACES}" -- ${cur}))
  return 0
}


# catkin/colcon_jump
cj() {
  if [ -e $ROSWS_HOME_DIR/$1/devel/setup.bash ]; then
    source $ROSWS_HOME_DIR/$1/devel/setup.bash
    echo "source $ROSWS_HOME_DIR/$1/devel/setup.bash"
    # HACK prepend stuff that should go even before this in path
    export CATKIN_WS_NAME="$1"
    export PATH=$ROS_PATH_OVERLAY:$PATH
    cd $ROSWS_HOME_DIR/$1
  elif [ -e $ROSWS_HOME_DIR/$1/install/setup.bash ]; then
    source $ROSWS_HOME_DIR/$1/install/setup.bash
    echo "source $ROSWS_HOME_DIR/$1/install/setup.bash"
    export CATKIN_WS_NAME="$1"
    # export PATH=$ROS_PATH_OVERLAY:$PATH
    cd $ROSWS_HOME_DIR/$1
  else
    echo "$1 does not exist in $ROSWS_HOME_DIR"
  fi
}

complete -F _roscomplete_rosws_switch cj

function catkin_run_coverage() {
  if [ $# -eq 0 ]; then
    echo -e "catkin_run_coverage requires at least a package"
    return 0
  fi

  catkin run_tests
  for var in "$@"; do
    catkin run_tests --no-deps $var -DCMAKE_BUILD_TYPE=Coverage --make-args "run_coverage_$var"
    xdg-open "build/$var/coverage/index.html"
  done
  gcovr -r .
}

# source conda
function scon() {
  eval "$(/home/chao/miniconda3/bin/conda shell.bash hook)"
}

# set gpu id
function gpu() {
  export CUDA_VISIBLE_DEVICES="$1"
  export TS_SOCKET="/tmp/cuda$1"
}

function upal_gcc() {
  if [ $# -eq 0 ]; then
    echo -e "need version number"
    return 0
  fi
  sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-$1 100 --slave /usr/bin/g++ g++ /usr/bin/g++-$1 --slave /usr/bin/gcov gcov /usr/bin/gcov-$1

}

function upal_clang() {
  if [ $# -eq 0 ]; then
    echo -e "need version number"
    return 0
  fi
  sudo update-alternatives --install /usr/bin/clang clang /usr/bin/clang-$1 100 --slave /usr/bin/clang++ clang++ /usr/bin/clang++-$1 --slave /usr/bin/clang-format clang-format /usr/bin/clang-format-$1 --slave /usr/bin/clang-tidy clang-tidy /usr/bin/clang-tidy-$1
}
