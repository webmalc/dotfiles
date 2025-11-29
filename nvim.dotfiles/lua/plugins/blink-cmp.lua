return {
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        preset = "default",
        ["<C-j>"] = { "select_next", "fallback" },
        ["<C-k>"] = { "select_prev", "fallback" },
        ["<Tab>"] = { "select_and_accept", "fallback" },
      },
    },
  },
}
