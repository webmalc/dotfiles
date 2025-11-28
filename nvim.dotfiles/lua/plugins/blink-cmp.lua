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
      -- sources = {
      --   -- Enable minuet for autocomplete
      --   default = { "lsp", "path", "buffer", "snippets", "minuet" },
      --   -- For manual completion only, remove 'minuet' from default
      --   providers = {
      --     minuet = {
      --       name = "minuet",
      --       module = "minuet.blink",
      --       async = true,
      --       timeout_ms = 3000,
      --       score_offset = 50, -- Gives minuet higher priority among suggestions
      --     },
      --   },
      -- },
      -- -- Recommended to avoid unnecessary request
      -- completion = { trigger = { prefetch_on_insert = false } },
    },
  },
}
