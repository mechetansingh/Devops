#!/bin/bash


echo "Installing NGINX on your Remote Server"
echo "Checking your Distribution"
sleep 2
echo "Really want to Install? If yes press 1"
read cond
if [ $cond == 1 ];
then
if [ `cat /etc/os-release | grep ^NAME | grep Ubuntu` ] || [ `cat /etc/os-release | grep ^NAME | grep Debian` ];
then
	sudo apt update
	sudo apt install nginx
elif [`cat /etc/os-release | grep ^NAME | grep Red` ] || [ `cat /etc/os-release | grep ^NAME | grep CentOS` ] || [ `cat /etc/os-release | grep ^NAME | grep Fedora` ];
then
	sudo yum install epel-release
	sudo yum update
	sudo yum install nginx
else
	sudo pacman -Syu
	sudo pacman -S nginx
fi
fi
if [ $cond == 1 ];
then
	echo "Installed Successfully"
else
	echo "Pagal hai kya kyu nahi krna"
fi


