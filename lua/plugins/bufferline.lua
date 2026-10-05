return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",

  opts = {
    options = {
      mode = "buffers",
      themable = true,
      numbers = "none",
      close_command = "bdelete! %d",
      right_mouse_command = "bdelete! %d",
      left_mouse_command = "buffer %d",
      middle_mouse_command = nil,
      indicator = {
        icon = "▎",
        style = "icon",
      },
      buffer_close_icon = "",
      modified_icon = "●",
      close_icon = "",
      left_trunc_marker = "",
      right_trunc_marker = "",
      max_name_length = 18,
      max_prefix_length = 15,
      tab_size = 18,
      diagnostics = "nvim_lsp",
      diagnostics_update_in_insert = false,
      diagnostics_indicator = function(count, level)
        local icon = level:match("error") and " " or " "
        return icon .. count
      end,
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          highlight = "Directory",
          separator = true,
        },
      },
      separator_style = "thin",
      enforce_regular_tabs = false,
      always_show_bufferline = true,
      sort_by = "insert_after_current",
    },
  },
  keys = {
    { "<Tab>", "<cmd>BufferLineCycleNext<CR>", desc = "Next buffer" },
    { "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", desc = "Prev buffer" },
    { "<leader>bd", "<cmd>bdelete<CR>", desc = "Delete buffer" },
    { "<leader>ba", "<cmd>%bdelete|e#|bdelete#<CR>", desc = "Delete all buffers" },
  },
}