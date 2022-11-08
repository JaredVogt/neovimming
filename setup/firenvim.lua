vim.g.firenvim_config = {
  globalSettings = { alt = "all", },
  localSettings = {
    [".*"] = {
      cmdline = "neovim",
      guifont = { "Monoco", "h15" },
			-- content = "text",
      -- priority = 0,
      -- selector = "textarea",
      -- takeover = "always",
    },
  }
}



-- https://github.com/glacambre/firenvim/issues/650
-- https://github.com/glacambre/firenvim/pull/1403/files
