local o = vim.o
local fn = vim.fn
-- local g = vim.g
local cmd = vim.cmd
--
-- g.neoformat_try_node_exe = 1
--
-- Run on save
-- cmd [[autocmd! BufWritePre * undojoin | Neoformat]]
--

vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    if not o.binary and o.filetype ~= 'diff' then
      local current_view = fn.winsaveview()
      cmd([[keeppatterns %s/\s\+$//e]])
      fn.winrestview(current_view)
    end
  end,
})

require("lsp-format").setup({})
