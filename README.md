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

	# wipefs --all /dev/sdX
	# dd bs=4M if /path/to/archlinux-2019.04.15-x86_64.iso of=/dev/sdX oflag=sync

The usb stick boots, has root autologin, and salt installed!
I had to make a .gitignore file to my working directory, so large amounts
of files created by the setup (/releng/{out,work}/) are not included needlessly.

Next I'm going to make commits that makes a working default salt minion
configuration include in the .iso file.