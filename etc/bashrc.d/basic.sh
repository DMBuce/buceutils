# additional basic functionality

# nothing too tricky here
alias -- -='cd -'
alias ..='cd ..;'
alias cd..='cd ..'
alias ls..='ls ..'
alias l='ls'
alias la='ls -A'
alias ll='ls -lh'
alias lla='ll -A'
alias cp='cp -iv'
alias mv='mv -iv'
alias -- --='exit'

# not all versions of rm support -I
if [[ "$(rm --help 2>/dev/null)" == *" -I "* ]]; then
	alias rm='rm -Iv'
else
	alias rm='rm -iv'
fi

