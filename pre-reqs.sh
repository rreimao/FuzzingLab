#!/bin/bash

## verifying if the user is root
if [ "$EUID" -ne 0 ]
then echo "Please run as root"
	exit
fi

## basic update/upgrade
apt-get update
apt-get upgrade

## installing the tools
apt-get install -y git
apt-get install -y ffuf

## downloading wordlists
git clone https://github.com/danielmiessler/SecLists /home/user/Desktop/SecLists

## setting file permissions
chown -R user:user /home/user/Desktop/SecLists


echo "--------------------"
echo "-- SETUP COMPLETE --"
echo "--------------------"
