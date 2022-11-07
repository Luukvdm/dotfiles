require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

-- keymap.set('n', '<Leader>t', <Cmd>WindowsMaximizeVertically<CR>)
vim.api.nvim_set_keymap("n", "<Leader>t", [[<Cmd>NvimTreeToggle<CR>]], { noremap = true, silent = true })
