ts = require('telescope')
ts.setup({
  defaults = {
    file_ignore_patterns = {"node_modules", "venv", "bin", "obj", ".idea"}
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

ts.load_extension "file_browser"
