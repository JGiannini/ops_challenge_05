#!/bin/bash

# Script Name: Ops Challenge Loops
# Class Name: Ops 201
# Author Name: Jamie Giannini
# Date of last revision: 2/22/2021
# Description of purpose: Practice bash scripting and Git using loops

# Objectives:
# [X] Write a script that displays running processes
# [X] Ask the user for a PID
# [X] Kill the process with that PID
# [X] Use a loop

echo -e "\nWelcome to Process Chomper!" #Fancy program title


function run_program () {
while true #setting to true kicks off my while loop without needing any initial input 
do
    echo -e "\nMake a selection:\n[1] View all Processes\n[2] Kill a Process\n[3] View log\n[4] Clear Log\n[5] Exit Program"
    read -r user_input #reads user response
    if [ "$user_input" == 1 ] #series of if/else if statements to check for input
        then
        command ps aux #prints system processes, -a shows processes for all users, -u shows the processes owner/user, -x show processes not attached to the terminal 
    elif [ "$user_input" == 2 ]
        then
        echo "Which process would you like to kill? Enter the number below:"
        read -r pid #reads process number input from user
        command kill -9 "$pid" #kills the process , -9 is important here for actually ending it
        echo "You killed Process $pid. It has been added to the log" #Just giving some user feedback
        echo "Process $pid" >> kill_log.txt #For handy dandy reference I decided to print the killed processes to a log
    elif [ "$user_input" == 3 ]
        then
        command nano kill_log.txt #I thought it would be helpful to be able to easily view the log
    elif [ "$user_input" == 4 ]
        then
        echo "Kill log has been cleared"
        command cat /dev/null > kill_log.txt #This command clears the contents of the log
    elif [ "$user_input" == 5 ]
        then
        echo "Cya later alligator!" #ASCII fun to end the Process Chomper program!
        echo "           .-._   _ _ _ _ _ _ _ _
.-''-.__.-'00  '-' ' ' ' ' ' ' ' '-.
'.___ '    .   .--_'-' '-' '-' _'-' '._
 V: V 'vv-'   '_   '.       .'  _..' '.'.
   '=.____.=_.--'   :_.__.__:_   '.   : :
           (((____.-'        '-.  /   : :
                             (((-'\ .' /
                           _____..'  .'
                          '-._____.-'"
        break #This breaks us out of the loop when exit command is initiated
    else
        echo -e "\nInvalid selection, please try again!" #I added this to help catch any selection typos
    fi
done
}

run_program #Kicks off our function


#Credit to Shanaka Dias for the ASCII Alligator, source: https://www.asciiart.eu/animals/reptiles/alligators