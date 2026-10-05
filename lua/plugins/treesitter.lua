return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "TSInstall", "TSUninstall", "TSUpdate", "TSInstallSync" },

  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "vimdoc",
      "bash",
      "c",
      "css",
      "dockerfile",
      "gitignore",
      "go",
      "graphql",
      "html",
      "http",
      "javascript",
      "json",
      "jsdoc",
      "kotlin",
      "markdown",
      "markdown_inline",
      "nix",
      "prisma",
      "python",
      "regex",
      "ruby",
      "rust",
      "scss",
      "sql",
      "svelte",
      "toml",
      "tsx",
      "typescript",
      "vue",
      "yaml",
      "zig",
    },
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = true,
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gnn",
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm",
      },
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
          ["aa"] = "@parameter.outer",
          ["ia"] = "@parameter.inner",
        },
      },
      move = {
        enable = true,
        set_jumps = true,
        goto_next_start = {
          ["]m"] = "@function.outer",
          ["]]"] = "@class.outer",
        },
        goto_next_end = {
          ["]M"] = "@function.outer",
          ["]["] = "@class.outer",
        },
        goto_previous_start = {
          ["[m"] = "@function.outer",
          ["[["] = "@class.outer",
        },
        goto_previous_end = {
          ["[M"] = "@function.outer",
          ["[]"] = "@class.outer",
        },
      },
    },
  },

  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)

    -- Additional highlights with tree-sitter
    local hl = vim.hl
    if hl then
      local hi = hl or vim.api.nvim_set_hl
      hi(0, "TSCurrentScope", { link = "Visual" })
    end
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
}