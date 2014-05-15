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

