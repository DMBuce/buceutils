
export EDITOR="vim"
export HISTCONTROL="ignoreboth"

[[ "$PS1" == '[\u@\h \W]\$ ' ]] && export PS1='\u@\h:\W\$ '

for DIR in /usr/kerberos/sbin /sbin /usr/sbin /usr/local/sbin ~/bin
do
	pathmunge "$DIR"
done
unset DIR
export PATH

