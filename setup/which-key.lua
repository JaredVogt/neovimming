-- local status_ok, which-key = pcall(require, "which-key")
-- if not status_ok then
--   vim.notify("comment failed to load")
--   return
-- end

config = function()
    require("which-key").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
