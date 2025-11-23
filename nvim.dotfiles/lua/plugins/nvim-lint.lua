return {
  "mfussenegger/nvim-lint",
  optional = true,
  opts = {
    linters_by_ft = {
      python = { "ruff", "mypy" },
    },
    -- linters = {
    --   mypy = {
    --     args = {
    --       "--show-column-numbers",
    --       "--show-error-end",
    --       "--no-pretty",
    --       "--cache-dir=" .. os.getenv("HOME") .. "/.cache/mypy/nvim-lint",
    --     },
    --   },
    -- },
  },
}
