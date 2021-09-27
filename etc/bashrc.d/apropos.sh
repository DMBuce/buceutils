
# slow but global man page search
apropos() {
	local section manpage
	while read section manpage; do
		whatis -s "$section" "$manpage"
	done < <(man -wK "$@" | sed -r 's|.*/(.*)\.([^.]*)\.[^.]*$|\2 \1|') \
		| awk '!x[$0]++'
}

