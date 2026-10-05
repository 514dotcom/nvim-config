return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSUninstall", "TSUpdate", "TSInstallSync" },

    opts = {
      ensure_installed = {
        "lua", "vim", "vimdoc",
        "bash", "c", "css", "dockerfile", "gitignore",
        "go", "graphql", "html", "http",
        "javascript", "json", "jsdoc",
        "kotlin", "markdown", "markdown_inline",
        "nix", "prisma", "python",
        "regex", "ruby", "rust", "scss", "sql",
        "svelte", "toml", "tsx", "typescript",
        "vue", "yaml", "zig",
        "elixir", "erlang", "fish", "glsl",
        "hcl", "haskell", "java", "julia",
        "latex", "lua", "make", "ninja",
        "nix", "nu", "rasi",
        "robot", "ron", "slint", "solidity",
        "sparql", "supercollider", "surface",
        "sqlite", "sxhkdrc", "tcl",
        "tiger", "tla", "todotxt",
        "turtle", "twig", "v",
        "vala", "verilog", "vhdl",
        "vim", "vue", "wgsl",
        "wgsl_auto", "wgsl_typst",
        "yaml", "yang", "zem",
      },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
        disable = {},
      },
      indent = {
        enable = true,
        disable = {
          "yaml", "python",
        },
      },
    },

    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)

      -- Extra nice highlights for code blocks
      vim.api.nvim_set_hl(0, "@text.title", { link = "Title" })
      vim.api.nvim_set_hl(0, "@text.emphasis", { italic = true })
      vim.api.nvim_set_hl(0, "@text.strong", { bold = true })
      vim.api.nvim_set_hl(0, "@text.strike", { strikethrough = true })
      vim.api.nvim_set_hl(0, "@text.underline", { underline = true })

      -- Rainbow parens highlights
      vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#d3869b" })
      vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#e39a83" })
      vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#e9b583" })
      vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#90c5a0" })
      vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#7dc4b8" })
      vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#73b4c4" })
      vim.api.nvim_set_hl(0, "RainbowPurple", { fg = "#a48ac4" })
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      { "hiphish/rainbow-delimiters.nvim", event = "BufReadPost" },
    },
  },

  -- Rainbow brackets/delimiters (красивые разноцветные скобки)
  {
    "hiphish/rainbow-delimiters.nvim",
    event = "BufReadPost",
    opts = {
      strategy = {
        global = true,
      },
      query = "rainbow-delimiters",
      priority = 0,
      highlight = {
        "RainbowRed",
        "RainbowOrange",
        "RainbowYellow",
        "RainbowGreen",
        "RainbowCyan",
        "RainbowBlue",
        "RainbowPurple",
      },
    },
  },
}