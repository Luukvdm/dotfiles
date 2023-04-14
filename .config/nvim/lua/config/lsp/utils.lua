M = {}

--[[ DIAGNOSTICS_ACTIVE = true -- must be global since the toggle function is called in which.lua
-- toggle diagnostics line
M.toggle_diagnostics = function()
  DIAGNOSTICS_ACTIVE = not DIAGNOSTICS_ACTIVE
  if DIAGNOSTICS_ACTIVE then
    vim.diagnostic.show()
  else
    vim.diagnostic.hide()
  end
end ]]
AUTOFORMAT_ACTIVE = true
-- toggle null-ls's autoformatting
M.toggle_autoformat = function()
  -- require("utils").notify("Toggling autoformatting", "info", "functions.lua")
  AUTOFORMAT_ACTIVE = not AUTOFORMAT_ACTIVE
end

function M.custom_lsp_attach(client, bufnr)
  -- disable formatting for LSP clients as this is handled by null-ls
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false
  -- enable navic for displaying current code context
  -- if client.server_capabilities.documentSymbolProvider then
  --   require("nvim-navic").attach(client, bufnr)
  -- end
end

return M
