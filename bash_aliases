# shell command
alias rmi='rm -i'
alias mvi='mv -i'
alias cpi='cp -i'
alias grep='grep --color -n'
alias ll='ls -lh'
alias lm='ls -al | more'
alias eecho='echo -e'
alias tmux='tmux -2'

# programs
alias sb='subl'
alias pg='ping www.google.com'
alias ev='evince'
alias xo='xdg-open'
alias xoo='xdg-open .'
alias bp='bpython'
alias pc='pcmanfm'
alias df='df -Th'
alias matlabnd='matlab -nodesktop -nosplash'
alias sup='sudo apt-get update'
alias sug='sudo apt-get upgrade'
alias dstat='dstat -cdlmnpsy'

# git
alias g='git'
alias groot='cd "$(git rev-parse --show-toplevel)"'
alias gst='git status'
alias gba='git branch -a'

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
alias vbfn='vim ~/.bash_functions'
alias virc='vim ~/.inputrc'
alias vtmc='vim ~/.tmux.conf'
alias vbdl='vim ~/.bundles'
alias vgcf='vim ~/.gitconfig'
alias vgin='vim ~/.gitignore'

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
alias rosl='roslaunch'
alias rost='rostopic'
alias rosm='rosmsg'
alias rosr='rosrun'
alias rosp='rospack'
alias rosm='rosmake'
