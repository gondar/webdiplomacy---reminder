#!/bin/bash
#Workaround for cron not available on our server.
while true
do
	echo "Press [CTRL+C] to stop.."
	./webdiplomacy.sh
	sleep 600
done
