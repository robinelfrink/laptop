# Install software

## Downloads:

*  [Google Chrome](https://www.google.com/chrome/)

## App store:

Signal Desktop, Vistual Studio Code, Zoom Client

## Apt packages:

```
sudo apt-get install audacity curl direnv evolution git gnucash musescore3 network-manager-openconnect-gnome \
     network-manager-openvpn-gnome nextcloud-desktop podman-docker pwgen restic vim
```

# Configuration:

*  Btrfs compression

   ```
   sudo mount -o remount,compress=zstd /
   sudo btrfs filesystem defrag -czstd -r /
   sudo mount -o remount,compress=zstd /home
   sudo btrfs filesystem defrag -czstd -r /home
   ```

*  Direnv

   ```
   echo -e "\neval \"\$(direnv hook bash)\"" >> .bashrc
   ```

*  Git

   ```
   git config --global user.name "Robin Elfrink"
   git config --global user.email robin@15augustus.nl
   ```

*  Podman
  
   ```
   sudo usermod --add-subuids 100000-165535 --add-subgids 100000-165535 robin
   ```

*  Nextcloud local folders

   ```
   grep localPath .config/Nextcloud/nextcloud.cfg | sed 's/.*=//' | xargs -i{} mkdir -p "{}"
   ```
