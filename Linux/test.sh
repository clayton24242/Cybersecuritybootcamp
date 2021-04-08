#!/bin/bash
read -p "Enter a date (dd-mm-yyyy): " user_date
if date=$(date -d "$user_date" +'+%d-%m-%Y'); then 
  # user date was ok
  echo $date
