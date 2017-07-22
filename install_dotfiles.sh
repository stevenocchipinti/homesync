#!/bin/bash
################################################################################
#                                                                              #
#                        HomeSync - install_dotfiles.sh                        #
#                                                                              #
# This script will make symlinks in $HOME to all the files in $HOMESYNC/$DATA  #
# If that file already exists, it will back it up to $BACKUP                   #
#                                                                              #
# @steveocchipinti                                                             #
# http://StevenOcchipinti.com                                                  #
# https://github.com/stevenocchipinti/homesync                                 #
#                                                                              #
################################################################################

HOMESYNC="$HOME/.homesync"  # The root on this project
DATA="$HOMESYNC/data"       # The subdirectory where the actual files live
BACKUP="$HOMESYNC/backup"   # If the files already exist, they get moved here


function symlink_with_parent {
  TARGET=$1
  TARGET_DIR="$HOME/`dirname $TARGET`"

  # If the directory does not exist, make the nessesary directories
  [ ! -e $TARGET_DIR ] && mkdir -p $TARGET_DIR
  [ $? -eq 0 ] && echo -e "mkdir\t$TARGET_DIR"

  # If the file exists and is NOT a symlink, back it up
  [ -f $HOME/$TARGET ] && [ ! -L $HOME/$TARGET ] && move_to_backup $TARGET
  [ $? -eq 0 ] && echo -e "backup\t$TARGET"

  # If the file does not exist (been backed up, etc.), make the symlink
  [ ! -e $HOME/$TARGET ] && ln -s $DATA/$TARGET $HOME/$TARGET
  [ $? -eq 0 ] && echo -e "link\t$TARGET"
}


function move_to_backup {
  TARGET=$1
  TARGET_DIR="$BACKUP/`dirname $TARGET`"

  # Make a clone of the original directory structure under $BACKUP
  mkdir -p $TARGET_DIR &> /dev/null
  # Move the original file into the same directory structure under $BACKUP
  mv $HOME/$TARGET $BACKUP/$TARGET
}


################################################################################
#                             Make all the symlinks                            #
################################################################################

pushd $DATA &> /dev/null
[ $? -ne 0 ] && echo "No $DATA directory!" && exit 1

for F in `find . -type f`
do
  symlink_with_parent $F
done

popd &> /dev/null
