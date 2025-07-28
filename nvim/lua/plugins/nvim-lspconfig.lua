#return {}
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          mason = false,
          autostart = false,
        },
      },
    },
  },
}
--return {
--  "neovim/nvim-lspconfig",
--  opts = {
--    servers = {
--      pylsp = {
--        settings = {
--          pylsp = {
--            plugins = {
--              pyflakes = { enabled = false },
--            },
--          },
--        },
--      },
--    },
--  },
--}
