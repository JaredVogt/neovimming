-----------------------------------------------------------
-- Setup colorscheme 
-----------------------------------------------------------
local va = vim.api -- for conciseness

colorSchemes = {'onedark', 'gruvbox', 'nightfox', 'NeoSolarized'}

-- My colorscheme setup
require('onedark').setup {
    style = 'deep'
}
require(colorSchemes[1]).load()

-- Set the background to be transparent
va.nvim_set_hl(0, "Normal", { bg = "none"})
va.nvim_set_hl(0, "NormalFloat", { bg = "none"})

-- Below is one way to load colorscheme that uses protected call
-- local status, _ = pcall(vim.cmd, "colorscheme onedark")
-- if not status then
--   print("Colorscheme not found!")
--   return
-- end

-- set todo/fixme colors (white text on red)
va.nvim_create_autocmd(
  "BufEnter",
  { command = [[:highlight Todo term=reverse ctermfg=248 ctermbg=12 guifg=blue guibg=red]] }
)
