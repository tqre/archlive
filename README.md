# Live Arch Linux, saltstack ready
Custom Live Arch Linux ISO on a usb stick
and configuring Saltstack into it to have ad-hoc minions on class machines.

https://wiki.archlinux.org/index.php/Archiso

## Journal:

### Making the first image:

All files inside /releng/airootfs should be owned by root when creating the
image.


	$ su
	# chown root:root -R ~/archlive/releng/
	# ~/archlive/releng/build.sh -v

Now put the image on a stick:

	# wipefs ..all /dev/sdX
	# dd bs=4M if /path/to/archlinux-2019.04.15-x86_64.iso of=/dev/sdX oflag=sync

