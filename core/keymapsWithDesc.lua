-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------
-- set userName to choose appropriate config file directory structure

keymapCheatSheet = {}

local function map(mode, lhs, rhs, opts, desc)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
  if desc then 
    -- print(lhs .. ' | ' .. desc)
    table.insert(keymapCheatSheet, {lhs, desc})
  end
  -- print(keymapCheatSheet)
  -- print(rhs .. ' | ' .. desc)
end
-- TODO can create an object from all of the mappings that can be used to create a helpfile
-- Can add the help into the map function - and spit out an array with all commands
-- can invoke with a shell argument to conditionally avoid the vim commands since they will error


vim.g.mapleader = ' '  -- space for leader

-- general keymaps
map("n", "x", '"_x', {}, "deletes letter but doesn't put it in register!")
map("n", "<leader>u", "<C-r>")  -- redo 
map("n", "dw", "daw", {}, 'delete word anywhere in it')
map("n", "<leader>;", "g;")  -- jump back to last edit 
map("n", "<ESC><ESC><ESC>", ":nohl<CR>")  -- clear search highlight

-- Command window with history
map("n", ":", "q:a") 
map("n", "/", "q/a") 
map("n", "?", "q?a") 


-- window management
map("n", "<leader>sv", "<C-w>v") -- split window vertically
map("n", "<leader>sh", "<C-w>s") -- split window horizontally
map("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
map("n", "<leader>sx", ":close<CR>") -- close current split window

-- map("n", "<leader>to", ":tabnew<CR>") -- open new tab
-- map("n", "<leader>tx", ":tabclose<CR>") -- close current tab
-- map("n", "<leader>9", ":tabn<CR>") --  go to next tab
-- map("n", "<leader>0", ":tabp<CR>") --  go to previous tab

-- barbar
map('n', '<leader>-', '<Cmd>BufferPick<CR>')
map('n', '<leader>9', '<Cmd>BufferPrevious<CR>')
map('n', '<leader>0', '<Cmd>BufferNext<CR>')
map('n', '<leader><tab>', '<Cmd>BufferClose<CR>')

-- leader util actions
map('n', '<leader>r', ':so $MYVIMRC<CR>')  -- reload config without restart nvim
map('n', '<leader>w', ':w<CR>')  -- fast save
map('n', '<leader>q', ':q<CR>')  -- fast quit


----------------------
-- Plugin Keybinds
----------------------
map("n", "<leader>e", ": NvimTreeToggle<CR>")  -- NvimTreeToggle

-- telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
map("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
map("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags


----------------------
-- Jared's extras 
----------------------

-- "" <L>u        - select word under cursor and prep for replace - http://vim.wikia.com/wiki/Search_and_replace_the_word_under_the_cursor NOTE: <Left> kicks the cursor back to left
-- map('n', '<leader>u', ':%s/\<<C-r><C-w>\>//gc<Left><Left>Left>')
-- nnoremap <Leader>u :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>

-- Jared's to implement
-- j/k/0/$ moves even for a wrapped lines (updated with hint for use with relative line numbers - https://blog.petrzemek.net/2016/04/06/things-about-vim-i-wish-i-knew-earlier/)
-- nmap 0 g0
-- nmap $ g$
-- noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
-- noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

-- write variable
local a = vim.api -- for conciseness
a.nvim_set_var(  
  "keymapCheatSheet",
  keymapCheatSheet 
)
