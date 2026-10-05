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
        e = {
          name = "File Tree",
          e = { "<cmd>Neotree toggle<CR>", "Toggle file tree" },
          f = { "<cmd>Neotree focus<CR>", "Focus file tree" },
          b = { "<cmd>Neotree buffers<CR>", "File tree buffers" },
          g = { "<cmd>Neotree git_status<CR>", "File tree git status" },
          r = { "<cmd>Neotree reveal<CR>", "Reveal current file" },
        },
        l = {
          name = "Lint",
          l = { "<cmd>LintToggle<CR>", "Toggle linter" },
        },
      },
    })
  end,
}