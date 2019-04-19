# Live Arch Linux, saltstack ready

Customised Live ISO creation. Different scripts for masters & minions.

I'm using Arch Linux as my working environment, haven't tested on other distros.
Work in progress!

#### Preferred method: 
- Use Arch Linux in a virtual environment
- clone the repo
- run the script (build_minion or build_master)
- learn the dance, buy the shirt...

#### References:

https://git.archlinux.org/archiso.git/tree/

https://wiki.archlinux.org/index.php/Archiso

Install archiso package from arch repositories, as it is still used partly on
scripts.

### Making the images:

Run the helper scripts either for minions or masters. Please check the
scripts before running them to know what you are doing.

You end up with an .iso file into /releng/out -directory, which can be dd'd onto 
usb stick. As some (Windows) machines can't see dd-created bootsticks,
I'm using VBox-Win10 and Rufus to be able to boot on classrooms machines.

The usb stick loads Arch Linux into ram and has root autologin. Zsh is the current
shell with gmpr-config package.

### Secure boot enabled?

The original preloader efi-files needed to boot with secure-boot enabled 
are replaced with preloader-signed, see the following webpage for details:

https://blog.hansenpartnership.com/linux-foundation-secure-boot-system-released/

On my test laptop, the stick boots now with secure boot enabled. This results
using efiboot directory upon boot. On classrooms desktops syslinux got into use.

### Kind of security alert

The salt keypairs are generated upon enabling the service for the first time.
If this is done in airootfs, before making the iso image, it results in same keypair
in all the minions. This is why initial salt configuration should be done
with a script.
