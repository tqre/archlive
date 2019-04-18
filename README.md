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

The usb stick boots to ram, has root autologin, and a local saltstack ready to go.

I had to make a .gitignore file to my working directory, so large amounts
of files created by the setup (/releng/{out,work}/) are not included needlessly.
The preloader efi-files needed to boot with secure-boot on can be 
found from AUR: preloader-signed, see the following webpage for details:

https://blog.hansenpartnership.com/linux-foundation-secure-boot-system-released/

To reset the build, remove the lock files from /work directory: build.make_*

On a test laptop, the stick boots now with secure boot enabled. Testing it
soon on different hardware. Resorting atm to VBox-Win10 with rufus to burn iso-files created
to /archlive/releng/out directory, as some (Windows) machines don't see the sticks created
with dd at all.

### Stripping build & making local salt master-minion

Boot testing on local master-minion relationship works, just have to accept
the local minions key! 
Added the sed-line added to customize_airootfs.sh to remove python warning.

### Initial test work

The class machines now boot up, some syslinux stuff still needs checking, as
on a laptop test machine, the splash screen shows up wrong. Have to recheck
the efi partition directories in the script, as I made some changes to them
(/BOOT instead of /boot). They seem to end up in wrong places...

