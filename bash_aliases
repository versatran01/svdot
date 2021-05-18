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
alias btop='bpytop'
alias gtop='gpustat --no-header --color -u -P -i'
alias dstat='dstat -cdlmnpsy'
alias ft='fzf-tmux'
alias df='pydf'

# programs
alias xc='xclip -se c'
alias xo='xdg-open'
alias sup='sudo apt update'
alias sug='sudo apt upgrade'
alias smi='sudo make install'
alias acl='sudo apt autoclean'
alias arm='sudo apt autoremove'

# git
alias grt='cd $(git rev-parse --show-toplevel)'
alias gst='git status'
alias gba='git branch -a'
alias gdf='git diff'
alias gdh='git diff HEAD'

# source bashrc
alias sbrc='source ~/.bashrc'

#cd
alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
alias cd.....='cd ../../../..'
alias cd......='cd ../../../../..'

#ros
alias rqtrc='rosrun rqt_reconfigure rqt_reconfigure'
alias rqttf='rosrun rqt_tf_tree rqt_tf_tree'
alias rqtrt='rosrun rqt_runtime_monitor rqt_runtime_monitor'
alias rqtiv='rqt_image_view'
alias rosenv='env | grep ROS'
alias cbr='catkin build -j8 --cmake-args -DCMAKE_CXX_COMPILER_LAUNCHER=ccache -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS="-Wall -Wextra -Wno-deprecated-copy -fdiagnostics-color=always" -- '
alias cbd='catkin build -j8 --cmake-args -DCMAKE_CXX_COMPILER_LAUNCHER=ccache -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_CXX_FLAGS="-Wall -Wextra -Wno-deprecated-copy -fdiagnostics-color=always" -- '
alias cbt='catkin build -j8 --cmake-args -DCMAKE_CXX_COMPILER_LAUNCHER=ccache -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS="-Wall -Wextra -Wno-deprecated-copy -fdiagnostics-color=always" -- '
alias crt="catkin run_tests | sed -En '/^-- run_tests.py/,/^-- run_tests.py/p'"

# colcon
alias cn="colcon"
alias cnbr='colcon build --cmake-args -DCMAKE_CXX_COMPILER_LAUNCHER=ccache -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS="-Wall -Wextra -fdiagnostics-color=always" --symlink-install'
alias cnbd='colcon build --cmake-args -DCMAKE_CXX_COMPILER_LAUNCHER=ccache -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_CXX_FLAGS="-Wall -Wextra -fdiagnostics-color=always" --symlink-install'

# python 
alias ppwd='export PYTHONPATH=$(pwd):$PYTHONPATH'

# alias
alias cmk='cmake -DBUILD_SHARED_LIBS=On -DCMAKE_CXX_STANDARD=17 -DCMAKE_EXPORT_COMPILE_COMMANDS=On -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_COMPILER_LAUNCHER=ccache -DCMAKE_CXX_FLAGS="-fdiagnostics-color=always"'
alias cpuperf='sudo cpupower frequency-set --governor performance'
alias cpusave='sudo cpupower frequency-set --governor powersave'
alias cmk_init='mkdir build; cd build; cmk ..; ccmake ..'

