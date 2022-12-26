-----------------------------------------------------------
-- Initiate which-key and set options 
-----------------------------------------------------------

-- import safely
local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  vim.notify("which-key failed to load")
	return
end

which_key.setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
}
