#!/bin/bash

id=$1
friend=$2
prev_input="init"
prev_input2="init"
msg="Ok. Command successfully executed"
msg2="Nok: Command was not executed."

#If no name provided
if [ $# -eq 0 ]; then
	echo  "nok: no identifier provided"
	if [[ "$msg2" != $prev_input2 ]]; then    #This sends the variable message to the "$id".pipe and back to the client to say the command did not work
		echo "$msg2" "No identifier provided" > "$id".pipe
			prev_input2=$msg2
	fi
	exit 1
fi

#Check that user and friend already exists - taken from first script
if [ ! -d "$id" ]; then
	echo "nok: user $id does not exist!"
	if [[ "$msg2" != $prev_input2 ]]; then    #This sends the variable message to the "$id".pipe and back to the client to say the command did not work
		echo "$msg2" "User $id does not exist!" > "$id".pipe
			prev_input2=$msg2
	fi
	exit 1

elif [ ! -d "$friend" ]; then
	echo "nok: User $friend does not exist!"
	if [[ "$msg2" != $prev_input2 ]]; then    #This sends the variable message to the "$id".pipe and back to the client to say the command did not work
		echo "$msg2" "User $friend does not exist!" > "$id".pipe
			prev_input2=$msg2
	fi
	exit 1
else
	echo "Ok: user and friend exists"
fi 

#Adding user (id) to friend and also adding friend to user (id)
#Some ideas adapted from askubuntu.com/questions/21555/command-to-append-line-to-a-text-file-without-opening-an-editor
if grep "^$friend" "$id"/Friends > /dev/null; then
	echo "You are already friends"
	if [[ "$msg2" != $prev_input2 ]]; then    #This sends the variable message2 to the "$id".pipe and back to the client to say the command did not work
		echo "$msg2" "You are already friends" > "$id".pipe
			prev_input2=$msg2
	fi
	exit 1 
else
	./P.sh "$id lock"
	echo "Ok: $id and $friend are now friends"
	echo "$friend" >> ~/COMP30640/Assignment1/$id/Friends
	echo "$id" >> ~/COMP30640/Assignment1/$friend/Friends
	if [[ "$msg" != $prev_input ]]; then    #This was to try and send the variable message to the "$id".pipe and back to the client
		echo "$msg" > "$id".pipe
			prev_input=$msg
	fi
	./V.sh "$id lock"
fi
exit 0
