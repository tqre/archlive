#!/bin/bash
# Script to build Salted Arch Linux iso files

set -e

display_help() {
echo "
Script for making Arch Linux bootable ISO-files with preconfigured salt-entities

Usage:
	./iso_make [option]

Options:
	master - make a salt-master iso-file
	minion - make a salt-minion iso-file
	
Example:
	./iso_make minion

Note: you need to be running Arch Linux with archiso and arch-install-scripts
installed.
"
}

if ! [[ $1 =~ ^(master|minion)$ ]]; then
	display_help
	exit
fi

#root_check() {
	#if [ $(id -u) != 0 ]; then
	#	echo "This script must be run as root."
	#	exit 1
	#fi
#}

#pwd_check() {
	#if [[ $PWD != */archlive ]]; then
	#	echo "Don't execute this script anywhere else than the cloned repo root!"
	#	echo "You'll end up with messed up file ownerships"
	#	exit 1
	#fi
#}

#cleanup() {
	#rm -v releng/airootfs/root/.zlogin
	#echo "Removing /work directory to have a clean build"
	#rm -rf work
#}

make_minion_iso_preconfig() {
	echo make minion iso
}
	#cp -v releng/alt_files/minion_zlogin releng/airootfs/root/.zlogin


make_master_iso_preconfig() {
	echo make master iso
}

# Do initial checks and preparations
#root_check
#pwd_check
#chown root:root ./ -R
#cleanup

make_$1_iso_preconfig

# Start the main iso-building script
#releng/build.sh -v

# Revert ownership back
#chown user:user ./ -R

# Move the iso file somewhere if needed
# TODO: add command line argument for this
#mv -v out/*.iso /home

# Comment this out to examine the built airootfs in work/
#cleanup


