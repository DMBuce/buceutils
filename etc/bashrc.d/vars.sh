
export EDITOR="vim"
export HISTCONTROL="ignoreboth"

[ "$PS1" == '[\u@\h \W]\$ ' ] && export PS1='\u@\h:\W\$ '

for DIR in /usr/kerberos/sbin /sbin /usr/sbin /usr/local/sbin
do
	if ! echo $PATH | /bin/egrep -q "(^|:)$DIR($|:)" ; then
		PATH=$PATH:$DIR
	fi
done
export PATH

# screws up bash history
#parser_state() {
#  local CMD="$(history | tail -n1)"
#  local N=$(echo "$CMD" | egrep -wo "done|fi|esac" | wc -l)
#  echo $(echo "$CMD" | egrep -wo "if|while|for|case|select" | head -n -$N)
#}
#
#PS2='$(parser_state)> '

