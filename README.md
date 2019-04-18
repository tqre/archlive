# Live Arch Linux, saltstack ready
Customized Live Arch Linux ISO on a usb stick.
Configuring Saltstack into it to have ad-hoc minions on class machines.
Using Arch Linux as my main OS to do this.

https://git.archlinux.org/archiso.git/tree/

https://wiki.archlinux.org/index.php/Archiso

## Journal:

Installed archiso package from arch repositories, as it is still used partly on
scripts.

### Making the image:

Script has to be run as root. Make sure everything is also owned by root,
as airootfs requires this.

	$ su
	# chown root:root -R ~/archlive/releng
	# ~/archlive/releng/build.sh -v

You get an .iso file into /releng/out -directory, which can be dd'd onto 
usb stick. As some (Windows) machines can't see dd-created bootsticks,
I'm using VBox-Win10 and Rufus to be able to boot on classrooms machines.

To reset the build completely, remove the work/ directory. On minor changes
just removing the lock files /work/build.make_* works, and speeds up the
process.	

The usb stick loads Arch Linux into ram and has root autologin.

### Secure boot enabled?

The original preloader efi-files needed to boot with secure-boot enabled 
are replaced with preloader-signed, see the following webpage for details:

https://blog.hansenpartnership.com/linux-foundation-secure-boot-system-released/

To reset the build, remove the lock files from /work directory: build.make_*

On a test laptop, the stick boots now with secure boot enabled. This results
using efiboot directory upon boot. On classrooms desktops syslinux got into use.

### Stripping build & making local salt master-minion

Testing on local master-minion relationship works. Added the sed-line added 
to customize_airootfs.sh to correct python warning (fixed in salt-dev).

### Kind of security alert

The salt keypairs are generated upon enabling the service for the first time.
If this is done before while making the iso image, it results in same keypair
in all the minions. This is why initial salt configuration should be done
with a script.
