# Remove snap

```
sudo dpkg --purge snapd firefox
sudo rm -rf /root/snap
```

# Install software

## Downloads:

*  [Google Chrome](https://www.google.com/chrome/)
*  [Visual Studio Code](https://code.visualstudio.com/)
*  [Zoom](https://zoom.us/download?os=linux)

## Apt packages:

```
sudo apt-get install audacity curl direnv git gnucash network-manager-openconnect-gnome \
     network-manager-openvpn-gnome nextcloud-desktop podman-docker pwgen restic vim
```

# Configuration:

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
   grep localPath .config/Nextcloud/nextcloud.cfg | sed 's/.*=//' | xargs -0 -i{} mkdir -p "{}"
   ```
