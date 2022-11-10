# neovimming
## Setup
1. Create a directory in `~/.config/nvim/lua/[somedir]` to clone this. 
2. Clone repo - `git clone git@github.com:JaredVogt/neovimming.git ~/.config/nvim/lua/[somedir]`
3. Run `./linkInit.sh` to create symlinks for (see more below)
4. Update the contents of `activeUser` to reflect the directory you installed the repo to 

## Key concepts
* nvim's root directory is `~/.config/nvim`.
* `~/.config/nvim/init.lua` is the default nvim config file. This is usually just the starting point to purpose specific config files that are sourced (`require`) from inside the lua directory structure.
* Anything placed in `~/.config/nvim/lua` is in the path of `init.lua` and can be accessed with "require" in init.lua. Ex. `require("getActiveUser")` (path is relative to lua as a starting point, and lua extension is left off).

## `init.vim` - how this "user" works
* `~/.config/nvim/init.vim` is symlinked to this repo's root directory. It is purposefully simple and does several key things...
  * Sets the User. `require('getActiveUser')` reads `nvim/activeUser` to define the global nvim variable `userName`. This variable is used by appropriate files to link to this user's config. 
  * Gets userName. Accesses `userName` global nvim variable to set path for...
  * Requires the "real" init file for the repo. `require('rootdir/startup')` itself requires the rest of the repos configuration files. 

## `getActiveUser.lua` - the concept of a "user"
It is easy to have multiple nvim configs, or "users" for testing/use cases. The different configurations can be stored in purpose subdirectories in `nvim/lua`. To access a specific users config files, the `init.lua` needs to 1) point to them (or at least a starting file that subsequently points to other config fils), or 2) nvim needs to be launched with the `-U` option (ex. `-u ~/.config/nvim/jaredv.init.lua'`) to choose a starting init file.

## `linkInit.sh` - symlinking files into various locations
Three files are sylink'ed into the nvim directory.
* `init.lua` to nvim root - base init file
* `activeUser` to nvim root - is read to define the active user
* `getActiveUser.lua` to `nvim/lua` to read `activeUser` and set global nvim var `userName`

TODOS
* check for existing `init.lua` and ask course of action - back up or replace
* create `activeUser` user name from the directory `linkInit.sh` is in. `createActiveUser.sh`
*  










## Alternative ways to derive username
`~/.config/nvim/init.lua` is the default nvim config file. The goal is to have all neovim clients use that file, but be directed to a specific configuration directory. That can be manually set in the file or derived in various ways.   

1. Derive it from the file name, ie `jaredv.init.lu`
2. Read a global env that sets the "active" user
3. Retrieve from `~/.config/nvim/activeUser` (this could be symlinked from repo)

