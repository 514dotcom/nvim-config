return {
  "akinsho/toggleterm.nvim",
  event = "VeryLazy",

  opts = {
    size = function(term)
      if term.direction == "horizontal" then
        return 15
      elseif term.direction == "vertical" then
        return vim.o.columns * 0.35
      end
    end,
    open_mapping = nil, -- мы используем свои маппинги
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = "vertical",
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
      border = "rounded",
      winblend = 0,
      highlights = {
        border = "Normal",
        background = "Normal",
      },
    },
    highlights = {
      Normal = { link = "NormalFloat" },
      NormalFloat = { link = "NormalFloat" },
    },
  },

  config = function(_, opts)
    local toggleterm = require("toggleterm")
    toggleterm.setup(opts)

    -- Terminal management
    local Terminal = require("toggleterm.terminal").Terminal

    --- OpenCode Terminal (vertical split справа)
    local opencode_term = Terminal:new({
      cmd = "opencode mini",
      direction = "vertical",
      hidden = true,
      close_on_exit = false,
      on_open = function(term)
        vim.api.nvim_set_option_value("number", false, { buf = term.bufnr })
        vim.api.nvim_set_option_value("relativenumber", false, { buf = term.bufnr })
        vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })
        vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-h>", [[<Cmd>wincmd h<CR>]], { noremap = true, silent = true })
      end,
      on_close = function()
        -- При закрытии не делаем ничего особенного
      end,
    })

    --- Переключение OpenCode терминала
    local function toggle_opencode()
      opencode_term:toggle()
    end

    --- Открыть OpenCode с контекстом текущего файла
    local function opencode_current_buf()
      local buf = vim.api.nvim_get_current_buf()
      local fname = vim.api.nvim_buf_get_name(buf)
      local ft = vim.bo[buf].filetype

      -- Открываем терминал
      opencode_term:toggle()

      -- Ждем немного, пока терминал откроется
      vim.defer_fn(function()
        -- Отправляем команду с контекстом файла
        local lines = vim.api.nvim_buf_get_lines(buf, 0, math.min(50, vim.api.nvim_buf_line_count(buf)), false)
        local context = string.format("I'm working on `%s` (%s file). Here's my current code:\n\n```%s\n%s\n```\n\n",
          fname, ft, ft, table.concat(lines, "\n"))

        -- Отправляем в терминал opencode
        if opencode_term and vim.api.nvim_buf_is_valid(opencode_term.bufnr) then
          vim.api.nvim_buf_set_lines(opencode_term.bufnr, -1, -1, false, {})
          -- Вставляем контекст в буфер терминала
          vim.api.nvim_chan_send(vim.api.nvim_buf_get_var(opencode_term.bufnr, "terminal_job_id"), context)
        end
      end, 500)
    end

    -- Глобальные команды
    vim.api.nvim_create_user_command("OpenCodeToggle", toggle_opencode, {})
    vim.api.nvim_create_user_command("OpenCodeCurrentBuf", opencode_current_buf, {})

    -- Keymaps
    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }

    -- Основной тонгл OpenCode
    map("n", "<leader>ao", "<cmd>OpenCodeToggle<CR>", vim.tbl_extend("force", opts, { desc = "Toggle OpenCode Chat" }))
    map("n", "<leader>ac", "<cmd>OpenCodeCurrentBuf<CR>", vim.tbl_extend("force", opts, { desc = "OpenCode with current file" }))
    map("n", "<leader>at", "<cmd>ToggleTerm<CR>", vim.tbl_extend("force", opts, { desc = "Toggle terminal" }))
    map("n", "<leader>af", "<cmd>ToggleTerm direction=float<CR>", vim.tbl_extend("force", opts, { desc = "Floating terminal" }))

    -- Также из терминала можно выйти в обычный режим
    vim.api.nvim_set_keymap("t", "<leader>ao", "<cmd>OpenCodeToggle<CR>", { noremap = true, silent = true })

    -- Красивые border-ы для toggleterm
    vim.api.nvim_set_hl(0, "ToggleTermBorder", { link = "FloatBorder" })
  end,
}