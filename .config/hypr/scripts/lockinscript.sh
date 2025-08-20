#!/bin/bash
LOCKFILE="/tmp/lockdown_start"
PIDFILE="/tmp/lockdown_pid"

# check if another instance is already running
if [ -f "$PIDFILE" ] && kill -0 $(cat "$PIDFILE") 2>/dev/null; then
    notify-send "Already locked in!"
    exit 0
fi

# save current PID and timestamp
echo $$ > "$PIDFILE"
date +%s > "$LOCKFILE"

notify-send "LOCK IN" "No more distractions!"


while true; do
    pkill discord
    pkill vesktop
    pkill steam
    pkill lutris
    pkill firefox
    pkill -f AppRun.wrapped
    sleep 1
done
