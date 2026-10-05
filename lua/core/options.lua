-- Core options
local opt = vim.opt
local g = vim.g

-- Leader key
g.mapleader = " "
g.maplocalleader = " "

-- Line numbers
opt.number = true
opt.relativenumber = true
opt.numberwidth = 2

-- Tabs & Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true

-- Line wrapping
opt.wrap = false

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Cursor
opt.cursorline = true
opt.cursorlineopt = "number"

-- Appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.showmode = false
opt.cmdheight = 0
opt.laststatus = 3 -- global statusline

-- Split behavior
opt.splitbelow = true
opt.splitright = true

-- Backup / Swap / Undo
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.undodir = vim.fn.stdpath("data") .. "/undo"

-- Clipboard
opt.clipboard = "unnamedplus"

-- Completion
opt.completeopt = { "menu", "menuone", "noselect" }

-- Folding
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 99
opt.foldenable = false

-- Mouse
opt.mouse = "a"

-- Timeout
opt.timeoutlen = 300
opt.ttimeoutlen = 0

-- Scrolling
opt.scrolloff = 8
opt.sidescrolloff = 8

-- NetRW
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- Disable built-in plugins
g.loaded_2html_plugin = 1
g.loaded_getscript = 1
g.loaded_getscriptPlugin = 1
g.loaded_man = 1
g.loaded_rrhelper = 1
g.loaded_shada_plugin = 1
g.loaded_spellfile_plugin = 1
g.loaded_tar = 1
g.loaded_tarPlugin = 1
g.loaded_zip = 1
g.loaded_zipPlugin = 1
g.loaded_vimball = 1
g.loaded_vimballPlugin = 1
g.loaded_matchit = 1
g.loaded_matchparen = 1
g.loaded_logiPat = 1
g.loaded_bufexplorer = 1
g.loaded_gzip = 1

-- Python provider
g.loaded_python_provider = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0
g.loaded_node_provider = 0