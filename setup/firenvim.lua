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
