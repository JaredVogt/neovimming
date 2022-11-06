# neovimming
## Setup
1. Create a directory in `~/.config/nvim/lua/[somedir]` to clone this. 
To clone, run `git clone git@github.com:JaredVogt/neovimming.git ~/.config/nvim/lua/[somedir]`

## Notes
* `~/.config/nvim/init.vim` is symlinked to this repos root directory. All it does is source `/lua/rootdir/startup.lua`. This allows for easily installing this with other neovim configs - or running different versions to try.
* lskdjf 






## Notes
* if init.lua could tell what it was symlinked from, it could derive the directory it came from. 
* or... when doing the symlink, if the .sh clipped out its directory, it could create an init.lua file with it prepended. 
* then when sourcing, the approriate variable would be used to source the right file.
