-- Plugin specifications
-- Each plugin has its own file in plugins/ for cleaner organisation

return {
  -- Colorscheme
  { import = "plugins.colorscheme" },

  -- UI Enhancements
  { import = "plugins.lualine" },
  { import = "plugins.bufferline" },
  { import = "plugins.indent-blankline" },
  { import = "plugins.noice" },
  { import = "plugins.alpha" },

  -- Editor Enhancements
  { import = "plugins.which-key" },
  { import = "plugins.comment" },
  { import = "plugins.autopairs" },
  { import = "plugins.todo-comments" },

  -- Treesitter
  { import = "plugins.treesitter" },

  -- LSP & Completion
  { import = "plugins.lsp" },
  { import = "plugins.cmp" },
  { import = "plugins.lspkind" },

  -- Fuzzy Finder
  { import = "plugins.telescope" },

  -- Git
  { import = "plugins.gitsigns" },

  -- Terminal & OpenCode
  { import = "plugins.toggleterm" },

  -- Mason (LSP installer)
  { import = "plugins.mason" },

  -- File Tree
  { import = "plugins.neo-tree" },

  -- Linting
  { import = "plugins.lint" },
}