# neovimming
## Setup
1. Create a directory in `~/.config/nvim/lua/[somedir]` to clone this. 
2. Clone repo - `git clone git@github.com:JaredVogt/neovimming.git ~/.config/nvim/lua/[somedir]`
3. Run `./install.sh` to create symlinks and generate `activeUser` file

## Key concepts
* nvim's root directory is `~/.config/nvim`.
* `~/.config/nvim/init.lua` is the default nvim config file. This is usually just the starting point to purpose specific config files that are sourced (`require`) from inside the lua directory structure.
* Anything placed in `~/.config/nvim/lua` is in the path of `init.lua` and can be accessed with "require" in init.lua. Ex. `require("getActiveUser")` (path is relative to lua as a starting point, and lua extension is left off).

## How this repo works - `init.vim` - 
* `~/.config/nvim/init.vim` is symlinked to this repo's root directory. It is purposefully simple and does several key things...
  * Sets the User. `require('getActiveUser')` reads `nvim/activeUser` to define the global nvim variable `userName`. This variable is used by appropriate files to link to this user's config. 
  * Gets userName. Accesses `userName` global nvim variable to set path for...
  * Requires the "real" init file for the repo. `require('rootdir/startup')` itself requires the rest of the repos configuration files. 

## The concept of a "activeUser" - `getActiveUser.lua`
It is easy to have multiple nvim configs, or "users" for testing/use cases. The different configurations can be stored in purpose subdirectories in `nvim/lua`. To access a specific users config files, the `init.lua` needs to 1) point to them (or at least a starting file that subsequently points to other config fils), or 2) nvim needs to be launched with the `-U` option (ex. `-u ~/.config/nvim/jaredv.init.lua'`) to choose a starting init file.

## `install.sh` - symlink files, create activeUser
Three files are sylink'ed into the nvim directory.
* `init.lua` to nvim root - base init file
* `getActiveUser.lua` to `nvim/lua` to read `activeUser` and set global nvim var `userName`
* `activeUser` script reads base directory and dynamically creates this file

TODOS
* check for existing `init.lua` and ask course of action - back up or replace
