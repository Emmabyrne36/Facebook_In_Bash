The folder COMP30640 must be set up in the home directory.
Please copy and paste COMP30640 (which contains Assignment1 and the associated scripts) into your home directory.
The scripts must be run in the directory Assignment1 which is in the COMP30640 directory (~/COMP30640/Assignment1). 
To run the scripts.

Each script takes in parameters so they must be included when running the script.
This is also described in further detail in my report.
./create.sh takes in 1 parameter: $id
./add_friend.sh takes in 2 parameters: $id and $friend
./post_messages.sh takes in 3 parameters: $sender $receiver $message
./display_wall.sh takes in 1 parameter: $id
For example when running on terminal: 

./create.sh Emma - will create the user Emma
./add_friend.sh Emma Alan - will add Emma and Alan to each other's friends lists (assuming they are both users).
./post_messages.sh Emma Alan Hello - will send the message "Hello" to Alan's wall from Emma (assuming they are friends).
./display_wall.sh Alan - will display the messages on Alan's wall.

The server script is run on it's own and receives commands from the client.sh script
./server.sh

The client.sh script requires one parameter initially.
./client.sh Emma will set up Emma as the client and set Emma as $id
The script then will read commands from the user. And sends these commands to the server.sh script via a pipe
For example:
create - will send the command create to server.sh and will create the user Emma
add Alan - will send the command add to server.sh and add Emma and Alan to each other's friends list
post Alan Hello - send the command post to server.sh and will post a message to Alan's wall from Emma
display - will send the command display to server.sh and will display Emma's wall on the server.


