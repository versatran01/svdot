# shell command
alias rmi='rm -i'
alias mvi='mv -i'
alias cpi='cp -i'
alias grep='grep --color -n'
alias ll='ls -lh'
alias lf='ls -F'
alias lm='ls -al | more'
alias eecho='echo -e'
alias tmux='tmux -2'

# programs
alias xo='xdg-open'
alias xoo='xdg-open .'
alias df='df -Th'
alias sup='sudo apt update'
alias sug='sudo apt upgrade'
alias sud='sudo apt dist-upgrade'
alias dstat='dstat -cdlmnpsy'
alias qtc='/opt/Qt/Tools/QtCreator/bin/qtcreator &'
alias kdv='/usr/local/bin/kdev &'
alias acl='sudo apt autoclean'
alias arm='sudo apt autoremove'
alias matlabnn='matlab -nodesktop -nosplash'
alias gtop='watch --color -n1.0 gpustat --color'
alias spd='spyder --new-instance &'
alias rg='ranger'

# git
alias g='git'
alias grjot='cd "$(git rev-parse --show-toplevel)"'
alias gst='git status'
alias gba='git branch -a'
alias gdf='git diff'
alias gdh='git diff HEAD'

# source bashrc
alias sbrc='source ~/.bashrc'
alias scat='source devel/setup.bash'

#cd
alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
alias cd.....='cd ../../../..'
alias cd......='cd ../../../../..'

#ros
alias rqtrc='rosrun rqt_reconfigure rqt_reconfigure'
alias rqtrt='rosrun rqt_runtime_monitor rqt_runtime_monitor'
alias rqtiv='rqt_image_view'
alias rosenv='env | grep ROS'
alias cb='catkin build'
alias cbr='catkin build -DCMAKE_BUILD_TYPE=Release'

# python 
alias ppwd='export PYTHONPATH=`pwd`'

