return {
  "lukas-reineke/indent-blankline.nvim",
  event = "BufReadPost",

  opts = {
    indent = {
      char = "│",
      tab_char = "│",
      highlight = "IblIndent",
      smart_indent_cap = true,
    },
    scope = {
      enabled = true,
      show_start = false,
      show_end = false,
      highlight = "IblScope",
      injected_languages = true,
      priority = 500,
    },
    exclude = {
      filetypes = {
        "alpha",
        "dashboard",
        "help",
        "lazy",
        "mason",
        "neo-tree",
        "NvimTree",
        "notify",
        "toggleterm",
        "Trouble",
      },
    },
  },
  main = "ibl",
}