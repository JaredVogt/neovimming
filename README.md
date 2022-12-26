# neovimming
The point of this repo is to create an NVIM config that can easily be installed and referenced separately from other NVIM configs. Clone it to a repo under `~/config/nvim/lua` and point `~/config/nvim/init.lua` at it... and voila. 

## Setup
1. Create a directory in `~/.config/nvim/lua/[somedir]`
2. Clone `git clone git@github.com:JaredVogt/neovimming.git ~/.config/nvim/lua/[somedir]`
3. Run `./install.sh` to create symlinks and generate `activeUser` file. 

## Key concepts
* nvim's root directory is `~/.config/nvim`.
* `~/.config/nvim/init.lua` is the default nvim config file. This is usually just the starting point to purpose specific config files that are sourced (`require`) from inside the lua directory structure.
* Anything placed in `~/.config/nvim/lua` is in the path of `init.lua` and can be accessed with "require" in init.lua. Ex. `require("getActiveUser")` (path is relative to lua as a starting point, and lua extension is left off).

## `init.vim` - How this repo works
* `~/.config/nvim/init.vim` is symlinked to this repo's root directory. It is purposefully simple and does several key things...
  * Sets the User. `require('getActiveUser')` reads `nvim/activeUser` to define the global nvim variable `userName`. 
  * This variable is used by subsequent files to link to this user's config. 
  * Requires the "real" init file for the repo. `require('rootdir/startup')` itself requires the rest of the repos configuration files. 

## `getActiveUser.lua - `The concept of "activeUser"
It is easy to have multiple nvim configs, or "users" for testing/use cases. The different configurations can be stored in purpose subdirectories in `nvim/lua`. To initilize with a specific set of config files, the `init.lua` needs to 1) require them directly (or at least require a starting file that subsequently requires other config files), or 2) nvim needs to be launched with the `-U` option (ex. `-u ~/.config/nvim/jaredv.init.lua'`) to choose a starting init file (the name/location can be arbitrary).

## `install.sh` - symlink files, create activeUser file
Two files are symlink'ed into the nvim directory.
* `init.lua` to nvim root - base init file
* `getActiveUser.lua` to `nvim/lua` to read `activeUser` and set global nvim var `userName`
* `activeUser` script reads base directory and dynamically creates this file

TODOS
* check for existing `init.lua` and ask course of action - back up or replace


# NOTES
* Color of FIXME/TODO is set in `colorscheme.lua`
* Transparent is set in `colorscheme.lua` - the key is setting `bg` to `none` (va.nvim_set_hl(0, "Normal", { bg = "none"})`)
* `inkarkat/vim-ReplaceWithRegister` is awesome. `<leader>r` replaces from cusor to end of word. `gr` replaces a selection (which can be longer than a word). 
* 
 
