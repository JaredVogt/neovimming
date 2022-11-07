#!/usr/bin/env bash

# TODO this should move any existing init.lua into a backup file - with incrementing number - and report back to user that it has been done.
#
# check for existance of init.lua
# if exists, ask user if they want to move and proceed with linking


DATAPATH=~/.config/nvim
BASE=$(basename $PWD)  # get the basename of the current working directory to create custom init.lua

# Create link to init.lua with repo prepended. To use this, call nvim with nvim -u ~/.config/nvim/[dir].init.lua 
ln -sfv $DATAPATH/lua/$BASE/init.lua $DATAPATH/$BASE.init.lua


# TODO Set environmental variable for nvim user


