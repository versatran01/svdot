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
alias qt='/opt/Qt/Tools/QtCreator/bin/qtcreator &'
alias kd='/usr/local/bin/kdev &'
alias acl='sudo apt autoclean'
alias arm='sudo apt autoremove'
alias kd='/opt/kde &'
alias matlab='matlab -nodesktop -nosplash'
alias sp='spyder &'
alias gtop='watch --color -n1.0 gpustat --color'
alias spd='spyder --new-instance &'
alias rg='ranger'

# git
alias g='git'
alias groot='cd "$(git rev-parse --show-toplevel)"'
alias gst='git status'
alias gba='git branch -a'
alias gdf='git diff'
alias gdfh='git diff HEAD'

# source bashrc
alias sbrc='source ~/.bashrc'
alias scat='source devel/setup.bash'

# fasd
alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias sa='fasd -sia'
alias z='fasd_cd -d'     # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # cd with interactive selection
alias v='f -e vim'       # quick opening files with vim
alias vv='sf -e vim'     # quick opening files with vim interactively
alias m='f -e mplayer'   # quick opening files with mplayer
alias o='a -e xdg-open'  # quick opening files with xdg-open
alias oo='sa -e xdg-open' # quick opening files with xdg-open interactively
alias p='f -e evince'    # quick opening pdf files with evince

#cd
alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
alias cd.....='cd ../../../..'
alias cd......='cd ../../../../..'
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

#ros
alias rqtrc='rosrun rqt_reconfigure rqt_reconfigure'
alias rqtrt='rosrun rqt_runtime_monitor rqt_runtime_monitor'
alias rqtiv='rqt_image_view'
alias rosenv='env | grep ROS'
alias cb='catkin build'
alias cbr='catkin build -DCMAKE_BUILD_TYPE=Release'
alias cmk='catkin_make'
alias cmkr='catkin_make -DCMAKE_BUILD_TYPE=Release'
alias cmkt='catkin_make run_tests'

#fuck
alias fuck='eval $(thefuck $(fc -ln -1)); history -r'
alias FUCK='fuck'
