#!/bin/bash
read -p "Enter Casino Game i.e BlackJack, Roulette or Texas Holdem' :" Game
if  [ $Game = "Roulette" ]
then
read -p "Enter a date (mmdd): " user_date
read -p "What time are you looking for in hh:mm:ss AM/PM? e.g 05:00:00 AM: " user_time
awk '{print $1 " " $2 "::::" $3 "  " $4 }' ${user_date}_Dealer_schedule |  grep "$user_time" 
elif [ $Game = "Blackjack" ]
then
read -p "Enter a date (mmdd): " user_date
read -p "What time are you looking for in hh:mm:ss AM/PM? e.g 05:00:00 AM: " user_time
awk '{print $1 " " $2 "::::" $5 "  " $6 }' ${user_date}_Dealer_schedule |  grep "$user_time" 
else [ $Game = "Texas Holdem" ]
read -p "Enter a date (mmdd): " user_date
read -p "What time are you looking for in hh:mm:ss AM/PM? e.g 05:00:00 AM: " user_time
awk '{print $1 " " $2 "::::" $7 "  " $8 }' ${user_date}_Dealer_schedule |  grep "$user_time" 
fi

