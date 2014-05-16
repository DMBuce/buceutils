alias screens='screen -ls'
alias screen='screen -d -RR'
alias x='startx'
alias hd='od -Ax -tx1z -v'
alias xp="xprop | egrep 'WM_WINDOW_ROLE|WM_CLASS|^WM_NAME'"
alias xcolors='grabc'
alias halt='poweroff'
#alias dum='du -m | sort -n'
#alias duh='du -h'
#alias collate='paste -d " "'
#alias tarball='tar -cvf -'
#alias untar='tar -xvf'
alias mplayer='mpv'

# limit the max number of processes
# prevents inadvertent fork bombs
ulimit -u 256

## bash completion rules
#complete -c man
#complete -cf sudo
#if [[ -f /etc/bash_completion ]]
#then
#    source /etc/bash_completion
#else
#    [[ -d /etc/bash_completion.d ]] && \
#    for file in /etc/bash_completion.d/*
#    do
#        source $file
#    done
#fi
#
## add bin directories to PATH
#alias sudo='sudo env PATH=${PATH}'
#
## make less compression-friendly
#if command -v lesspipe >/dev/null 2>&1
#then
#    eval "$(SHELL=/bin/sh lesspipe)"
#elif command -v lesspipe.sh >/dev/null 2>&1
#then
#    export LESSOPEN="|/usr/bin/lesspipe.sh %s"
#fi


## misc
#NO_COLOR='\[\e[0m\]' #disable any colors
## regular colors
#BLACK='\[\e[0;30m\]'
#RED='\[\e[0;31m\]'
#GREEN='\[\e[0;32m\]'
#YELLOW='\[\e[0;33m\]'
#BLUE='\[\e[0;34m\]'
#MAGENTA='\[\e[0;35m\]'
#CYAN='\[\e[0;36m\]'
#WHITE='\[\e[0;37m\]'
## emphasized (bolded) colors
#EBLACK='\[\e[1;30m\]'
#ERED='\[\e[1;31m\]'
#EGREEN='\[\e[1;32m\]'
#EYELLOW='\[\e[1;33m\]'
#EBLUE='\[\e[1;34m\]'
#EMAGENTA='\[\e[1;35m\]'
#ECYAN='\[\e[1;36m\]'
#EWHITE='\[\e[1;37m\]'
## underlined colors
#UBLACK='\[\e[4;30m\]'
#URED='\[\e[4;31m\]'
#UGREEN='\[\e[4;32m\]'
#UYELLOW='\[\e[4;33m\]'
#UBLUE='\[\e[4;34m\]'
#UMAGENTA='\[\e[4;35m\]'
#UCYAN='\[\e[4;36m\]'
#UWHITE='\[\e[4;37m\]'
## background colors
#BBLACK='\[\e[40m\]'
#BRED='\[\e[41m\]'
#BGREEN='\[\e[42m\]'
#BYELLOW='\[\e[43m\]'
#BBLUE='\[\e[44m\]'
#BMAGENTA='\[\e[45m\]'
#BCYAN='\[\e[46m\]'
#BWHITE='\[\e[47m\]'

