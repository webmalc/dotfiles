return {
  "nvim-mini/mini.snippets",
  opts = function(_, opts)
    local ms = require("mini.snippets")

    vim.keymap.set("i", "<C-l>", function()
      ms.expand()
    end, { desc = "Expand snippet" })

    return opts
  end,
}
