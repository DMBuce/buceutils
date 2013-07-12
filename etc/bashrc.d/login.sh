
# skip if this isn't a login shell
[[ "${0::1}" == "-" ]] || return

which fortune &>/dev/null && fortune -as

