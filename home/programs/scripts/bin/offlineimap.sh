#!/usr/bin/env bash

/usr/bin/nm-online || exit

offlineimap -a eugen228228 & pid1=$!
offlineimap -a yevhen.shymotyuk & pid2=$!

wait $pid1
wait $pid2
echo "Last execution: $(date)"
