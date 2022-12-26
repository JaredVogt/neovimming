-----------------------------------------------------------
-- Setup packer and load plugins 
-----------------------------------------------------------
local va = vim.api -- for conciseness

userPlugDir = (va.nvim_get_var('userName') .. '.setup')  -- plugin folder for userName (vim var)

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

-- Helper function (TODO not used)
local requirePlug = function(plugin)
  require(userPlugDir .. plugin)
end

local packer_bootstrap = ensure_packer()

-- Run PackerSync on save
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notify("packer failed to load")
  return
end

return packer.startup(function(use)
	use("wbthomason/packer.nvim")

  -- colorschemes
  use("bluz71/vim-nightfly-guicolors")
  use("overcache/NeoSolarized")
  use("ellisonleao/gruvbox.nvim")
  use("navarasu/onedark.nvim")
  use("EdenEast/nightfox.nvim")

  -- requires
  use("nvim-lua/plenary.nvim") -- lua functions that many plugins use
  use('kyazdani42/nvim-web-devicons')  -- vscode like icons - dependency of couple of plugins

  -- random
  use("szw/vim-maximizer") -- maximizes and restores current window essential plugins
  use("tpope/vim-surround") -- add, delete, change surroundings (it's awesome)
  use("inkarkat/vim-ReplaceWithRegister") -- replace with register contents using motion (gr + motion)
  use("wellle/targets.vim") -- new text targets
  use("ThePrimeagen/harpoon") -- shortcuts to files 
  use('romgrk/barbar.nvim')  -- tab bar with barbar
  use('JoosepAlviste/nvim-ts-context-commentstring')  -- contextual comment used with Comment.vim
  
   -- auto closing
  use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
  require(userPlugDir .. ".autopairs")

 -- autoclose tags
  use({
    "windwp/nvim-ts-autotag",
    after = "nvim-treesitter"
  })

  -- hop/easymotion
  use({
    "phaazon/hop.nvim",
    branch = "v1" -- optional but strongly recommended
  })
  require(userPlugDir .. ".hop")

  -- git stuff
  use({
    "lewis6991/gitsigns.nvim",
    config = function()
      require(userPlugDir .. ".gitsigns").setup()
    end,
  })

  -- shortcut help
  use("folke/which-key.nvim")
  require(userPlugDir .. ".which-key")

 -- visualize undo tree
 -- FIXME shortcut is not working see keymaps 
  use("mbbill/undotree")
  -- require(userPlugDir .. ".undotree")

  -- commenting with cc
  use("numToStr/Comment.nvim")
  require(userPlugDir .. ".comment")
  -- TODO add nvim-tx-comment to get contextual comment strings

  -- file explorer
  use("nvim-tree/nvim-tree.lua")
  require(userPlugDir .. ".nvim-tree")

  -- statusline
  use("nvim-lualine/lualine.nvim")
  require(userPlugDir .. ".lualine")

  -- fuzzy finding w/ telescope
  use({
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "make"
  }) -- dependency for better sorting performance
  use({
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x"
  }) -- fuzzy finder
  require(userPlugDir .. ".telescope")

  -- formatting & linting
  -- TODO is this even functional?
  use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
  use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

  -- treesitter configuration
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()  -- TODO what does this do???
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
  })

-- setup lsp stuff using lsp-zero 
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
    }
  }
  require(userPlugDir .. ".lsp-zero")

-- setup firenvim for browser use
  use({
    'glacambre/firenvim',
    run = function()
      vim.fn['firenvim#install'](0)
    end
  })

  -- TODO this needs to be moved to a config file
  use { 'alexghergh/nvim-tmux-navigation', config = function()
        require'nvim-tmux-navigation'.setup {
            disable_when_zoomed = true, -- defaults to false
            keybindings = {
                left = "<C-h>",
                down = "<C-j>",
                up = "<C-k>",
                right = "<C-l>",
                last_active = "<C-\\>",
                next = "<C-Space>",
            }
        }
    end
  } 

  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
