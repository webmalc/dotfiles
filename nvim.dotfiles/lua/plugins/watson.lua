return {
  {
    "watson",
    dir = "~/Projects/dotfiles/nvim/plugins/watson",
    config = function()
      require("watson").setup({})
    end,
  },
}
