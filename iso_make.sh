#!/bin/bash
# Script to build Salted Arch Linux iso files

display_help() {
	echo "Script for making Arch Linux bootable ISO-files with"
	echo "preconfigured salt-entities."
	echo
	echo "Usage:"
	echo "  ./iso_make [option]"
	echo
	echo "Options:"
	echo "  master - make a salt-master iso-file"
	echo "  minion - make a salt-minion iso-file"
	echo 
	echo "Example:"
	echo "  ./iso_make minion"
	echo 
	echo "Note: you need to be running Arch Linux with archiso and"
	echo "arch-install-scripts installed."
}

if [[ "$1" != "master" ]] && [[ "$1" != "minion" ]]; then
	display_help
	exit
fi

root_check() {
	#if [ $(id -u) != 0 ]; then
	#	echo "This script must be run as root."
	#	exit 1
	#fi
}

pwd_check() {
	#if [[ $PWD != */archlive ]]; then
	#	echo "Don't execute this script anywhere else than the cloned repo root!"
	#	echo "You'll end up with messed up file ownerships"
	#	exit 1
	#fi
}

cleanup() {
	#rm -v releng/airootfs/root/.zlogin
	#echo "Removing /work directory to have a clean build"
	#rm -rf work
}

make_minion_iso_preconfig() {
	#cp -v releng/alt_files/minion_zlogin releng/airootfs/root/.zlogin
	echo make minion iso
}

make_master_iso_preconfig() {
	echo make master iso
}

# Do initial checks and preparations
root_check
pwd_check
chown root:root ./ -R
cleanup

if [ "$1" == "minion" ]; then
	make_minion_iso_preconfig
elif [ "$1 == "master" ]; then
	make_master_iso_preconfig
fi

# Start the main iso-building script
#releng/build.sh -v

# Revert ownership back
#chown user:user ./ -R

# Move the iso file somewhere if needed
# TODO: add command line argument for this
#mv -v out/*.iso /home

# Comment this out to examine the built airootfs in work/
#cleanup


