-----------------------------------------------------------
-- Initiate lsp-zero and set options 
-----------------------------------------------------------

-- import safely
local status_ok, lsp = pcall(require, "lsp-zero")
if not status_ok then
  vim.notify("lsp-zero failed to load")
	return
end

local status_ok, cmp = pcall(require, "cmp")
if not status_ok then
  vim.notify("cmp failed to load")
	return
end


-- local lsp = require('lsp-zero')  -- FIXME I think this is a duplicative
lsp.preset('recommended')
lsp.ensure_installed({
  'tsserver',
  'eslint',
  'sumneko_lua',
})

-- local cmp = require('cmp')  -- FIXME I think this is a duplicative
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

-- disable completion with tab
-- this helps with copilot setup
-- cmp_mappings['<Tab>'] = nil  -- TODO commenting out these two lines because I want tab to work!
-- cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = true,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})
vim.diagnostic.config({
    virtual_text = true,
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  if client.name == "eslint" then
      vim.cmd.LspStop('eslint')
      return
  end

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
  vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end)
lsp.nvim_workspace()
lsp.setup()
