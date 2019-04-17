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

The usb stick boots, has root autologin, and salt installed!
I had to make a .gitignore file to my working directory, so large amounts
of files created by the setup (/releng/{out,work}/) are not included needlessly.

On a test laptop, the stick boots now with secure boot enabled. Testing it
soon on different hardware. Resorting atm to VBox-Win10 with rufus to burn iso-files created
to /archlive/releng/out directory, as some (Windows) machines don't see the sticks created
with dd at all.

Next I'm going to make commits that makes a working default salt minion
configuration to be included in the .iso file.

Have to be able to load the whole system into ram, made some configurations to
/archis_sys.cfg, but these didn't have any effect.
Current workaround: when booting, edit the command line with 'e'
on the ISO boot menu. Add copytoram=y to kernel command line.

### Stripping build

Minimal configuration preferred.
