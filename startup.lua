-----------------------------------------------------------
-- Initiate nvim and call startup files 
-----------------------------------------------------------


-- set userName to choose appropriate config file directory structure
local va = vim.api -- for conciseness
userName = va.nvim_get_var('userName')
print(userName .. '> startup.lua refreshed')

require(userName .. ".plugins-setup")
require(userName .. ".core.options")
require(userName .. ".core.autocmds")
-- -- require(userName .. ".core.keymapsWithDesc")  -- experimental 
require(userName .. ".core.keymaps")
require(userName .. ".core.colorscheme")
require(userName .. ".setup.firenvim")
