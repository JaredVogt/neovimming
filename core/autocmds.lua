-----------------------------------------------------------
-- Define nvim autocmd settings 
-----------------------------------------------------------

local o = vim.opt -- for conciseness
local a = vim.api -- for conciseness

-- switch to normal mode on change of focus 
a.nvim_create_autocmd(
  "FocusLost",
  { command = [[call feedkeys("\<C-\>\<C-n>")]] }
)

-- auto save buffers whenever neovim loses focus 
a.nvim_create_autocmd(
  "FocusLost",
  { command = [[silent! wa]] }
)

-- Auto save buffers whenever buffer loses focus
a.nvim_create_autocmd(
  "BufHidden",
  { command = [[silent! wa]] }
)

-- set ft=markdown if no filetype specified
a.nvim_create_autocmd(
  "BufEnter",
  { command = [[if &filetype == "" | setlocal ft=markdown | endif]] }
)

-- step 1 - switch to normal mode in 120secs
a.nvim_create_autocmd(
  "InsertEnter",
  { command = [[let updaterestore=&updatetime | set updatetime=120000]] }
)

-- step 2 - switch to normal mode in 120secs
a.nvim_create_autocmd(
  "InsertLeave",
  { command = [[let &updatetime=updaterestore]] }
)

-- step 3 - switch to normal mode in 120secs
a.nvim_create_autocmd(
  "CursorHoldI",
  { command = [[stopinsert]] }
)

-- bufcheck autocmd group
a.nvim_create_augroup('bufcheck', {clear = true})

-- highlight yanks
a.nvim_create_autocmd(
  'TextYankPost', 
  {
    group    = 'bufcheck',
    pattern  = '*',
    callback = function() vim.highlight.on_yank{timeout=500} end 
  }
)

-- -- Return to last edit position when opening files
-- a.nvim_create_autocmd('BufReadPost',  {
--     group    = 'bufcheck',
--     pattern  = '*',
--     callback = function()
--       if fn.line("'\"") > 0 and fn.line("'\"") <= fn.line("$") then
--          fn.setpos('.', fn.getpos("'\""))
--          -- vim.cmd('normal zz') -- how do I center the buffer in a sane way??
--          vim.cmd('silent! foldopen')
--          end end })

-- Enable spell checking for certain file types
a.nvim_create_autocmd(
    { "BufRead", "BufNewFile" },
    { pattern = { "*.txt", "*.md", "*.tex" }, command = "setlocal spell" }
)
