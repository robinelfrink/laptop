Downloads:

*  [Google Chrome](https://www.google.com/chrome/)
*  [Visual Studio Code](https://code.visualstudio.com/)
*  [Virtualbox](https://www.virtualbox.org/wiki/Downloads)

Apt packages:

```
sudo apt-get install audacity direnv git gnucash nextcloud-desktop podman-docker vim
```

Configuration:

*  Podman
  
   `sudo usermod --add-subuids 100000-165535 --add-subgids 100000-165535 robin`

*  Direnv

   `echo -e "\neval \"\$(direnv hook bash)\"" >> .bashrc`
