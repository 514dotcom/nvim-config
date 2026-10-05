return {
  "folke/todo-comments.nvim",
  event = "BufReadPost",

  opts = {
    colors = {
      error = { "DiagnosticError", "ErrorMsg", "#DB4B4B" },
      warning = { "DiagnosticWarn", "WarnMsg", "#E9A838" },
      info = { "DiagnosticInfo", "#5FC0DD" },
      hint = { "DiagnosticHint", "#7ECB8E" },
      default = { "Identifier", "#7ECB8E" },
      test = { "Identifier", "#FF007C" },
    },
    keywords = {
      FIX = { icon = " ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
      TODO = { icon = " ", color = "info" },
      HACK = { icon = " ", color = "warning" },
      WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
      PERF = { icon = " ", color = "hint", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
      NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
      TEST = { icon = " ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
    },
    search = { -- used by todo-comments telescope picker
      command = "rg",
      args = {
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
      },
    },
  },
  keys = {
    { "<leader>st", "<cmd>TodoTelescope<CR>", desc = "Todo Comments" },
  },
}