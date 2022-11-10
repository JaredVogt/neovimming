 ----------------------------------------------------------
-- Initiate nvim and call startup files 
-----------------------------------------------------------
-- this is symlinked to ~/.config/nvim 
-- ln -sfv ~/.config/nvim/lua/jaredv/init.lua  ~/.config/nvim/init.lua
-- TODO https://github.com/JaredVogt/neovimming/issues/1 

-- dofile("/Users/jaredvogt/.config/nvim/getActiveUser.lua")  -- this reads activeUser file to set the active user
require("getActiveUser")  -- this reads activeUser file to set the active user

local a = vim.api -- for conciseness
userName = a.nvim_get_var('userName')  -- get user

print(userName .. '> init.lua refreshed')
print(os.getenv("HOME"))

require(userName .. ".startup")  -- call to get the whole shebang rolling
