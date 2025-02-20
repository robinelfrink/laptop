```
mkfs.btrfs /dev/nvme0np6
mount /dev/nvme0np6 /mnt
btrfs subvolume create /mnt/root
btrfs subvolume create /mnt/home
btrfs subvolume create /mnt/nix
umount /mnt
```

```
mount -o compress=zstd,subvol=root /dev/nvme0np6 /mnt
mkdir /mnt/{boot,home,nix}
mount -o compress=zstd,subvol=home /dev/nvme0np6 /mnt/home
mount -o compress=zstd,noatime,subvol=nix /dev/nvme0np6 /mnt/nix
mount /dev/nvme0np1 /mnt/boot
```

```
nixos-generate-config --root /mnt`
curl -o /mnt/nixos/configuration.nix https://raw.githubusercontent.com/robinelfrink/nix/refs/heads/main/configuration.nix
nixos-install
```
