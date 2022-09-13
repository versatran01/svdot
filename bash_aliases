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
alias fd='fdfind'
alias nnn='nnn -e'

# programs
alias xc='xclip -se c'
alias xo='xdg-open'
alias sup='sudo apt update'
alias sug='sudo apt upgrade'
alias smi='sudo make install'
alias acl='sudo apt autoclean'
alias arm='sudo apt autoremove'
alias mup='mamba update --all -c conda-forge'

# git
alias grt='cd $(git rev-parse --show-toplevel)'
alias gst='git status'
alias gba='git branch -a'
alias gdf='git diff'
alias gdh='git diff HEAD'

# source bashrc
alias sbrc='source ~/.bashrc'
alias srosn='scon ros1n'

#cd
alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
alias cd.....='cd ../../../..'
alias cd......='cd ../../../../..'

alias rosenv='env | grep ROS'
alias rqttf='rosrun rqt_tf_tree rqt_tf_tree'
alias rqtiv='rosrun rqt_image_view rqt_image_view'
alias rqtrc='rosrun rqt_reconfigure rqt_reconfigure'
alias rqtrt='rosrun rqt_runtime_monitor rqt_runtime_monitor'

alias cbr='catkin build -j --cmake-args -DCMAKE_BUILD_TYPE=Release --'
alias cbd='catkin build -j --cmake-args -DCMAKE_BUILD_TYPE=RelWithDebInfo --'
alias ccfg='catkin config --cmake-args -DCMAKE_CXX_COMPILER_LAUNCHER=ccache -DCMAKE_CXX_FLAGS="-Wall -Wextra -fdiagnostics-color=always"'

# python
alias ppwd='export PYTHONPATH=$(pwd):$PYTHONPATH'

# cpu
alias cpuperf='sudo cpupower frequency-set --governor performance'
alias cpusave='sudo cpupower frequency-set --governor powersave'
