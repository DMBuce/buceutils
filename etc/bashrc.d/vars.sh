
export EDITOR="vim"
export HISTCONTROL="ignoreboth"

[[ "$PS1" == '[\u@\h \W]\$ ' ]] && export PS1='\u@\h:\W\$ '

for dir in /usr/kerberos/sbin /sbin /usr/sbin /usr/local/sbin ~/bin
do
	pathmunge "$dir"
done
unset dir
export PATH

