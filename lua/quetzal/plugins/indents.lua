vim.pack.add({ "https://github.com/lukas-reineke/indent-blankline.nvim" })

require("ibl").setup({
  indent = { char = "│" },
  scope = {
    enabled = true,
    show_start = false, -- no underline at the top of the block
    show_end = false,
  },
})
