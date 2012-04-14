# VMware Fusion: One IP to Rule Them All

## DHCP configuration of VMware for Fixed IPs

Open the configuration file _/Library/Preferences/VMware Fusion/vmnet8/dhcpd.conf_
and add one entry like this per each virtual machine:

    host rails {
        hardware ethernet 00:0c:29:73:dc:78;
        fixed-address 172.16.132.127;
    }

below the comment banner

    ####### VMNET DHCP Configuration. End of "DO NOT MODIFY SECTION" #######

The fixed IP must lie **outside** the range you can see in the `subnet` block:

    subnet 172.16.132.0 netmask 255.255.255.0 {
        range 172.16.132.128 172.16.132.254;
        ...
    }

In the example above we are setting 172.16.132.127, which is correctly out of
the range.

The configuration file is reset after a VMware upgrade, but the process leaves
a backup called _/Library/Preferences/VMware Fusion/vmnet8/dhcpd.conf.bak_.
Just restore the `host` blocks from there.

## /etc/hosts

Edit _/etc/hosts_ to assign a name to the fixed IP:

    172.16.132.127 vm

## Mounting Virtual Machines via SSH

You need first to install `sshfs`. It is available both via MacPorts and
Homebrew.

Then put this script in your `$PATH`:

    #!/bin/bash

    user=${1:-fxn}
    host=${2:-vm}

    exec sshfs -o StrictHostKeyChecking=no -o reconnect -o workaround=rename $user

The `StrictHostKeyChecking` is needed because we want to connect via SSH to
different machines that share the same IP. The `reconnect` option is to have
the filesystem mounted for a long period of time without cuts, and the
`workaround=rename` is related to Git.

To umount the filesystem:

    #!/bin/bash

    diskutil umount /Users/fxn/vm 2>/dev/null

Enjoy!
