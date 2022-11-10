-----------------------------------------------------------
-- Setup packer and load plugins 
-----------------------------------------------------------
local a = vim.api -- for conciseness

userName = a.nvim_get_var('userName')  -- variable is set in init.lua
-- userName = 'jaredv'
plugSetupDir = '.setup'  -- set base dir for plugin configs 

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
  return
end

return packer.startup(function(use)
	use("wbthomason/packer.nvim")

  -- colorschemes
  use("bluz71/vim-nightfly-guicolors") -- preferred colorscheme
  use("overcache/NeoSolarized") -- preferred colorscheme
  use("ellisonleao/gruvbox.nvim")
  use("navarasu/onedark.nvim")
  use("EdenEast/nightfox.nvim")
  
  -- random
  use("nvim-lua/plenary.nvim") -- lua functions that many plugins use
  use("christoomey/vim-tmux-navigator") -- tmux & split window navigation
  use("szw/vim-maximizer") -- maximizes and restores current window essential plugins
  use("tpope/vim-surround") -- add, delete, change surroundings (it's awesome)
  use("vim-scripts/ReplaceWithRegister") -- replace with register contents using motion (gr + motion)
  use("wellle/targets.vim") -- new text targets

   -- auto closing
  use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
  require (userName .. plugSetupDir .. ".autopairs")  -- grab config

  use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

  -- hop/easymotion
  use {
    "phaazon/hop.nvim",
    branch = "v1" -- optional but strongly recommended
  }
  require (userName .. plugSetupDir .. ".hop")  -- grab config
  
  -- git stuff
  use({
    "lewis6991/gitsigns.nvim",
    config = function()
      require(userName .. plugSetupDir .. ".gitsigns").setup()
    end,
    -- requires = "nvim-lua/plenary.nvim",
  })

  -- shortcut help
  use("folke/which-key.nvim")
  require (userName .. plugSetupDir .. ".which-key")

 -- tab bar with barbar
  use {
  'romgrk/barbar.nvim',
  requires = {'kyazdani42/nvim-web-devicons'}
  }
  
  -- commenting with cc
  use("numToStr/Comment.nvim")
  require (userName .. plugSetupDir .. ".comment")  -- grab config

  -- file explorer
  use("nvim-tree/nvim-tree.lua")
  require (userName .. plugSetupDir .. ".nvim-tree")  -- grab config

  -- vs-code like icons
  use("kyazdani42/nvim-web-devicons")

  -- statusline
  use("nvim-lualine/lualine.nvim")
  require (userName .. plugSetupDir .. ".lualine")  -- grab config

  -- fuzzy finding w/ telescope
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
  use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder
  require (userName .. plugSetupDir .. ".telescope")  -- grab config

  -- autocompletion
  use("hrsh7th/nvim-cmp") -- completion plugin
  use("hrsh7th/cmp-buffer") -- source for text in buffer
  use("hrsh7th/cmp-path") -- source for text in path 

  -- snippets
  use("L3MON4D3/LuaSnip") -- snippet engine
  use("saadparwaiz1/cmp_luasnip") -- for autocompletion
  use("rafamadriz/friendly-snippets") -- useful snippets
  require (userName .. plugSetupDir .. ".nvim-cmp")  -- grab config

  -- formatting & linting
  use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
  use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

  -- treesitter configuration
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
    require("nvim-treesitter.install").update({ with_sync = true })
    end,
  })

  -- setup firenvim for browser use
  use({
    'glacambre/firenvim',
    run = function() vim.fn['firenvim#install'](0) end
  })

  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
