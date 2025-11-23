return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim", -- Fixes CursorHold delays
    "nvim-treesitter/nvim-treesitter", -- Required for parsing
    "nvim-neotest/neotest-python",
  },
  opts = {
    adapters = {
      require("neotest-python")({
        runner = "pytest",
        -- pytest_discover_instances = true,
      }),
    },
    -- discovery = { enabled = false },
    -- quickfix = { open = false },
    -- output = { open_on_run = false },
  },
}
