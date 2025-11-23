return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      event_handlers = {
        {
          event = "file_opened",
          handler = function(file_path)
            -- This closes neo-tree when you open a file (exactly like NERDTreeQuitOnOpen = 1)
            require("neo-tree.command").execute({ action = "close" })
          end,
        },
      },
    },
  },
}
