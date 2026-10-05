return {
  "goolord/alpha-nvim",
  event = "VimEnter",

  opts = function()
    local dashboard = require("alpha.themes.dashboard")
    local logo = [[
      ████ ██████ ████████ █████
     ████████████████ █████
     ████████████ ██  ███  ███
    ██████████████  █   █  ███
    ████████  █████  █   █  █████
     █████   ████   █ ███████
      █████    ███    █████████
      █████     ██     ███████
    ]]

    dashboard.section.header.val = vim.split(logo, "\n")
    dashboard.section.header.opts = {
      hl = "Title",
      shrink_margin = false,
      position = "center",
    }

    dashboard.section.buttons.val = {
      dashboard.button("e", "  New File", "<cmd>ene!<CR>"),
      dashboard.button("f", "  Find File", "<cmd>Telescope find_files<CR>"),
      dashboard.button("r", "  Recent Files", "<cmd>Telescope oldfiles<CR>"),
      dashboard.button("g", "  Live Grep", "<cmd>Telescope live_grep<CR>"),
      dashboard.button("t", "󰚰  Terminal", "<cmd>ToggleTerm direction=float<CR>"),
      dashboard.button("o", "  OpenCode", "<cmd>OpenCodeToggle<CR>"),
      dashboard.button("q", "󰅚  Quit", "<cmd>qa<CR>"),
    }

    dashboard.section.footer.val = {
      "",
      "󱥇  OpenCode ready — press SPC a o to chat",
    }
    dashboard.section.footer.opts = {
      hl = "Comment",
      position = "center",
    }

    dashboard.opts.layout = {
      { type = "padding", val = 2 },
      dashboard.section.header,
      { type = "padding", val = 2 },
      dashboard.section.buttons,
      { type = "padding", val = 1 },
      dashboard.section.footer,
    }

    dashboard.opts.opts.noautocmd = true

    return dashboard
  end,

  config = function(_, dashboard)
    -- close Lazy and re-evaluate
    require("alpha").setup(dashboard.opts)

    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyVimStarted",
      callback = function()
        dashboard.section.footer.val = {
          "",
          "󰥨  Loaded " .. require("lazy").stats().loaded .. "/" .. require("lazy").stats().count .. " plugins",
        }
        pcall(vim.cmd.AlphaRedraw)
      end,
    })
  end,
}