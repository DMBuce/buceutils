#!/bin/bash

# parse args
action="$1"
retval="$2"

# settings
CHECKMK_SNAPSHOTS_SPOOL="${CHECKMK_SNAPSHOTS_SPOOL-/var/lib/check_mk_agent/spool/$((3*24*60*60))_check_restic_snapshots}"
CHECKMK_SNAPSHOTS_WARN="${CHECKMK_SNAPSHOTS_WARN-10}"
CHECKMK_SNAPSHOTS_CRIT="${CHECKMK_SNAPSHOTS_CRIT-6}"
service=RESTIC_SNAPSHOTS 
spool="$CHECKMK_SNAPSHOTS_SPOOL"

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

# bail if we're not called after a backup
if [[ "$action" != backup ]]; then
	exit
fi

# figure out the number of snapshots created in the past day
yesterday="$(date -d -1day +%s)"
snaps=0
restic snapshots -H "$HOSTNAME" --json | jq -r .[].time | while read date; do
	snapdate="$(date -d "$date" +%s)"
	(( snapdate > yesterday && snaps++ ))
done

# figure out what value to return
retval=0
if (( snaps <= CHECKMK_SNAPSHOTS_CRIT )); then
	retval=1
elif (( snaps <= CHECKMK_SNAPSHOTS_WARN )); then
	retval=2
fi

# print output
perfdata="snapshots_1day=$snaps;$CHECKMK_SNAPSHOTS_WARN;$CHECKMK_SNAPSHOTS_CRIT"
check_mk "$retval" "$service" "$perfdata" "$snaps snapshots taken in the past 24hrs"

