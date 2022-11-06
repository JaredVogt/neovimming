#!/usr/bin/env bash

# TODO this should move any existing init.lua into a backup file - with incrementing number - and report back to user that it has been done.
#
# check for existance of init.lua
# if exists, ask user if they want to move and proceed with linking


DATAPATH=~/.config/nvim

# move zsh files into place
ln -sfv $DATAPATH/lua/jaredv/init.lua $DATAPATH/.

