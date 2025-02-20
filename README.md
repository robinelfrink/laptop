```
mkfs.btrfs /dev/nvme0n1p6
mount /dev/nvme0n1p6 /mnt
btrfs subvolume create /mnt/root
btrfs subvolume create /mnt/home
btrfs subvolume create /mnt/nix
umount /mnt
```

```
mount -o compress=zstd,subvol=root /dev/nvme0n1p6 /mnt
mkdir /mnt/{boot,home,nix}
mount -o compress=zstd,subvol=home /dev/nvme0n1p6 /mnt/home
mount -o compress=zstd,noatime,subvol=nix /dev/nvme0n1p6 /mnt/nix
mount /dev/nvme0n1p1 /mnt/boot
```

```
nixos-generate-config --root /mnt`
curl -o /mnt/nixos/configuration.nix https://raw.githubusercontent.com/robinelfrink/nix/refs/heads/main/configuration.nix
nixos-install
```
