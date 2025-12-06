return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim", -- Fixes CursorHold delays
    "nvim-treesitter/nvim-treesitter", -- Required for parsing
    "nvim-neotest/neotest-python",
    "fredrikaverpil/neotest-golang",
  },
  opts = {
    adapters = {
      require("neotest-python")({
        runner = "pytest",
        args = { "-v" },
        -- pytest_discover_instances = true,
      }),
      ["neotest-golang"] = {
        -- Here we can set options for neotest-golang, e.g.
        -- go_test_args = { "-v", "-race", "-count=1", "-timeout=60s" },
        dap_go_enabled = true, -- requires leoluz/nvim-dap-go
      },
    },
    -- discovery = { enabled = false },
    -- quickfix = { open = false },
    -- output = { open_on_run = false },
  },
}
