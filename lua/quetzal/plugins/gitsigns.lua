vim.pack.add({ "https://github.com/lewis6991/gitsigns.nvim" })

require("gitsigns").setup({
  on_attach = function(bufnr)
    local gs = require("gitsigns")
    local function map(mode, keys, fn, desc)
      vim.keymap.set(mode, keys, fn, { buffer = bufnr, desc = desc })
    end

    -- Jump between changes
    map("n", "]h", function() gs.nav_hunk("next") end, "Next hunk")
    map("n", "[h", function() gs.nav_hunk("prev") end, "Previous hunk")

    -- Act on the change under the cursor
    map("n", "<leader>hs", gs.stage_hunk,   "Stage hunk")
    map("n", "<leader>hr", gs.reset_hunk,   "Reset hunk")
    map("n", "<leader>hp", gs.preview_hunk, "Preview hunk")
    map("n", "<leader>hb", function() gs.blame_line({ full = true }) end, "Blame line")
    map("n", "<leader>hd", gs.diffthis,     "Diff this file")

    -- Stage/reset only the line you've selected
    map("v", "<leader>hs", function()
      gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
    end, "Stage selection")
  end,
})
