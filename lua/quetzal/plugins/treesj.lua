vim.pack.add({ "https://github.com/wansmer/treesj"})
local treesj = require("treesj")
treesj.setup({ use_default_keymaps = false, })
vim.keymap.set("n", "<leader>m", treesj.toggle)
