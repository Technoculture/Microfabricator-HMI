# Setting up Static USB Port Names in Linux

> Reference from: https://msadowski.github.io/linux-static-port/



1. Add rules to the following file, `/etc/udev/rules.d/99-usb-serial.rules`:

   ```bash
   KERNEL=="ttyUSB*", KERNELS=="1-1.2:1.0", SYMLINK+="com_slider"
   KERNEL=="ttyUSB*", KERNELS=="1-1.5:1.0", SYMLINK+="com_uvfanpump"       
   KERNEL=="ttyUSB*", KERNELS=="1-1.4:1.0", SYMLINK+="com_sensors"
   KERNEL=="ttyUSB*", KERNELS=="1-1.3:1.0", SYMLINK+="com_com_distsense"
   ```

2. Reload the rules file: `udevadm control --reload-rules`

   > Note: if the above doesn't work, use this: `sudo udevadm trigger`

