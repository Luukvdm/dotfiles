local cmd = vim.cmd
local keymap = vim.keymap
local o = vim.o

-- Config for the Windows plugin
local function win_cmd(command)
   return table.concat({ '<Cmd>', command, '<CR>' })
end

keymap.set('n', '<C-w>z', win_cmd 'WindowsMaximize')
keymap.set('n', '<C-w>_', win_cmd 'WindowsMaximizeVertically')
keymap.set('n', '<C-w>|', win_cmd 'WindowsMaximizeHorizontally')
keymap.set('n', '<C-w>=', win_cmd 'WindowsEqualize')

-- Colors
o.background = "dark"
-- vim.cmd([[colorscheme gruvbox]])

require('gruvbox').setup({
  
})
cmd('colorscheme gruvbox')
