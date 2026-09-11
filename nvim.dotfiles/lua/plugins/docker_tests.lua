return {
  {
    "docker_tests",
    dir = "~/Projects/dotfiles/nvim/plugins/docker_tests",
    lazy = true,
    event = "VeryLazy",
    config = function()
      require("docker_tests").setup({})
    end,
  },
}
