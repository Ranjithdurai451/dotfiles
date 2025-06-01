return {
  "booperlv/nvim-gomove",
  config = function()
    require("gomove").setup({
      map_defaults = true, -- enables default plug commands
      reindent = true,
      undojoin = true,
      move_past_end_col = false,
    })

    -- Smart Move Mappings: Alt + Arrow Keys
    -- Normal mode smart move
    vim.keymap.set("n", "<A-Up>",    "<Plug>GoNSMUp",    { silent = true })
    vim.keymap.set("n", "<A-Down>",  "<Plug>GoNSMDown",  { silent = true })
    vim.keymap.set("n", "<A-Left>",  "<Plug>GoNSMLeft",  { silent = true })
    vim.keymap.set("n", "<A-Right>", "<Plug>GoNSMRight", { silent = true })

    -- Visual mode smart move
    vim.keymap.set("x", "<A-Up>",    "<Plug>GoVSMUp",    { silent = true })
    vim.keymap.set("x", "<A-Down>",  "<Plug>GoVSMDown",  { silent = true })
    vim.keymap.set("x", "<A-Left>",  "<Plug>GoVSMLeft",  { silent = true })
    vim.keymap.set("x", "<A-Right>", "<Plug>GoVSMRight", { silent = true })

    -- Smart Duplicate Mappings: Alt + Shift + Arrow Keys
    -- Normal mode smart duplicate
    vim.keymap.set("n", "<A-S-Up>",    "<Plug>GoNSDUp",    { silent = true })
    vim.keymap.set("n", "<A-S-Down>",  "<Plug>GoNSDDown",  { silent = true })
    vim.keymap.set("n", "<A-S-Left>",  "<Plug>GoNSDLeft",  { silent = true })
    vim.keymap.set("n", "<A-S-Right>", "<Plug>GoNSDRight", { silent = true })

    -- Visual mode smart duplicate
    vim.keymap.set("x", "<A-S-Up>",    "<Plug>GoVSDUp",    { silent = true })
    vim.keymap.set("x", "<A-S-Down>",  "<Plug>GoVSDDown",  { silent = true })
    vim.keymap.set("x", "<A-S-Left>",  "<Plug>GoVSDLeft",  { silent = true })
    vim.keymap.set("x", "<A-S-Right>", "<Plug>GoVSDRight", { silent = true })
  end,
}
