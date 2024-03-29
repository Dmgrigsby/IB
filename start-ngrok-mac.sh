#!/bin/sh

logfile=ngrok.log

# start ngrok proxy -- requires paid account if you want a fixed subdomain
subd=`grep ngrok-subdomain config.txt |awk '{print $2}'`

while true; do
	echo --------------------------------- |tee -a $logfile
	date |tee -a $logfile
	echo Starting up |tee -a $logfile
	if [ "$subd" = "" ] ; then
		ngrok http 6000
	else
		ngrok http --subdomain=$subd 6000
	fi
	echo Restarting in 5s |tee -a $logfile
	sleep 5
done

