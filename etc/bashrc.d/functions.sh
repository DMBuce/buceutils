# shell functions

pathmunge () {
	local dir="$1"

	if [ -d "$dir" ] && \
	   ! echo "$PATH" | egrep -q "(^|:)$dir($|:)"; then
		if [ "$2" = "before" ]; then
			PATH="$dir:$PATH"
		else
			PATH="$PATH:$dir"
		fi
	fi
}

