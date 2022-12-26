-----------------------------------------------------------
-- Define nvim settings 
-----------------------------------------------------------

local vo = vim.opt -- for conciseness

-- guivim
vo.guifont = { "FiraCode Nerd Font Mono", "h15" }

-- behavior
vo.timeoutlen = 500

-- history/undo
vo.history = 1000
vo.undolevels = 1000
vo.undofile = true -- maintain undo history between sessions

-- line numbers
vo.relativenumber = true -- show relative line numbers
vo.number = true -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
vo.tabstop = 2 -- 2 spaces for tabs (prettier default)
vo.shiftwidth = 2 -- 2 spaces for indent width
vo.expandtab = true -- expand tab to spaces
vo.autoindent = true -- copy indent from current line when starting new one
vo.breakindent = true -- preserve the indentation of a virtual line 

-- search settings
vo.ignorecase = true -- ignore case when searching
vo.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
vo.cursorline = true -- highlight the current cursor line
vo.cursorcolumn = true -- highlight the current cursor line

-- appearance
vo.termguicolors = true
vo.background = "dark" -- colorschemes that can be light or dark will be made dark
vo.signcolumn = "yes" -- show sign column so that text doesn't shift
vo.pumblend = 15  -- pseudo-transparency of pop-menu
-- o.NVIM_TUI_ENABLE_TRUE_COLOR = 1  -- FIXME turn on True Color (this may not be relevant)

-- backspace
vo.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- mouse
vo.mouse = 'a'

-- clipboard
vo.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
vo.splitright = true -- split vertical window to the right
vo.splitbelow = true -- split horizontal window to the bottom

vo.iskeyword:append("-") -- consider string-string as whole word
-- :set ww=
vo.ww = "<,>,h,l" -- FIXME this doesn't look like its working


-- TODO move these to appropriate headers
vo.scrolloff = 5 -- could be 1
vo.sidescrolloff = 5  -- Minimum nr. of lines above and below cursor
vo.showmatch = true  -- Briefly jump to matching bracket if insert one
vo.ruler = true  -- Show cursor line and column in the status line
vo.autoread = true  -- Autom. read file when changed outside of Vim
vo.linebreak = true  -- Wrap long lines at a blank
vo.autowrite = true  -- Autom. save file before some action

-- " setup the cross hairs (along with colors)
-- hi CursorLine   cterm=NONE ctermbg=black guibg=#330000          " guifg=white  ctermfg=lightblue  overrides the colors on highlighted characters - disconcerting, but distinct
-- hi CursorColumn cterm=NONE ctermbg=black guibg=#330000
-- set cursorline cursorcolumn
-- vim.cmd "hi CursorColumn cterm=NONE ctermbg=black guibg=#330000"
-- vim.cmd "hi CursorLine   cterm=NONE ctermbg=black guibg=#330000"


