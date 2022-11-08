-----------------------------------------------------------
-- Define nvim settings 
-----------------------------------------------------------

local o = vim.opt -- for conciseness
local a = vim.api -- for conciseness

-- guivim
o.guifont = { "FiraCode Nerd Font Mono", "h15" }

-- behavior
o.timeoutlen = 500

-- history/undo
o.history = 1000
o.undolevels = 1000
o.undofile = true -- maintain undo history between sessions

-- line numbers
o.relativenumber = true -- show relative line numbers
o.number = true -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
o.tabstop = 2 -- 2 spaces for tabs (prettier default)
o.shiftwidth = 2 -- 2 spaces for indent width
o.expandtab = true -- expand tab to spaces
o.autoindent = true -- copy indent from current line when starting new one
o.breakindent = true -- preserve the indentation of a virtual line 

-- search settings
o.ignorecase = true -- ignore case when searching
o.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
o.cursorline = true -- highlight the current cursor line
o.cursorcolumn = true -- highlight the current cursor line

-- appearance
o.termguicolors = true
o.background = "dark" -- colorschemes that can be light or dark will be made dark
o.signcolumn = "yes" -- show sign column so that text doesn't shift
o.pumblend = 15  -- pseudo-transparency of pop-menu
-- o.NVIM_TUI_ENABLE_TRUE_COLOR = 1  -- FIXME turn on True Color (this may not be relevant)

-- backspace
o.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- mouse
o.mouse = 'a'

-- clipboard
o.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
o.splitright = true -- split vertical window to the right
o.splitbelow = true -- split horizontal window to the bottom

o.iskeyword:append("-") -- consider string-string as whole word
-- :set ww=
o.ww = "<,>,h,l" -- FIXME this doesn't look like its working


-- TODO move these to appropriate headers
o.scrolloff = 5 -- could be 1
o.sidescrolloff = 5  -- Minimum nr. of lines above and below cursor
o.showmatch = true  -- Briefly jump to matching bracket if insert one
o.ruler = true  -- Show cursor line and column in the status line
o.autoread = true  -- Autom. read file when changed outside of Vim
o.linebreak = true  -- Wrap long lines at a blank
o.autowrite = true  -- Autom. save file before some action

-- " setup the cross hairs (along with colors)
-- hi CursorLine   cterm=NONE ctermbg=black guibg=#330000          " guifg=white  ctermfg=lightblue  overrides the colors on highlighted characters - disconcerting, but distinct
-- hi CursorColumn cterm=NONE ctermbg=black guibg=#330000
-- set cursorline cursorcolumn
-- vim.cmd "hi CursorColumn cterm=NONE ctermbg=black guibg=#330000"
-- vim.cmd "hi CursorLine   cterm=NONE ctermbg=black guibg=#330000"


