# Live Arch Linux, saltstack ready
Custom Live Arch Linux ISO on a usb stick
and configuring Saltstack into it to have ad-hoc minions on class machines.

https://wiki.archlinux.org/index.php/Archiso

## Journal:

### Making the first image:

-all files inside /releng/airootfs should be owned by root

	$ su
	# chown root:root -R ~/archline/releng/airootfs/