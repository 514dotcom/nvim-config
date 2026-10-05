return {
  "folke/noice.nvim",
  event = "VeryLazy",

  opts = {
    lsp = {
      override = {
        "vim.lsp.protocol()",
        "textDocument/codeAction",
      },
      hover = {
        enabled = true,
        silent = true,
      },
      signature = {
        enabled = true,
        auto_open = {
          enabled = true,
          trigger = true,
          luasnip = true,
        },
      },
      progress = {
        enabled = true,
        format = "lsp_progress",
        format_done = "lsp_progress_done",
      },
    },
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
      inc_rename = true,
      lsp_doc_border = true,
    },
    messages = {
      view = "mini",
      view_error = "mini",
      view_warn = "mini",
    },
    popupmenu = {
      enabled = true,
      backend = "nui",
    },
    notify = {
      enabled = true,
      view = "mini",
    },
    views = {
      cmdline_popup = {
        position = {
          row = "50%",
          col = "50%",
        },
        size = {
          min_width = 60,
          width = "auto",
          height = "auto",
        },
      },
    },
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
}