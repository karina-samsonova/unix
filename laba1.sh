#!/bin/bash
echo Choose your item: rock, paper or scissors. Print otpustite to stop.
read users_item
while [[ $users_item != "otpustite" ]]
do
	ch=$(expr $RANDOM % 100)
	if [[ $ch -lt 17 ]]
	then
		echo Im cheating
	fi
	if [[ $users_item = "rock" && $ch -lt 17 ]]
	then
		echo You had rock and I had paper, so I won
	elif [[ $users_item = "paper" && $ch -lt 17 ]]
	then
		echo You had paper and I had scissors, so I won
	elif [[ $users_item = "scissors" && $ch -lt 17 ]]
	then
		echo You had scissors and I had rock, so I won
	fi
	my_item=$(expr $RANDOM % 3)
	if [[ $my_item -eq 0 && $ch -ge 17 ]]
	then
		my_item=rock
	elif [[ $my_item -eq 1 && $ch -ge 17 ]]
	then
		my_item=paper
	elif [[ $my_item -eq 2 && $ch -ge 17 ]]
	then
		my_item=scissors
	fi
	if [[ $ch -ge 17 ]]
	then
		echo Im not cheating
	fi
	if [[ $users_item = "rock" && $my_item = "rock" ]]
	then
		echo You had rock and I had rock, so we are equal
	elif [[ $users_item = "rock" && $my_item = "paper" ]]
	then
		echo You had rock and I had paper, so I won
	elif [[ $users_item = "rock" && $my_item = "scissors" ]]
	then
		echo You had rock and I had scissors, so you won
	elif [[ $users_item = "paper" && $my_item = "rock" ]]
	then
		echo You had paper and I had rock, so you won
	elif [[ $users_item = "paper" && $my_item = "paper" ]]
	then
		echo You had paper and I had paper, so we are equal
	elif [[ $users_item = "paper" && $my_item = "scissors" ]]
	then
		echo You had paper and I had scissors, so I won
	elif [[ $users_item = "scissors" && $my_item = "rock" ]]
	then
		echo You had scissors and I had rock, so I won
	elif [[ $users_item = "scissors" && $my_item = "paper" ]]
	then
		echo You had scissors and I had paper, so you won
	elif [[ $users_item = "scissors" && $my_item = "scissors" ]]
	then
		echo You had scissors and I had scissors, so we are equal
	fi	
	echo Choose your item: rock, paper or scissors. Print otpustite to stop.
	read users_item
done
