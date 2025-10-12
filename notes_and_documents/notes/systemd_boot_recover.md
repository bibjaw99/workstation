- cfdisk to drive
- delete the boot partion and create a new EFI system

- mkfs.fat -F32 /dev/nvme0n1p1

- mount /dev/nvme0n1p2 /mnt
- mount /dev/nvme0n1p3 /mnt/home

- mkdir -p /mnt/boot
- mount /dev/nvme0n1p1 /mnt/boot

- packstrap to /mnt

- genfstab -U /mnt > /mnt/etc/fstab

- arch-chroot /mnt

- bootctl --path=/boot install

- edit /boot/loader/loader.conf
- edit /boot/loader/entries/arch.conf
