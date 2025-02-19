new empty root partition mounted on `/mnt`

`sudo nixos-generate-config --root /mnt`

`curl https://raw.githubusercontent.com/robinelfrink/nix/refs/heads/main/configuration.nix | sudo tee /mnt/etc/nixos/configuration.nix`

`sudo nixos-install`
