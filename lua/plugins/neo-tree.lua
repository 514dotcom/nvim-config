return {
  "nvim-neo-tree/neo-tree.nvim",
  event = "VeryLazy",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },

  opts = {
    enable_at_startup = false,
    use_popups_for_input = true,
    close_if_last_window = false,
    enable_git_status = true,
    enable_diagnostics = true,
    enable_modified_markers = true,
    hide_root_node = false,
    respect_buf_cwd = true,
    auto_clean_after_session_restore = false,
    auto_show_after_session_restore = false,
    auto_show_after_session_restore_ignore_dirty = true,
    sort_case_insensitive = true,
    sort_function = nil,
    default_source = "filesystem",

    sources = {
      "filesystem",
      "buffers",
      "git_status",
    },

    source_selector = {
      winbar = false,
      statusline = false,
      content_layout = "center",
      tab_labels = {
        filesystem = "  Files",
        buffers = "  Bufs",
        git_status = "  Git",
      },
    },

    renderers = {
      directory = {
        { "indent" },
        { "icon" },
        { "current_filter" },
        {
          "container",
          content = function()
            return "  "
          end,
        },
        { "name" },
        {
          "clipboard",
          highlight = "NeoTreeClipboardIndicator",
        },
      },
      file = {
        { "indent" },
        { "icon" },
        { "name" },
        {
          "container",
          content = function()
            return "  "
          end,
        },
        { "diagnostics" },
        { "git_status" },
      },
    },

    window = {
      position = "left",
      width = 32,
      height = 15,
      auto_expand_width = false,
      popup = {
        size = {
          height = "80%",
          width = "60%",
        },
        position = "50%",
        animation = {
          type = "fade",
          speed = 20,
        },
      },
      mappings = {
        ["<space>"] = {
          command = "toggle_node",
          nowait = false,
        },
        ["<2-LeftMouse>"] = "open",
        ["<cr>"] = "open",
        ["o"] = "open",
        ["t"] = "open_tabnew",
        ["w"] = "open_with_window_picker",
        ["p"] = "add",
        ["C"] = "close_all_subnodes",
        ["z"] = "close_all_nodes",
        ["a"] = {
          command = "add",
          nowait = true,
        },
        ["d"] = "delete",
        ["r"] = "rename",
        ["y"] = "copy_to_clipboard",
        ["x"] = "cut_to_clipboard",
        ["c"] = "copy_from_clipboard",
        ["m"] = "move",
        ["q"] = "close_window",
        ["R"] = "refresh",
        ["?"] = "show_help",
        ["<"] = "prev_source",
        [">"] = "next_source",
        ["S"] = "split_with_window_picker",
        ["s"] = "open_vsplit",
        ["h"] = "toggle_hidden",
        ["I"] = "toggle_gitignore",
        ["H"] = "toggle_hidden",
        ["i"] = "show_file_details",
      },
    },

    filesystem = {
      follow_current_file = {
        enabled = true,
        leave_dirs_open = false,
      },
      hijack_netrw_behavior = "open_default",
      use_libuv_file_watcher = true,
      window = {
        mappings = {
          ["H"] = "toggle_hidden",
          ["/"] = "fuzzy_finder",
          ["d"] = "fuzzy_finder_directory",
          ["f"] = "filter_on_submit",
          ["<C-5>"] = "refresh",
          ["."] = "set_root",
          ["[g"] = "prev_git_modified",
          ["]g"] = "next_git_modified",
        },
      },
      async_directory_scan = "auto",
    },

    buffers = {
      follow_current_file = {
        enabled = true,
        leave_dirs_open = false,
      },
      group_empty_dirs = true,
      show_unloaded = false,
      window = {
        mappings = {
          ["bd"] = "buffer_delete",
          ["<s-cr>"] = "open_split",
          ["<m-cr>"] = "open_vsplit",
        },
      },
    },

    git_status = {
      window = {
        position = "float",
        mappings = {
          ["A"] = "git_add_all",
          ["gu"] = "git_unstage_all",
          ["ga"] = "git_add_all",
          ["gr"] = "git_unstage_all",
          ["a"] = "git_add",
          ["u"] = "git_unstage",
        },
      },
    },

    event_handlers = {
      {
        event = "neo_tree_window_after_open",
        handler = function()
          vim.cmd("wincmd =")
        end,
      },
    },

    -- Hide boring file patterns
    filtered_items = {
      visible = false,
      show_hidden_count = true,
      hide_dotfiles = false,
      hide_gitignore = false,
      hide_by_name = {
        ".DS_Store",
        "thumbs.db",
        "node_modules",
        "__pycache__",
        ".git",
      },
      never_show = {},
    },

    -- Git symbols
    git_status = {
      symbols = {
        added = " ",
        deleted = " ",
        modified = " ",
        renamed = " ",
        staged = " ",
        untracked = " ",
        ignored = " ",
        unstaged = " ",
        conflict = " ",
      },
    },
  },

  config = function(_, opts)
    require("neo-tree").setup(opts)

    -- Keymaps
    local map = vim.keymap.set
    map("n", "<leader>e", "<cmd>Neotree toggle<CR>", { noremap = true, silent = true, desc = "Toggle file tree" })
    map("n", "<leader>ef", "<cmd>Neotree focus<CR>", { noremap = true, silent = true, desc = "Focus file tree" })
    map("n", "<leader>eb", "<cmd>Neotree buffers<CR>", { noremap = true, silent = true, desc = "File tree buffers" })
    map("n", "<leader>eg", "<cmd>Neotree git_status<CR>", { noremap = true, silent = true, desc = "File tree git" })
    map("n", "<leader>er", "<cmd>Neotree reveal<CR>", { noremap = true, silent = true, desc = "Reveal file in tree" })
  end,
}