return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "williamboman/mason.nvim",
    { "j-hui/fidget.nvim", opts = {} },
    { "folke/neodev.nvim", opts = {} },
  },

  opts = {
    servers = {
      lua_ls = {
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = { enable = false },
          },
        },
      },
      ts_ls = {},
      eslint = {},
      jsonls = {},
      yamlls = {},
      html = {},
      cssls = {},
      tailwindcss = {},
      pyright = {},
      gopls = {},
      rust_analyzer = {},
      svelte = {},
    },
  },

  config = function(_, opts)
    -- Setup mason-lspconfig to install servers
    local mlsp = require("mason-lspconfig")
    mlsp.setup({
      ensure_installed = vim.tbl_keys(opts.servers),
      automatic_installation = true,
    })

    -- LSP keymaps
    local map = vim.keymap.set
    local bufopts = { noremap = true, silent = true, buffer = true }

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
      callback = function(event)
        -- Buffer-local keymaps
        map("n", "gd", function() vim.lsp.buf.definition() end, bufopts)
        map("n", "gD", function() vim.lsp.buf.declaration() end, bufopts)
        map("n", "gi", function() vim.lsp.buf.implementation() end, bufopts)
        map("n", "go", function() vim.lsp.buf.type_definition() end, bufopts)
        map("n", "gr", function() vim.lsp.buf.references() end, bufopts)
        map("n", "K", function() vim.lsp.buf.hover() end, bufopts)
        map("n", "<C-k>", function() vim.lsp.buf.signature_help() end, bufopts)
        map("n", "<leader>ca", function() vim.lsp.buf.code_action() end, bufopts)
        map("n", "<leader>rn", function() vim.lsp.buf.rename() end, bufopts)
        map("n", "<leader>d", function() vim.diagnostic.open_float() end, bufopts)
        map("n", "[d", function() vim.diagnostic.goto_next() end, bufopts)
        map("n", "]d", function() vim.diagnostic.goto_prev() end, bufopts)
        map("n", "<leader>wa", function() vim.lsp.buf.add_workspace_folder() end, bufopts)
        map("n", "<leader>wr", function() vim.lsp.buf.remove_workspace_folder() end, bufopts)
        map("n", "<leader>wl", function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, bufopts)

        -- If the user has trouble with quickfix, use LocationList instead
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.server_capabilities.documentHighlightProvider then
          local group = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
          vim.api.nvim_clear_autocmds({ buffer = event.buf, group = group })
          vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            group = group,
            buffer = event.buf,
            callback = vim.lsp.buf.document_highlight,
          })
          vim.api.nvim_create_autocmd("CursorMoved", {
            group = group,
            buffer = event.buf,
            callback = vim.lsp.buf.clear_references,
          })
        end
      end,
    })

    -- Diagnostic signs
    local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    vim.diagnostic.config({
      virtual_text = {
        prefix = "●",
        severity = { min = vim.diagnostic.severity.WARN },
      },
      float = {
        border = "rounded",
        source = "if_many",
        header = "",
        prefix = "",
      },
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
    })

    -- Setup servers
    local lspconfig = require("lspconfig")
    for server, cfg in pairs(opts.servers) do
      local has_capabilities, capabilities = pcall(require, "cmp_nvim_lsp")
      if has_capabilities then
        cfg.capabilities = capabilities.default_capabilities()
      end

      -- Check if the server exists in lspconfig
      if lspconfig[server] then
        lspconfig[server].setup(cfg)
      end
    end
  end,
}