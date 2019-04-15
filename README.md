# Live Arch Linux, saltstack ready
Customized Live Arch Linux ISO on a usb stick.
Configuring Saltstack into it to have ad-hoc minions on class machines.
Using Arch Linux as my main OS to do this.

https://git.archlinux.org/archiso.git/tree/

https://wiki.archlinux.org/index.php/Archiso

## Journal:

Installed archiso package from arch repositories.

### Making the first image:

All files inside /releng/airootfs should be owned by root when creating the
image.

	$ su
	# chown root:root -R ~/archlive/releng/
	# ~/archlive/releng/build.sh -v

Now put the image on a stick:

	# wipefs --all /dev/sdX
	# dd bs=4M if=/path/to/archlinux-2019.04.15-x86_64.iso of=/dev/sdX oflag=sync

The usb stick boots, has root autologin, and salt installed!
I had to make a .gitignore file to my working directory, so large amounts
of files created by the setup (/releng/{out,work}/) are not included needlessly.

Next I'm going to make commits that makes a working default salt minion
configuration to be included in the .iso file.

Have to be able to load the whole system into ram, this looks like a promising start:

https://github.com/arcmags/ramroot/blob/master/ramroot