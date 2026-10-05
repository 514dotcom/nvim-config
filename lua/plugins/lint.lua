return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPost", "BufNewFile" },

  opts = {
    linters_by_ft = {
      markdown = {},
      python = { "pylint", "ruff" },
      javascript = { "eslint" },
      typescript = { "eslint" },
      javascriptreact = { "eslint" },
      typescriptreact = { "eslint" },
      lua = { "selene" },
      go = { "golangcilint" },
      rust = { "clippy_check" },
      yaml = {},
      json = {},
      css = { "stylelint" },
      scss = { "stylelint" },
      html = {},
      sh = { "shellcheck" },
      bash = { "shellcheck" },
      zsh = {},
      sql = { "sqllint" },
    },
  },

  config = function(_, opts)
    local lint = require("lint")
    lint.linters_by_ft = opts.linters_by_ft

    -- Auto-lint on save
    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
      callback = function()
        lint.try_lint()
      end,
    })

    -- Toggle lint
    local lint_on = true
    vim.api.nvim_create_user_command("LintToggle", function()
      lint_on = not lint_on
      if lint_on then
        vim.api.nvim_create_autocmd({ "BufWritePost" }, {
          group = "nvim-lint",
          callback = function()
            lint.try_lint()
          end,
        })
        vim.notify("  Lint enabled")
      else
        vim.api.nvim_del_augroup_by_name("nvim-lint")
        vim.notify("  Lint disabled")
      end
    end, {})

    vim.keymap.set("n", "<leader>ll", "<cmd>LintToggle<CR>", { noremap = true, silent = true, desc = "Toggle linter" })
  end,
}