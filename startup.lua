-----------------------------------------------------------
-- Initiate nvim and call startup files 
-----------------------------------------------------------


-- set userName to choose appropriate config file directory structure
local a = vim.api -- for conciseness
userName = a.nvim_get_var('userName')
print(userName .. '> startup.lua refreshed')

require(userName .. ".plugins-setup")
require(userName .. ".core.options")
require(userName .. ".core.autocmds")
-- require(userName .. ".core.keymapsWithDesc")  -- experimental 
require(userName .. ".core.keymaps")
require(userName .. ".core.colorscheme")
require(userName .. ".setup.firenvim")  -- TODO this has to be configured - empty file at this point
