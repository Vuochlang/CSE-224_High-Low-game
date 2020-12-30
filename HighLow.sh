#!/bin/bash
############################################################################################################################################################
# Name: Vuochlang Chang
# Class: CSE224 Fall2019 2530
# Date: 10/21/2019
# Assignment: PA3, High/Low game
# This is a High/Low game between user and the computer. The game starts by letting user showing a number in a given rank. Then the computer
# will start to guess the number by rounding up and down according to the user response. If the user types h, then the number must be above the guessing
# number and the computer will start guessing again. If the user types l, then the number must be below the guessing number and the computer will start
# guessing again as well. The game is over if the user types c for correct or when the user is cheating.
############################################################################################################################################################
if [[ "$1" -gt 0 ]]	#check if there is a valid input from the command
then
	high=$1		#set high to the value of that input
else
	high=100	#set high to 100 if nothing has been entered
fi

low=1			#initialize low to 1

echo "Welcome to High and Low game!"
echo "You will choose a number in the given range and I will try my best to guess the number."
echo "We will begin the game between 1 and $high!"				#Instruction description of the game

echo "You will be using 3 keys to continue the game: "				#Explain the meaning of each keypress for the game
echo "   _Press 'h' if the number guessed is higher than your chosen number"
echo "   _Press 'l' if the number guessed is lower than your chosen number"
echo "   _Press 'c' if the number guessed is the same as your chosen number"

echo "Please choose a number between (1 - $high), and press any key when you are ready to begin the game!"
read -s -n 1 press
#waiting for user to choose a number and press anykey to start

count=0		#represent and initialize number of guess to 0
flag=1		#initialize the value of flag

while [[ flag==1 ]]	#create infinite loop using flag
do
	guess=$(((high+low)/2))		#calculate the number that computer will guess
	count=$((count+1))		#increase the value of count by 1 each time the Computer guessed
	printf "Is this your number $guess ?"		#Ask if this is the user number
	read -n 1 keypress				#waiting for user to press 'h' or 'l' or 'c'
	echo ""

	if [[ "$keypress" == "c" ]]	#if user pressed 'c'
	then
		echo "Your number is $guess."		#print out the outpur of the game which is the number that user chose
		echo "Number of guesses is $count."	#print out the number of times that Computer guessed
		echo "Thank you for playing the game. Goodbye!"
		exit
	elif [[ "$keypress" == "h" ]]	#if user pressed 'h'
	then
		high=$((guess-1))	#change the value of high to the guessed number minus one
	elif [[ "$keypress" == "l" ]]	#if user pressed 'l'
	then
		low=$((guess+1))	#change the value of low to the guessed number plus one
	else
		echo "You must select 'h' or 'l' or 'c'."	#print this and ask user to presse the correct key
	fi

	if [[ "$high" -lt "$low" ]]	#detect the cheating by comparing if the value of high is less than the value of low
	then
		echo "That's cheating!! Goodbye."     #leave the game when the user cheats
	#	echo "Number of guesses is $count."	#print out number of count
		exit
	fi
done