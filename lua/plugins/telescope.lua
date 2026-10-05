return {
  "nvim-telescope/telescope.nvim",
  event = "VeryLazy",
  cmd = "Telescope",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-telescope/telescope-ui-select.nvim",
    "nvim-tree/nvim-web-devicons",
  },

  opts = {
    defaults = {
      layout_strategy = "horizontal",
      layout_config = {
        prompt_position = "top",
        horizontal = {
          width = 0.85,
          height = 0.80,
          preview_width = 0.55,
        },
        vertical = {
          width = 0.85,
          height = 0.90,
          preview_height = 0.5,
        },
      },
      sorting_strategy = "ascending",
      winblend = 0,
      border = {},
      borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
      color_devicons = true,
      set_env = { ["COLORTERM"] = "truecolor" },
      file_ignore_patterns = {
        "node_modules",
        ".git/",
        ".cache",
        "%.o",
        "%.a",
        "%.so",
        "%.class",
        "%.pyc",
        "__pycache__",
        "%.jpg",
        "%.jpeg",
        "%.png",
        "%.gif",
        "%.ico",
        "%.pdf",
        "%.zip",
        "%.tar",
        "%.gz",
      },
      mappings = {
        i = {
          ["<C-j>"] = "move_selection_next",
          ["<C-k>"] = "move_selection_previous",
          ["<C-n>"] = "cycle_history_next",
          ["<C-p>"] = "cycle_history_prev",
          ["<C-c>"] = "close",
          ["<Esc>"] = "close",
        },
      },
    },
    pickers = {
      find_files = {
        theme = "dropdown",
        previewer = true,
        hidden = true,
      },
      live_grep = {
        theme = "ivy",
      },
      grep_string = {
        theme = "ivy",
      },
      buffers = {
        theme = "dropdown",
        previewer = false,
        initial_mode = "normal",
        mappings = {
          i = {
            ["<C-d>"] = "delete_buffer",
          },
          n = {
            ["dd"] = "delete_buffer",
          },
        },
      },
      oldfiles = {
        theme = "dropdown",
      },
    },
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      },
    },
  },

  config = function(_, opts)
    local telescope = require("telescope")
    telescope.setup(opts)

    -- Load extensions
    pcall(telescope.load_extension, "fzf")
    pcall(telescope.load_extension, "ui-select")

    -- Keymaps
    local map = vim.keymap.set
    local builtin = require("telescope.builtin")

    map("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
    map("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
    map("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
    map("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
    map("n", "<leader>fo", builtin.oldfiles, { desc = "Recent files" })
    map("n", "<leader>fz", builtin.current_buffer_fuzzy_find, { desc = "Fuzzy find in buffer" })
    map("n", "<leader>fc", builtin.commands, { desc = "Commands" })
    map("n", "<leader>fk", builtin.keymaps, { desc = "Keymaps" })
    map("n", "<leader>fs", builtin.treesitter, { desc = "Treesitter symbols" })
    map("n", "<leader>fw", builtin.grep_string, { desc = "Grep word under cursor" })
    map("n", "gr", builtin.lsp_references, { desc = "LSP References" })
    map("n", "gd", builtin.lsp_definitions, { desc = "LSP Definitions" })
  end,
}