
# figure out whether the term supports colors
case "$TERM" in
  xterm*)
	export TERM=xterm-256color
  ;;
  linux|screen|rxvt*)
	# do nothing
  ;;
  *)
	echo Not enabling colors for TERM = $TERM >&2
	return
  ;;
esac

case "$(uname -r)" in
  Darwin) alias ls='ls -G' ;;
  *)      alias ls='ls --color=auto' ;;
esac

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

which colordiff &>/dev/null && alias diff='colordiff'
alias less='less -r'

if which dircolors &>/dev/null; then
	eval "`dircolors -b`"
fi

ME='\u'
HOST='\h'
DIR='\W'
PROMPT_COLOR='\[\e[1;32m\]'
HAPPY_COLOR='\[\e[0\;33m\]'
SAD_COLOR='\[\e[0\;36m\]'
END_COLOR='\[\e[0m\]'
#FACE="\`if [ \$? = 0 ]; then echo ${HAPPY_COLOR}\^_\^${END_COLOR}; else echo ${SAD_COLOR}T_T${END_COLOR}; fi\`"
FACE="\`[ \$? = 0 ] && echo ${HAPPY_COLOR}\^_\^${END_COLOR} || echo ${SAD_COLOR}T_T${END_COLOR}\`"
if [ "`whoami`" == "root" ]
then
	export PS1='\[\e[1;31m\]\u@\h\[\e[0m\]:\W\$ '
else
	export PS1="${FACE} ${PROMPT_COLOR}${ME}@${HOST}${END_COLOR}:${DIR}\\$ "
fi
unset ME HOST DIR PROMPT_COLOR HAPPY_COLOR SAD_COLOR END_COLOR FACE

