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

local function git_commit(paths)
  vim.ui.input({ prompt = "Commit message: " }, function(msg)
    if not msg or msg == "" then return end -- Esc or empty = cancel

    local cmd = { "git", "commit", "-m", msg }
    if paths then
      table.insert(cmd, "--")
      vim.list_extend(cmd, paths)
    end

    -- Run git from the current file's folder so it finds the right repo
    local dir = vim.fn.expand("%:p:h")
    if vim.fn.isdirectory(dir) == 0 then dir = nil end

    vim.system(cmd, { text = true, cwd = dir }, function(res)
      vim.schedule(function()
        local out = vim.trim(res.stdout .. res.stderr)
        vim.notify(out, res.code == 0 and vim.log.levels.INFO or vim.log.levels.ERROR)
        require("gitsigns").refresh()
      end)
    end)
  end)
end

-- Commit whatever is staged (the hunks you picked)
vim.keymap.set("n", "<leader>gC", function() git_commit() end,
  { desc = "Commit staged" })

-- Commit this entire file, ignoring anything else that's staged
vim.keymap.set("n", "<leader>gF", function()
  git_commit({ vim.fn.expand("%:p") })
end, { desc = "Commit this file" })
