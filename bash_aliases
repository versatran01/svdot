# shell command
alias rmi='rm -i'
alias mvi='mv -i'
alias cpi='cp -i'
alias grep='grep --color -n'
alias ll='ls -lh'
alias lm='ls -al | more'
alias eecho='echo -e'

# programs
alias pg='ping www.google.com'
alias ev='evince'
alias xo='xdg-open'
alias bp='bpython'
alias pc='pcmanfm'
alias df='df -Th'
alias matlabnd='matlab -nodesktop -nosplash'

# ssh
alias eniac='ssh -X quchao@eniac.seas.upenn.edu'
alias biglab='ssh -X quchao@biglab.seas.upenn.edu'
alias mrsl='ssh -X chao@192.168.129.221'
alias rdesk='rdesktop vlab-rdp.seas.upenn.edu'

# bash, vim 
alias sbrc='source ~/.bashrc'
alias vbrc='vim ~/.bashrc'
alias vvrc='vim ~/.vimrc'
alias vbal='vim ~/.bash_aliases'

# fasd
alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias z='fasd_cd -d'     # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # cd with interactive selection
alias v='f -e vim'       # quick opening files with vim
alias m='f -e mplayer'   # quick opening files with mplayer
alias o='a -e xdg-open'  # quick opening files with xdg-open

#cd
alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
alias cd.....='cd ../../../..'
alias cd......='cd ../../../../..'

#nanoplus
alias nanoplus20='ssh root@192.168.129.77'
alias nanoplus21='ssh root@192.168.129.78'
alias uri_nanoplus='export ROS_MASTER_URI=http://192.168.129.77:11311;echo $ROS_MASTER_URI'
alias uri_local='export ROS_MASTER_URI=http://localhost:11311;echo $ROS_MASTER_URI'
alias ros_var='env | grep ROS_'
alias ros_hydro='source /opt/ros/hydro/setup.bash'
alias ros_groovy='source /opt/ros/groovy/setup.bash'
alias ros_path="ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:/home/chao/Dropbox/Research/ros"
