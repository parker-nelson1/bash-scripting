#!/bin/bash

#Author: Parker
#Date Created: 3/28/25
#Last Modified: 3/28/25

# Mount the root partition
mount /dev/sda2 /mnt

# Mount the EFI partition
mount /dev/sda1 /mnt/boot/efi

# Change root into the mounted system
arch-chroot /mnt <<EOF
# Install linux kernel
pacman -S linux -y

# Install GRUB bootloader for EFI systems
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB

# Generate GRUB configuration file
grub-mkconfig -o /boot/grub/grub.cfg
EOF

# Exit the chroot environment
exit

# Reboot the system
reboot
