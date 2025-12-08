return {
  "monkoose/neocodeium",
  event = "VeryLazy",
  config = function()
    local neocodeium = require("neocodeium")
    neocodeium.setup()
    vim.keymap.set("i", "<A-f>", neocodeium.accept)
    vim.keymap.set("i", "<A-e>", neocodeium.accept_word)
    vim.keymap.set("i", "<A-d>", neocodeium.accept_line)
    vim.keymap.set("i", "<A-y>", neocodeium.cycle_or_complete)
    -- vim.keymap.set("i", "<A-f>", neocodeium.accept)
    -- vim.keymap.set("i", "<A-f>", neocodeium.accept)
    -- vim.keymap.set("i", "<A-f>", neocodeium.accept)
  end,
}
