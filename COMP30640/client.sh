#!/bin/bash

#trap control c and call control c
trap ctrl_c INT

function ctrl_c() {
	rm "$id".pipe
	exit 0
}

id=$1

#To check if parameters are given
if [ $# -eq 0 ]; then
	echo "nok: must enter a parameter"
	exit 1
fi

#Make the user pipe and send requests along the server pipe
mkfifo "$id".pipe
while true; do
read request argument1 argument2
	echo "Recieved request:" $request $id $argument1 $argument2
	echo "Now sending to server"
	echo $request $id $argument1 $argument2 > server.pipe
	read msg < "$id".pipe
	echo "$msg"

done
exit 0
	
