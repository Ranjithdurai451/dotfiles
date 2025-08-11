return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      style = "night",
      transparent = true,
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
        sidebars = "transparent",
        floats = "dark",
      },
      on_highlights = function(hl, c)
        -- Core essentials
        hl.CursorLine = { bg = "NONE" }
        hl.CursorLineNr = { fg = c.orange, bold = true }

        -- Search (most important for your use case)
        hl.Search = { bg = c.orange, fg = c.bg_dark, bold = true }
        hl.IncSearch = { bg = c.yellow, fg = c.bg_dark, bold = true }
        hl.CurSearch = { bg = c.red, fg = c.bg_dark, bold = true }

        -- Floating windows
        hl.NormalFloat = { bg = c.bg_dark }
        hl.FloatBorder = { fg = c.blue0, bg = c.bg_dark }

        -- Only add plugin highlights as you install them
      end,
    })
    vim.cmd("colorscheme tokyonight")

    -- Essential settings
    vim.opt.termguicolors = true
    vim.opt.cursorline = true
    vim.opt.hlsearch = true
    vim.opt.incsearch = true
    vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
  end,
}
