#!/bin/bash

id=$1
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


if [ ! -d "$id" ]; then
	echo "nok: user $id does not exist!"
	if [[ "$msg2" != $prev_input2 ]]; then    #This sends the variable message to the "$id".pipe and back to the client to say the command did not work
		echo "$msg2" "User $id does not exist" > "$1".pipe
			prev_input2=$msg2
	fi
#Ideas for the code to get wall to display adapted from superuser.com/questions.112316/what-is-the-shell-command-to-display-contents-of-a-file
else
	echo "Start_of_file."
	echo	
	cat ~/COMP30640/Assignment1/$id/Wall #cat in this instance reads the contents of the file - here it will read the contents of $id's wall (idea obtained from www.linfo.org/cat.html)
	echo
	echo "End_of_file"
	if [[ "$msg" != $prev_input ]]; then    #This sends the variable message to the "$1".pipe and back to the client
		echo "$msg" > "$1".pipe
			prev_input=$msg
	fi
fi

exit 0


