Downloads:

*  [Google Chrome](https://www.google.com/chrome/)
*  [Visual Studio Code](https://code.visualstudio.com/)
*  [Zoom](https://zoom.us/download?os=linux)

Apt packages:

```
sudo apt-get install audacity curl direnv git gnucash nextcloud-desktop podman-docker pwgen restic vim
```

Configuration:

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

*  Virtualbox

   ```
   sudo apt-get install --fix-broken
   sudo usermod --append --groups vboxusers robin
   openssl req -new -x509 -newkey rsa:2048 -keyout MOK.key -out MOK.crt -nodes -days 3650 -subj "/CN=Zaphod/"
   openssl x509 -in MOK.crt -out MOK.cer -outform DER
   sudo mokutil --import MOK.cer
   ```
