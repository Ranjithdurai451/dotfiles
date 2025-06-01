return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000, -- Ensure it's loaded early
  config = function()
    require("tokyonight").setup({
      style = "night",
      transparent = true,
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
        sidebars = "transparent",
        floats = "transparent",
      },
      on_highlights = function(hl, c)
        -- Make CursorLine transparent (for better current line visibility)
        hl.CursorLine = { bg = "NONE" }

        -- Highlight the current line number distinctly
        hl.CursorLineNr = { fg = c.orange, bold = true }

        -- Improve search highlight colors
        hl.Search = { bg = c.orange, fg = c.bg, bold = true }
        hl.IncSearch = { bg = c.yellow, fg = c.bg, bold = true }

        -- Better matching word highlight
        hl.MatchParen = { bg = c.bg_highlight, fg = c.orange, bold = true }

        -- Visual selection tweaks
        hl.Visual = { bg = c.bg_highlight }
      end,
    })
    vim.cmd("colorscheme tokyonight") -- Explicitly apply the theme

    -- Additional UI settings for better experience
    vim.opt.cursorline = true -- Highlight the current line
    vim.opt.hlsearch = true -- Keep search highlight enabled
    vim.opt.incsearch = true -- Incremental search
    vim.opt.termguicolors = true -- Ensure full color support
  end,
}
