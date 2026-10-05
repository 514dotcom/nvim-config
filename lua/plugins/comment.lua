return {
  "numToStr/Comment.nvim",
  event = "BufReadPost",

  opts = {
    padding = true,
    sticky = true,
    ignore = nil,
    toggler = {
      line = "gcc",
      block = "gbc",
    },
    opleader = {
      line = "gc",
      block = "gb",
    },
  },
  keys = {
    { "gcc", mode = "n", desc = "Toggle comment (line)" },
    { "gbc", mode = "n", desc = "Toggle comment (block)" },
    { "gc", mode = "v", desc = "Toggle comment (line)" },
    { "gb", mode = "v", desc = "Toggle comment (block)" },
  },
}