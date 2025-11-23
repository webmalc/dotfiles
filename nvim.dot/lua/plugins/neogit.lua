return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim", -- optional, but highly recommended
      "nvim-telescope/telescope.nvim", -- optional, for picker
    },
    cmd = "Neogit",
    opts = {
      kind = "floating", --  "split", "vsplit","floating"
      signs = {
        section = { "", "" },
        item = { "", "" },
      },
      integrations = {
        diffview = true, -- enables nice diffview integration
        telescope = true,
      },
      -- disable built-in commit editor if you prefer LazyVim's default
      disable_commit_confirmation = true,
    },
    keys = {
      { "<leader>gg", "<cmd>Neogit<cr>", desc = "Neogit Status" },
      { "<leader>gc", "<cmd>Neogit commit<cr>", desc = "Neogit Commit" },
      { "<leader>gp", "<cmd>Neogit pull<cr>", desc = "Neogit Pull" },
      { "<leader>gP", "<cmd>Neogit push<cr>", desc = "Neogit Push" },
    },
  },
}
