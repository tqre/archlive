#!/bin/bash
# Script to build minion iso-file

# Run as root check
if [ $(id -u) != 0 ]; then
	echo "This script must be run as root."
	exit 1
fi

# Check the working directory
if [[ $PWD != */archlive ]]; then
	echo "Don't execute this script anywhere else than the cloned repo root!"
	echo "You'll end up with messed up file ownerships"
	exit 1
fi

# Change ownership
chown root:root ./ -Rv

# Move the minion loginscript to right place
cp -v alt_files/minion_zlogin airootfs/root/.zlogin

# Start the main iso-building script
./build.sh -v

# Revert ownership back
#chown user:user ./ -Rv

# Move the iso file somewhere if needed
#mv -v out/*.iso /home

# Clean up
rm -v /releng/airootfs/root/.zlogin
echo "Removing /work directory to have clean build next time..."
rm -rf /work
