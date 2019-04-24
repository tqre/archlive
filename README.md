# Live Arch Linux, saltstack ready

Customised Live ISO creation. Different scripts for masters & minions.

I'm using Arch Linux as my working environment, haven't tested on other distros.
Work in progress!

#### Preferred method: 
- Use Arch Linux in a virtual environment
  - https://wiki.archlinux.org/index.php/Installation_guide
- install archiso and arch-install-scripts with pacman
- ensure system is up-to-date with pacman -Suy, reboot if necessary
- clone this repo
- check the script you're running
- run the script: sudo ./isomake [master|minion]
- use dd or other tools to create a bootable medium

#### References:

https://git.archlinux.org/archiso.git/tree/

https://wiki.archlinux.org/index.php/Archiso

Archiso package and arch-install-scripts are required from arch repositories, as
parts of them are used.

### Making the images:

Run the build script either for minions or master. Please check the
scripts before running them to know what you are doing.

You end up with an .iso file into /releng/out -directory, which can be dd'd onto 
usb stick. As some (Windows) machines can't see dd-created bootsticks,
I'm using VBox-Win10 and Rufus to be able to boot on school's machines.

The usb stick loads Arch Linux into ram and has root autologin. Zsh is the current
shell with gmpr-config package. On login, the minion clones the minion
repository and runs a script from there configuring salt and starting the service.

### Secure boot

The original preloader efi-files have been replaced with with preloader-signed to 
enable booting with secure boot enabled, see the following old webpage for details:

https://blog.hansenpartnership.com/linux-foundation-secure-boot-system-released/

On my test laptop (2013 HP255), can't get a good grip on that tool yet, I managed to 
boot it with secure boot enabled, but I don't understand it yet. This 
results using efiboot directory upon boot? Otherwise syslinux gets used. Don't know
yet what is the main trigger. Probably something to do with EFI...

Well this is giving problems... gotta look into this more...

### Kind of security alert

The salt keypairs are generated upon enabling/starting the service for the first time.
If this is done in airootfs before making the iso image it results in same keypair
in all the minions. This is why initial salt configuration should be done with a
script.
