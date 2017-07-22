HomeSync
========

This repo contains two scripts:

1. `install_dotfiles.sh` - A simple bash script to symlink to a version
   controlled home directory

2. `setup_mac.sh` - A mac specific setup script that installs my typical dev
   environment (via `brew`)


Installation
------------

If you want to setup a new dev environment on a mac, run this:

```
git clone https://github.com/stevenocchipinti/homesync.git ~/.homesync
~/.homesync/install_dotfiles.sh
~/.homesync/setup_mac.sh
```

If you _only_ want the dotfiles, just skip the `setup_mac.sh` script


Why use `install_dotfiles.sh`?
------------------------------

 * It requires no dependancies, just a data directory    
   You won't need Ruby, Rsync, etc. You could even use this without Git!
 * It will create folders and only link the files inside    
   Useful if you want to version control some scripts inside ~/bin, but not everything!
 * You can version control the data directory however you like    
   If you don't like git, you could use Mercurial, SVN or whatever else you want!
