
-- Setup extra parsers.
local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

parser_configs.http = {
	install_info = {
		url = 'https://github.com/rest-nvim/tree-sitter-http',
		files = { 'src/parser.c' },
		branch = 'main',
	},
	filetype = 'http',
}

require('nvim-treesitter.configs').setup {
	-- https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
	ensure_installed = { 'bash', 'css', 'dockerfile',
                       'go', 'gomod', 'html', 'javascript',
                       'lua', 'make', 'markdown', 'python',
                       'vue', 'yaml'
  },
  auto_install = true,

  highlight = {
		enable = true,
		disable = { },
	},

  indent = {
    enable = true,
    -- disable = { 'yaml' }
  },

  refactor = {
		highlight_definitions = { enable = true },
		highlight_current_scope = { enable = true },
	},

  -- See: https://github.com/JoosepAlviste/nvim-ts-context-commentstring
	context_commentstring = {
		enable = true,
		-- Let other plugins (kommentary) call 'update_commentstring()' manually.
		enable_autocmd = false,
	},

  -- See: https://github.com/windwp/nvim-ts-autotag
	autotag = {
		enable = true,
		filetypes = {
			'html',
			'javascript',
			'javascriptreact',
			'typescriptreact',
			'svelte',
			'vue',
		}
	}
}

