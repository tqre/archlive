# Live Arch Linux, saltstack ready
Customized Live Arch Linux ISO on a usb stick.
Configuring Saltstack into it to have ad-hoc minions on class machines.
Using Arch Linux as my main OS to do this.

https://git.archlinux.org/archiso.git/tree/

https://wiki.archlinux.org/index.php/Archiso

## Journal:

Installed archiso package from arch repositories.

### Making the first image:

Run the script as root, and make sure everything is also owned by root,
as airootfs requires this.

	$ su
	# chown root:root -R ~/archlive
	# ~/archlive/releng/build.sh -v

The usb stick boots, has root autologin, and salt installed!
I had to make a .gitignore file to my working directory, so large amounts
of files created by the setup (/releng/{out,work}/) are not included needlessly.

The preloader efi-files needed to boot with secure-boot on can be 
found from AUR: preloader-signed, see the following webpage for details:

https://blog.hansenpartnership.com/linux-foundation-secure-boot-system-released/

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

### Stripping build & making local salt master-minion

Autoconfiguring testing on local master-minion relationship incoming.

