return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
      servers = {
        gopls = {
          settings = {
            gopls = {
              staticcheck = false,
            },
          },
        },
        pyright = {
          settings = {
            python = {
              analysis = {
                autoSearchPaths = true,
                diagnosticMode = "off",
                typeCheckingMode = "off",
                useLibraryCodeForTypes = true,
                diagnosticSeverityOverrides = {
                  reportUnusedVariable = "none",
                  reportUnusedImport = "none",
                  reportMissingImports = "none",
                  reportPrivateImportUsage = "none",
                },
              },
            },
            pyright = {
              disableTaggedHints = true,
              disableOrganizeImports = true,
            },
          },
        },
      },
    },
  },
}
