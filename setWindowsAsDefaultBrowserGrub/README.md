# This file contains the steps to make windows as the default OS in the grub loader


In sudo mode open the file from vim or nano 
    1) "sudo nano etc/default/grub" or "sudo vim etc/default/grub"
    2) change "GRUB_DEFAULT=0" to "GRUB_DEFAULT=saved", then save and exit
    3) run the command "sudo update grub"
    4) then "sudo grub-set-default 2" if on the boot loader screen windows is at 3rd position
    5) exit

