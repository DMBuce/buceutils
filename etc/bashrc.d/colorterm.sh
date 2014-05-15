
# figure out whether the term supports colors
case "$TERM" in
  xterm*)
	export TERM=xterm-256color
  ;;
  linux|screen*|rxvt*)
	# do nothing
  ;;
  *)
	echo Not enabling colors for TERM = $TERM >&2
	return
  ;;
esac

case "$(uname -s)" in
  Darwin) alias ls='ls -G' ;;
  *)      alias ls='ls --color=auto' ;;
esac

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

command -v colordiff &>/dev/null && alias diff='colordiff'
alias less='less -r'

if command -v dircolors &>/dev/null; then
	eval "`dircolors -b`"
fi

if [[ "$USER" == "root" ]]; then
	export PS1='\[\e[1;31m\]\u@\h\[\e[0m\]:\W\$ '
else
	prompt-command() {
		if (( $? )); then
			local FACE='\[\e[0;36m\]T_T\[\e[0m\]'
		else
			local FACE='\[\e[0;33m\]^_^\[\e[0m\]'
		fi

		local ME HOST DIR PROMPT_COLOR END_COLOR

		ME='\u'
		HOST='\h'
		DIR='\W'
		PROMPT_COLOR='\[\e[1;32m\]'
		END_COLOR='\[\e[0m\]'
		export PS1="${FACE} ${PROMPT_COLOR}${ME}@${HOST}${END_COLOR}:${DIR}\\$ "
	}
	export PROMPT_COMMAND="prompt-command; ${PROMPT_COMMAND#prompt-command; }"
fi

