#!/bin/bash

id=$1
prev_input="init"
prev_input2="init"
msg="Ok. Command successfully executed"
msg2="Nok: Command was not executed."


#If no name provided
if [ $# -eq 0 ]; then
	echo  "nok: no identifier provided"
	if [[ "$msg2" != $prev_input2 ]]; then    #This sends the variable message2 to the "$id".pipe and back to the client to say that the command did not work
		echo "$msg2" "No identifier provided" > "$id".pipe
			prev_input2=$msg2
	fi
	exit 1
#If user already exists
elif [ -d "$id" ]; then
	echo "nok: user already exists"
	if [[ "$msg2" != $prev_input2 ]]; then    #This sends the variable message2 to the "$id".pipe and back to the client to say that the command did not work
		echo "$msg2" "User already exists" > "$id".pipe
			prev_input2=$msg2
	fi
	exit 1
fi 

#some ideas taken from stackoverflow.com/questions/22911144/shell-script-make-directory-if-it-doesnt-exist

if [ ! -d "$id" ]; then
	./P.sh "$id"_lock
	echo "User does not exist. Creating now."
	mkdir ~/COMP30640/Assignment1/$id
	touch ~/COMP30640/Assignment1/$id/Friends
	touch ~/COMP30640/Assignment1/$id/Wall
	echo "Ok: user created!"
	if [[ "$msg" != $prev_input ]]; then    #This sends the variable message to the "$id".pipe and back to the client
		echo "$msg" > "$id".pipe
			prev_input=$msg
	fi
	./V.sh "$id"_lock
fi
exit 0







