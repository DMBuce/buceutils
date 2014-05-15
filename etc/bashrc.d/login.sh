
# skip if this isn't a login shell
[[ "$0" == -* ]] || return

command -v fortune &>/dev/null && fortune -as

