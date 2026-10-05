return {
  "folke/which-key.nvim",
  event = "VeryLazy",

  opts = {
    preset = "helix",
    icons = {
      breadcrumb = "»",
      separator = "➜",
      group = " ",
    },
    spec = {
      { "<leader>a", group = "  AI / OpenCode" },
      { "<leader>f", group = "  Find" },
      { "<leader>g", group = "  Git" },
      { "<leader>l", group = "  LSP" },
      { "<leader>s", group = "󰘳  Split / Search" },
      { "<leader>t", group = "󰚰  Terminal / Tab" },
      { "<leader>d", group = "  Diagnostics" },
      { "[", group = "prev" },
      { "]", group = "next" },
    },
  },

  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.register({
      ["<leader>"] = {
        a = {
          name = "OpenCode",
          o = { "<cmd>OpenCodeToggle<CR>", "Toggle OpenCode Chat" },
          c = { "<cmd>OpenCodeCurrentBuf<CR>", "OpenCode from current file" },
        },
      },
    })
  end,
}