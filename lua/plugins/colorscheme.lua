return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,

  opts = {
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    transparent_background = false,
    show_end_of_buffer = false,
    term_colors = true,
    dim_inactive = {
      enabled = false,
      shade = "dark",
      percentage = 0.15,
    },
    styles = {
      comments = { "italic" },
      conditionals = { "italic" },
      loops = {},
      functions = { "italic" },
      keywords = {},
      strings = {},
      variables = {},
      numbers = {},
      booleans = {},
      arrays = {},
      tables = {},
      operators = {},
    },
    color_overrides = {},
    custom_highlights = {},
    integrations = {
      cmp = true,
      gitsigns = true,
      nvimtree = true,
      telescope = true,
      notify = true,
      mini = true,
      which_key = true,
      indent_blankline = { enabled = true },
      lsp_trouble = true,
      noice = true,
      bufferline = true,
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = { "italic" },
          hints = { "italic" },
          warnings = { "italic" },
          information = { "italic" },
        },
        underlines = {
          errors = { "underline" },
          hints = { "underline" },
          warnings = { "underline" },
          information = { "underline" },
        },
        inlay_hints = {
          background = true,
        },
      },
    },
  },

  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme("catppuccin")
  end,
}