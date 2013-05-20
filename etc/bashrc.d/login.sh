
# skip if this isn't a login shell
[[ "${0::1}" == "-" ]] || return

which fortune &>/dev/null && fortune -as

if [[ "$PS1" != "" ]] && which keychain &>/dev/null; then
	eval $(keychain --eval --clear --quiet $HOME/.ssh/id_*sa)
fi

