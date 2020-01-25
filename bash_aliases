# shell command
alias rmi='rm -i'
alias mvi='mv -i'
alias cpi='cp -i'
alias grep='grep --color'
alias lc='colorls -l --sd'
alias ll='ls -lh'
alias lf='ls -F'
alias lm='ls -al | more'
alias eecho='echo -e'
alias tmux='tmux -2'
alias t='tree'
alias ts='tsp'

# programs
alias xc='xclip -se c'
alias xo='xdg-open'
alias za='zathura'
alias df='pydf'
alias sup='sudo apt update'
alias sug='sudo apt upgrade'
alias sud='sudo apt dist-upgrade'
alias smi='sudo make install'
alias dstat='dstat -cdlmnpsy'
alias qtc='/opt/Qt/Tools/QtCreator/bin/qtcreator &'
alias kdv='/usr/local/bin/kdev &'
alias acl='sudo apt autoclean'
alias arm='sudo apt autoremove'
alias gtop='gpustat --no-header --color -u -P -i'
alias spd='spyder --new-instance &'
alias rgr='ranger'
alias ft='fzf-tmux'
alias za='zathura'
alias jlb='jupyter-lab'
alias jnb='jupyter-notebook'

# git
alias grjot='cd "$(git rev-parse --show-toplevel)"'
alias gst='git status'
alias gba='git branch -a'
alias gdf='git diff'
alias gdh='git diff HEAD'
alias grt='cd $(git rev-parse --show-cdup)'

# source bashrc
alias sbrc='source ~/.bashrc'
alias szrc='source ~/.zshrc'
alias scat='source devel/setup.bash'

#cd
alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
alias cd.....='cd ../../../..'
alias cd......='cd ../../../../..'

#ros
alias ck='catkin'
alias rqtrc='rosrun rqt_reconfigure rqt_reconfigure'
alias rqtrt='rosrun rqt_runtime_monitor rqt_runtime_monitor'
alias rqtiv='rqt_image_view'
alias rosenv='env | grep ROS'
alias cbr='catkin build --cmake-args -DCMAKE_CXX_COMPILER_LAUNCHER=ccache -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS="-Wall -Wno-deprecated-copy -fdiagnostics-color=always" -- '
alias cbd='catkin build --cmake-args -DCMAKE_CXX_COMPILER_LAUNCHER=ccache -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_CXX_FLAGS="-Wall -Wno-deprecated-copy -fdiagnostics-color=always" -- '
alias cbt='catkin build --cmake-args -DCMAKE_CXX_COMPILER_LAUNCHER=ccache -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_CXX_FLAGS="-Wall -Wno-deprecated-copy -fdiagnostics-color=always" -DBUILD_TESTING=On -- '
alias crt='catkin build --cmake-args -DCMAKE_CXX_COMPILER_LAUNCHER=ccache -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_CXX_FLAGS="-Wall -Wno-deprecated-copy -fdiagnostics-color=always" -DBUILD_TESTING=On --make-args test -- '

# python 
alias ppwd='export PYTHONPATH=$(pwd):$PYTHONPATH'
alias rrviz='sros && rviz'
alias rcore='sros && roscore'
alias rl='roslaunch'

# alias
alias cmk='cmake .. -DBUILD_SHARED_LIBS=On -DCMAKE_EXPORT_COMPILE_COMMANDS=On -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTING=Off'
                                      

