#!/bin/bash

sender=$1
receiver=$2
message=$3
prev_input="init"
prev_input2="init"
msg="Ok. Command successfully executed"
msg2="Nok: Command was not executed."

#If no name provided
if [ $# -eq 0 ]; then
	echo  "nok: no identifier provided"
	if [[ "$msg2" != $prev_input2 ]]; then    #This sends the variable message to the "$id".pipe and back to the client to say the command did not work
		echo "$msg2" "No identifier provided" > "$1".pipe
			prev_input2=$msg2
	fi
	exit 1
fi

#Check that user and friend already exists - taken from first script
if [ ! -d "$sender" ] || [ ! -d "$receiver" ]; then
	echo "nok: user $sender or $receiver does not exist!"
	if [[ "$msg2" != $prev_input2 ]]; then    #This sends the variable message to the "$id".pipe and back to the client to say the command did not work
		echo "$msg2" "User $sender or $receiver does not exist" > "$1".pipe
			prev_input2=$msg2
	fi
	exit 1

fi

#Checking if sender and receiver are friends
if grep "^$receiver" "$sender"/Friends > /dev/null; then
	./P.sh "$receiver"_lock
	echo "$sender: $3" >> ~/COMP30640/Assignment1/$receiver/Wall
	echo "Ok: message sent."
	if [[ "$msg" != $prev_input ]]; then    #This sends the variable message to the "$1".pipe and back to the client
		echo "$msg" > "$1".pipe
			prev_input=$msg
	fi 
	./V.sh "$receiver"_lock
else
	echo "ERROR: user $sender is not a friend of user $receiver"
	if [[ "$msg2" != $prev_input2 ]]; then    #This sends the variable message to the "$1".pipe and back to the client to say the command did not work
		echo "$msg2" "User $sender is not a friend of user $receiver" > "$1".pipe
			prev_input2=$msg2
	fi
	exit 1
fi
exit 0
