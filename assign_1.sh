#!/bin/bash
#Script to check the validity of password
#Rules
#1.Password must be 8-12 characters long.
#2.User will be requested to re-enter the password to avoid typing mistakes. Both the passwords must match
#3.Password must contain alphanumeric characters only
#4.Password must not be same as username
#5.Three un-successful attempts.

#Begin Script

#Use of variables
count=0
usrnm=$USER
while [ $count -lt 3 ]
do 
#Use of User inputs
echo -n "Enter pwd :"
read -s pwd_1
echo  -ne "\nRe-enter pwd :"
read -s pwd_2
echo $pwd_1
echo $pwd_2
#Calculate length of pwd
pwd_len=`echo $pwd_1|wc -c`
pwd_len=$((pwd_len - 1))
if [ $pwd_1 != $pwd_2 ]
then
   echo -e "\nPasswords do not match. Please try again.\n"
   count=$((count + 1))
elif [ $pwd_len -lt 8 ] || [ $pwd_len -gt 12 ]
then
   echo -e "\nPassword entered does not meet length requirements: Password must be 8-12 characters long. Please try again.\n"
   count=$((count + 1))
elif [ $pwd_1 == $usrnm ]
then
   echo -e "\nPassword entered matches username. Please try again.\n"
   count=$((count + 1))
#Usage of Regular expressions
elif [[ $pwd_1 =~ [^0-9A-Za-z]+ ]]
then
   echo -e "\nPassword entered contains non-alphanumeric character/s. Please try again.\n"
   count=$((count + 1))
else
   echo -e "\nPassword valid.\n"
   exit 0
fi
done

#Script prompts and aborts when maximum un-successful attempts are made.
if [ $count -eq 3 ]
then
   echo -e "\nExceeded maximum number of un-successful attempts to enter password.\n"
   exit 0
fi

#End Script
