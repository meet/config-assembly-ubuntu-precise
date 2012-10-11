## Configuration for lab server running Ubuntu 12.04 "Precise Pangolin"

### Installation Prerequisites
 * Bootable USB drive with Ubuntu Server 12.04 "Precise" AMD64 installer,
   e.g. [ubuntu-12.04.1-server-amd64.iso](http://releases.ubuntu.com/precise/ubuntu-12.04.1-server-amd64.iso)
 * Internet router serving DHCP
 * Built-in Ethernet port `eth0` connected to Internet router
 * Secondary Ethernet port `eth1` connected to internal network

### Installation Instructions
 * Boot from the Ubuntu Server 12.04 "Precise" AMD64 install drive
 * Press `Enter` to accept English
 * Press `F6`, then `ESC`, to show the boot arguments line
 * Add `auto=true url=git.io/precise-preseed` to the end, and press `Enter`
 * The installation should begin,
   and *you should not see any questions about language or keyboard*
 * Select `eth0` as the primary network interface
 * Hostname: `assembly` -- *do not use any existing value!*
 * Continue through the prompts until you reach "Finish partitioning"
   1. Go up to the line ending in `/srv/home` and press `Enter`
   2. Select "Use as" and select "Ext4" -- *yes, even though it was already selected!*
   3. Select "Done setting up partition"
   4. Repeat steps 1-3 with the line ending in `/`
   5. And repeat with the line ending in `swap`, except choose "Use as" "swap area"
   6. Now select "Finish partitioning and write changes to disk"
 * At the end of the installation, remove the USB drive and reboot

### Post-Installation Instructions
 * Immediately log in and change the root password
 * Run `/root/setup-ldap` and provide the LDAP replication password
   (after a few seconds, `getent passwd` should show MEET users)
