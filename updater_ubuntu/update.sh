#!/bin/bash
#Acesta este un script de update
#Version 1.0
st2="\033[91;40m"
st="\033[92m"
n="\033[0m"
if
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
sudo apt-get install -y
sudo apt-get autoremove
sudo apt-get clean
then
clear
echo -e "$st The update finished perfectly $n"
else
echo -e "$st2 The update encountered an error $n"
fi 
 
