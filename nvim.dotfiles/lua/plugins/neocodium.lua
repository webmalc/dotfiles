return {
  "monkoose/neocodeium",
  event = "VeryLazy",
  config = function()
    local neocodeium = require("neocodeium")
    neocodeium.setup({
      -- manual = true,
      debounce = true,
    })
    vim.keymap.set("i", "<A-f>", neocodeium.accept)
    vim.keymap.set("i", "<A-e>", neocodeium.accept_word)
    vim.keymap.set("i", "<A-d>", neocodeium.accept_line)
    vim.keymap.set("i", "<A-y>", neocodeium.cycle_or_complete)
    -- vim.keymap.set("i", "<A-f>", neocodeium.accept)
    -- vim.keymap.set("i", "<A-f>", neocodeium.accept)
    -- vim.keymap.set("i", "<A-f>", neocodeium.accept)
    --
    -- local blink = require("blink.cmp")
    --
    -- vim.api.nvim_create_autocmd("User", {
    --   pattern = "BlinkCmpMenuOpen",
    --   callback = function()
    --     neocodeium.clear()
    --   end,
    -- })
    --
    -- neocodeium.setup({
    --   filter = function()
    --     return not blink.is_visible()
    --   end,
    -- })
  end,
}
