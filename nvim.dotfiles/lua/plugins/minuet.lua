return {
  {
    "milanglacier/minuet-ai.nvim",
    config = function()
      vim.uv.new_timer():start(0, 1000 * 60 * 4, function()
        -- vim.system({ "ollama", "run", "qwen2.5-coder:1.5b", "<", "/dev/null" })
        vim.system({ "ollama", "run", "qwen2.5-coder:7b", "<", "/dev/null" })
        -- vim.system({ "ollama", "run", "qwen3-coder:30b-a3b-q4_K_M", "<", "/dev/null" })
      end)
      require("minuet").setup({
        blink = {
          enable_auto_complete = false,
        },
        -- virtualtext = {
        --   auto_trigger_ft = {},
        --   keymap = {
        --     -- accept whole completion
        --     accept = "<A-A>",
        --     -- accept one line
        --     accept_line = "<A-a>",
        --     -- accept n lines (prompts for number)
        --     -- e.g. "A-z 2 CR" will accept 2 lines
        --     accept_n_lines = "<A-z>",
        --     -- Cycle to prev completion item, or manually invoke completion
        --     prev = "<A-[>",
        --     -- Cycle to next completion item, or manually invoke completion
        --     next = "<A-]>",
        --     dismiss = "<A-e>",
        --   },
        -- },
        provider = "openai_fim_compatible",
        n_completions = 1,
        context_window = 32000, -- default: 2048 up to 32k
        -- context_window = 2048, -- default: 2048 up to 32k
        request_timeout = 1,
        debounce = 200, --default 600
        -- throttle = 1500,

        provider_options = {
          openai_fim_compatible = {
            api_key = "TERM", -- Placeholder; uses $TERM env var
            name = "Ollama",
            end_point = "http://localhost:11434/v1/completions",
            -- model = "qwen3-coder:30b-a3b-q4_K_M",
            -- model = "qwen2.5-coder:1.5b",
            model = "qwen2.5-coder:7b",
            optional = {
              max_tokens = 300,
              top_p = 0.3, -- default: 0.9
            },
          },
        },
      })
    end,
  },
  {
    "saghen/blink.cmp",
    optional = true,
    opts = {
      keymap = {
        ["<A-y>"] = {
          function(cmp)
            cmp.show({ providers = { "minuet" } })
          end,
        },
      },
      sources = {
        default = { "minuet" },
        providers = {
          minuet = {
            name = "minuet",
            module = "minuet.blink",
            score_offset = 100,
          },
        },
      },
    },
  },
}
