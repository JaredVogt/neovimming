-----------------------------------------------------------
-- Define nvim autocmd settings 
-----------------------------------------------------------

local o = vim.opt -- for conciseness
local a = vim.api -- for conciseness

-- autocmds
a.nvim_create_autocmd(  -- switch to normal mode on change of focus 
  "FocusLost",
  { command = [[call feedkeys("\<C-\>\<C-n>")]] }
)

a.nvim_create_autocmd(  -- Auto save buffers whenever neovim loses focus 
  "FocusLost",
  { command = [[silent! wa]] }
)

a.nvim_create_autocmd(  -- Auto save buffers whenever buffer loses focus 
  "BufHidden",
  { command = [[silent! wa]] }
)

a.nvim_create_autocmd(  -- set ft=markdown if no filetype specified 
  "BufEnter",
  { command = [[if &filetype == "" | setlocal ft=markdown | endif]] }
)
a.nvim_create_autocmd(  -- step 1 - switch to normal mode in 120secs
  "InsertEnter",
  { command = [[let updaterestore=&updatetime | set updatetime=120000]] }
)

a.nvim_create_autocmd( -- step 2
  "InsertLeave",
  { command = [[let &updatetime=updaterestore]] }
)

a.nvim_create_autocmd(  -- step 3
  "CursorHoldI",
  { command = [[stopinsert]] }
)


-- bufcheck autocmd group
a.nvim_create_augroup('bufcheck', {clear = true})

a.nvim_create_autocmd(  -- highlight yanks
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

