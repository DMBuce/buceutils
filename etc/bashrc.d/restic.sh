
if [[ $EUID == 0 && -f /etc/resticbackup.d/config ]]; then
	set -a
	. /etc/resticbackup.d/config
	set +a
fi

