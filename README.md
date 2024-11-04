## This is my Dotfiles

### Configurations For

* Zsh
* Git
* Vim
* Others

To create a link for a dotfile, use:

**Hard Link:**
```sh
ln originalfile linkedfile
```

**Soft Link (Not Recommended):**
```sh
ln -s originalfile linkedfile
```

For Rancher Desktop, please first run the command:
```sh
echo "nameserver 8.8.8.8" >> /etc/resolv.conf
```
This will allow you to have access to the Internet.
