return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",

  opts = {
    options = {
      icons_enabled = true,
      theme = "catppuccin",
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = {
        statusline = { "alpha" },
      },
      always_divide_middle = true,
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = {
        { "branch", icon = "" },
        { "diff", symbols = { added = " ", modified = " ", removed = " " } },
      },
      lualine_c = {
        { "filename", path = 1, symbols = { modified = " ●", readonly = " ", unnamed = "" } },
      },
      lualine_x = {
        { "diagnostics", sources = { "nvim_lsp" }, symbols = { error = " ", warn = " ", info = " ", hint = " " } },
        { "filetype", icon_only = true },
        "encoding",
        "fileformat",
      },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { "filename" },
      lualine_x = { "location" },
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    extensions = { "fugitive", "neo-tree" },
  },
}