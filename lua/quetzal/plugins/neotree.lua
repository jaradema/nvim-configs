vim.pack.add({
  "https://github.com/MunifTanjim/nui.nvim",   -- neo-tree's UI library
  { src = "https://github.com/nvim-neo-tree/neo-tree.nvim",
    version = vim.version.range("3") },       -- stay on the stable 3.x line
})

require("neo-tree").setup({
  filesystem = {
    hijack_netrw_behavior = "disabled", -- let oil keep handling folders
    filtered_items = { visible = true }, -- show dotfiles, dimmed
  },
})

vim.keymap.set("n", "<leader>e", "<CMD>Neotree toggle<CR>", { desc = "Toggle file tree" })
