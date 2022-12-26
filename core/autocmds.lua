-----------------------------------------------------------
-- Define nvim autocmd settings 
-----------------------------------------------------------

local va = vim.api -- for conciseness

-- -- switch to normal mode on change of focus 
-- FIXME this is breaking tmux h/l switching
-- a.nvim_create_autocmd(
--   "FocusLost",
--   { command = [[call feedkeys("\<C-\>\<C-n>")]] }
-- )

-- auto save buffers whenever neovim loses focus 
va.nvim_create_autocmd(
  "FocusLost",
  { command = [[silent! wa]] }
)

-- Auto save buffers whenever buffer loses focus
va.nvim_create_autocmd(
  "BufHidden",
  { command = [[silent! wa]] }
)

-- set ft=markdown if no filetype specified
va.nvim_create_autocmd(
  "BufEnter",
  { command = [[if &filetype == "" | setlocal ft=markdown | endif]] }
)

-- step 1 - switch to normal mode in 120secs
va.nvim_create_autocmd(
  "InsertEnter",
  { command = [[let updaterestore=&updatetime | set updatetime=120000]] }
)

-- step 2 - switch to normal mode in 120secs
va.nvim_create_autocmd(
  "InsertLeave",
  { command = [[let &updatetime=updaterestore]] }
)

-- step 3 - switch to normal mode in 120secs
va.nvim_create_autocmd(
  "CursorHoldI",
  { command = [[stopinsert]] }
)

-- bufcheck autocmd group
va.nvim_create_augroup('bufcheck', {clear = true})

-- highlight yanks
va.nvim_create_autocmd(
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
va.nvim_create_autocmd(
    { "BufRead", "BufNewFile" },
    { pattern = { "*.txt", "*.md", "*.tex" }, command = "setlocal spell" }
)
