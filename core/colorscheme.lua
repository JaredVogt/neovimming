-----------------------------------------------------------
-- Setup colorscheme 
-----------------------------------------------------------

colorSchemes = {'onedark', 'gruvbox', 'nightfox', 'NeoSolarized'}

-- My colorscheme setup
require('onedark').setup {
    style = 'deep'
}
require(colorSchemes[1]).load()
-- vim.cmd("colorscheme carbonfox")

-- Below is one way to load colorscheme that uses protected call
-- local status, _ = pcall(vim.cmd, "colorscheme onedark")
-- if not status then
--   print("Colorscheme not found!")
--   return
-- end

