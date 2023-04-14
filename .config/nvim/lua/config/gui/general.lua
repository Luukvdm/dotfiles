require("smartcolumn").setup()

-- Disable virtual_text since it's redundant due to lsp_lines.
vim.diagnostic.config({
  virtual_text = false,
})

vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" })
vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })
require("illuminate").configure({
  providers = {
    'lsp',
    'treesitter',
  },
  large_file_cutoff = 5000,
  min_count_to_highlight = 2,
})
