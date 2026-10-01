vim.pack.add({
  "https://github.com/EdenEast/nightfox.nvim",
  "https://github.com/nvim-lualine/lualine.nvim",
})

require("nightfox").setup({
  options = {
    transparent = true,     -- clears the main editor background
    terminal_colors = true, -- :terminal uses the theme's colors
  },
  groups = {
    all = {
      -- Anything transparent = true doesn't cover
      SignColumn   = { bg = "NONE" },
      FoldColumn   = { bg = "NONE" },
      LineNr       = { bg = "NONE" },
      EndOfBuffer  = { bg = "NONE" },
      StatusLine   = { bg = "NONE" },
      StatusLineNC = { bg = "NONE" },
      MsgArea      = { bg = "NONE" },
      TinyCmdlineNormal = { bg = "NONE" },
      TinyCmdlineBorder = { bg = "NONE" },
      IblIndent = { fg = "#305050" }, -- regular guides, subtle
      IblScope  = { fg = "#356060" }, -- current block, brighter
      OilFloat = { bg = "NONE" },
      OilFloatBorder = { fg = "palette.fg3", bg = "NONE" },
      NeoTreeNormal       = { bg = "NONE" },
      NeoTreeNormalNC     = { bg = "NONE" },
      NeoTreeEndOfBuffer  = { bg = "NONE" },
    },
  },
})

vim.cmd.colorscheme("carbonfox")

local theme = require("lualine.themes.carbonfox")

require("lualine").setup({
  options = { theme = theme },
})
