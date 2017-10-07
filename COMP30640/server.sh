#!/bin/bash

#Checks if server.pipe exists. If it does then do nothing. If it doesn't then it creates the pipe
#from http://stackoverflow/questions/17583578/what-command-means-do-nothing-in-a-conditional-in-bash
if [ -e server.pipe ]; then
	:
else
	mkfifo server.pipe
fi

#use read then echo then command then server
while true; do
read request id argument1 argument2 < server.pipe
echo "Received $request $id $argument1 $argument2 from pipe"
echo "Forwarding request now"

#Remove comment below (and comment out the two lines above) to get the script to run on on the terminal without the use of the client script sending commands along the pipe
#read request id argument1 argument2 
case "$request" in 
	create)
		./create.sh "$id"
	;;
	add)
		./add_friend.sh "$id" "$argument1"
	;;
	post)
		./post_messages.sh "$id" "$argument1" "$argument2"
	;;
	display)
		./display_wall.sh "$id"
	;;
	*)
		echo "usage: $0 {create|add|display|post}"
		exit 1
esac
done
