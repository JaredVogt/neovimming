 ----------------------------------------------------------
-- Initiate nvim and call startup files 
-----------------------------------------------------------
require("getActiveUser")  -- sets global nvim var 'userName' by reading activeUser file (which has to be in nvim folder.)

local a = vim.api -- for conciseness
userName = a.nvim_get_var('userName')  -- get user

print(userName .. '> init.lua refreshed')
-- print(os.getenv("HOME"))

require(userName .. ".startup")  -- call to get the whole shebang rolling
