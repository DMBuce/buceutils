
command -v root &>/dev/null || return

alias root='root -l'

if [[ -d /usr/local/root && ! "$PATH" =~ /root(:|$) ]]; then
	export ROOTSYS=/usr/local/root
	export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${ROOTSYS}/lib
	pathmunge ${ROOTSYS}/bin
fi

