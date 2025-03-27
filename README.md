# Install software

## Downloads:

*  [Google Chrome](https://www.google.com/chrome)
*  [MuseScore](https://musescore.org/en/download)
*  [Zoom](https://zoom.us/download?os=linux)

## App store:

Signal Desktop, Vistual Studio Code

## Apt packages:

```
sudo apt-get install audacity curl direnv evolution gimp git gnucash inkscape \
    network-manager-openconnect-gnome network-manager-openvpn-gnome \
    nextcloud-desktop podman-docker pwgen restic vim
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

*  OpenVPN & AppArmor

   Create `/etc/apparmor.d/local/openvpn`:
   ```
   @{HOME}/.cert/nm-openvpn/* r,
   ```

*  Nextcloud local folders

   ```
   grep localPath .config/Nextcloud/nextcloud.cfg | sed 's/.*=//' | xargs -i{} mkdir -p "{}"
   ```
