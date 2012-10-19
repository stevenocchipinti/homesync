HomeSync
========

A pure bash script to symlink to a version contolled home directory


Installation
------------

```
git clone https://github.com/stevenocchipinti/homesync.git ~/.homesync
~/.homesync/install
```


Why use HomeSync?
-----------------

 * It requires no dependancies, just a data directory    
   You won't need Ruby, Rsync, etc. You could even use this without Git!
 * It will create folders and only link the files inside    
   Useful if you want to version control some scripts inside ~/bin, but not everything!
 * You can version control the data directory however you like    
   If you don't like git, you could use Mercurial, SVN or whatever else you want!
