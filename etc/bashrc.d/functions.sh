# shell functions

pathmunge () {
	local dir="$1"

	if [[ -d "$dir" && ! "$PATH" =~ (^|:)"$dir"(:|$) ]]; then
		if [[ "$2" == "before" ]]; then
			PATH="$dir:$PATH"
		else
			PATH="$PATH:$dir"
		fi
	fi
}

..() {
	cd "${PWD%/$1/*}/$1" 2>/dev/null || \
		printf "Could not find %s in working directory path: %s\n" "$1" "$PWD" >&2
}

_dotdot_complete() {
	(( COMP_CWORD > 1 )) && return
	local dirname="${PWD%/*}"
	IFS=$'\n' COMPREPLY=(
		$(IFS=/ compgen -W "${dirname:1}" -- "${COMP_WORDS[COMP_CWORD]}")
	)
}

complete -F _dotdot_complete ..

