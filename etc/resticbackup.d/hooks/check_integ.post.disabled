#!/bin/bash

# parse args
action="$1"
retval="$2"

# settings
CHECKMK_INTEGRITY_SPOOL="${CHECKMK_INTEGRITY_SPOOL-/var/lib/check_mk_agent/spool/$((8*24*60*60))_check_restic_integrity}"
service=RESTIC_INTEGRITY 
spool="$CHECKMK_INTEGRITY_SPOOL"

# send a message to check_mk's spool file
check_mk() {
	local retval="$1"
	local perfdata="$2"
	shift 2
	local message="$*"

	# create monitoring directory if it doesn't exist
	mkdir -p "$(dirname "$spool")"

	# update spool file
	echo "<<<local>>>" > "$spool"
	echo "$retval $service $perfdata $message" >> "$spool"
}

# bail if we're not called after a prune
if [[ "$action" != prune ]]; then
	exit
fi

# remove `restic check` cache dirs so that /tmp doesn't fill up
# https://forum.restic.net/t/restic-0-9-0-check-fills-up-my-tmp-partition/679
rm -rf /tmp/restic-check-cache-*

# check repo for errors
if restic check | grep -q 'no errors were found'; then
	check_mk 0 - "No errors found in integrity check"
else
	check_mk 1 - "Integrity check failed"
fi

