-----------------------------------------------------------
-- Initiate nvim and call startup files 
-----------------------------------------------------------

-- this is symlinked to ~/.config/nvim 
-- ln -sfv ~/.config/nvim/lua/jaredv/init.lua  ~/.config/nvim/init.lua

print('init.lua refreshed')

-- user = debug.getinfo(1,'S').source:match(".*/(.*)%.init.*")  -- gets user from user.init.lua
-- print(user)
user = 'default' 
user = 'jaredv'  -- temp set until this is derived from the filename 
print('User is ' .. user)

-- set userName to choose appropriate config file directory structure
local a = vim.api -- for conciseness
a.nvim_set_var(  
  "userName",
  user 
)

require(user .. ".startup")
