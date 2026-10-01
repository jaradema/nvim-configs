vim.pack.add({
  "https://github.com/stevearc/oil.nvim",
  "https://github.com/nvim-tree/nvim-web-devicons", -- file icons (optional)
})

require("oil").setup({
  default_file_explorer = true,
  columns = { "icon" },
  view_options = { show_hidden = true },
  float = {
    padding = 2,
    max_width = 90,
    max_height = 30,
    border = "rounded",
    win_options = {
      winhighlight = "NormalFloat:OilFloat,FloatBorder:OilFloatBorder",
    },
  },
  keymaps = {
    ["q"] = { "actions.close", mode = "n" },
  },
})

vim.keymap.set("n", "-", function() require("oil").open_float() end,
  { desc = "Open parent directory (float)" })
