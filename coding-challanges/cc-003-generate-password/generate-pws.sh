#!/bin/bash

#Coding Challenge - 03: Generate Password

echo "Coding Challenge - 03: Generate Password"
read -p "Enter the password lenght: " PASS_LENGTH

    # openssl rand -base64 48 | tr -dc A-Za-z0-9 | cut -c1-$PASS_LENGTH
    #-base64 option is used for encoding the output.
    #-base64(Encode) 48 is length 
    #cut is for user input column -c1 is column1
password=$(openssl rand -base64 400 | tr -dc A-Za-z0-9 | cut -c1-$PASS_LENGTH)
echo $password