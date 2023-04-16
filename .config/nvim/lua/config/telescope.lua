ts = require("telescope")
ts.setup({
  defaults = {
    file_ignore_patterns = { "node_modules", "venv", "bin", "obj", ".idea", "vendor" },
  },
  extensions = {
    file_browser = {
      theme = "ivy",
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
    },
  },
})

ts.load_extension("file_browser")

-- Keymaps

-- nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
-- nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
-- nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
-- nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
-- vim.api.nvim_set_keymap('n', '<Leader><Space>', ':set hlsearch!<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap(
  "n",
  "<Leader><Space>",
  [[<Cmd>lua require('telescope.builtin').git_files()<CR>]],
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<Leader>f",
  [[<Cmd>lua require('telescope.builtin').find_files()<CR>]],
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<Leader>n",
  [[<Cmd>lua require 'telescope'.extensions.file_browser.file_browser()<CR>]],
  { noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<Leader>g",
  [[<Cmd>lua require('telescope.builtin').live_grep()<CR>]],
  { noremap = true, silent = true }
)
