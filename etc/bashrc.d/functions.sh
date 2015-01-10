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

