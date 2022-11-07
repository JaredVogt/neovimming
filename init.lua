 ----------------------------------------------------------
-- Initiate nvim and call startup files 
-----------------------------------------------------------
-- this is symlinked to ~/.config/nvim 
-- ln -sfv ~/.config/nvim/lua/jaredv/init.lua  ~/.config/nvim/init.lua
-- TODO https://github.com/JaredVogt/neovimming/issues/1 

user = debug.getinfo(1,'S').source:match(".*/(.*)%.init.*")  -- gets user from user.init.lua

-- set userName to choose appropriate config file directory structure
local a = vim.api -- for conciseness
a.nvim_set_var(  
  "userName",
  user
)
userName = a.nvim_get_var('userName')

print(userName .. '> ' .. userName .. '.init.lua loaded')

require(userName .. ".startup")
