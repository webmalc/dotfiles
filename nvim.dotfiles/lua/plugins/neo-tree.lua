return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    event_handlers = {
      {
        event = "file_opened",
        handler = function(file_path)
          require("neo-tree.command").execute({ action = "close" })
        end,
      },
    },
    filesystem = {
      window = {
        fuzzy_finder_mappings = {
          ["<C-j>"] = "move_cursor_down",
          ["<C-k>"] = "move_cursor_up",
        },
      },
    },
  },
}
