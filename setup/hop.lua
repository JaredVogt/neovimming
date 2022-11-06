local status_ok, hop = pcall(require, "hop")
if not status_ok then
  vim.notify("hop failed to load")
  return
end

hop.setup { 
  multi_windows = true,  
  uppercase_labels = true,
  keys = 'etovxqpdygfblzhckisuran' 
} 
-- normal mode (easymotion-like)
vim.api.nvim_set_keymap("n", "<Leader><Leader>b", "<cmd>HopWord<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<Leader><Leader>j", "<cmd>HopLine<CR>", {noremap=true})

-- visual mode (easymotion-like)
vim.api.nvim_set_keymap("v", "<Leader><Leader>w", "<cmd>HopWordAC<CR>", {noremap=true})
vim.api.nvim_set_keymap("v", "<Leader><Leader>b", "<cmd>HopWordBC<CR>", {noremap=true})
vim.api.nvim_set_keymap("v", "<Leader><Leader>j", "<cmd>HopLineAC<CR>", {noremap=true})
vim.api.nvim_set_keymap("v", "<Leader><Leader>k", "<cmd>HopLineBC<CR>", {noremap=true})

-- normal mode (sneak-like)
vim.api.nvim_set_keymap("n", "f", "<cmd>HopChar2<CR>", {noremap=false})

-- visual mode (sneak-like)
vim.api.nvim_set_keymap("v", "s", "<cmd>HopChar2AC<CR>", {noremap=false})
vim.api.nvim_set_keymap("v", "S", "<cmd>HopChar2BC<CR>", {noremap=false})
 
