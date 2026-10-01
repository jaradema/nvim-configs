-- Must come BEFORE vim.pack.add so it catches the first install
vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == "telescope-fzf-native.nvim" and (kind == "install" or kind == "update") then
      vim.system({ "make" }, { cwd = ev.data.path }):wait()
    end
  end,
})

vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/nvim-telescope/telescope.nvim",
  "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
})

local telescope = require("telescope")
telescope.setup({})
telescope.load_extension("fzf")

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep,  { desc = "Search text" })
vim.keymap.set("n", "<leader>fb", builtin.buffers,    { desc = "Open buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags,  { desc = "Search :help" })

vim.pack.add({
  "https://github.com/MunifTanjim/nui.nvim",   -- neo-tree's UI library
  { src = "https://github.com/nvim-neo-tree/neo-tree.nvim",
    version = vim.version.range("3") },       -- stay on the stable 3.x line
})
