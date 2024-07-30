return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {},  -- Leave this empty or add non-conflicting servers
        automatic_installation = false  -- Disable automatic installation
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      -- LSP commands
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})
      -- Languages
      -- Lua
      lspconfig.lua_ls.setup({
        cmd = { "lua-language-server" },  -- Use the NixOS-provided server
      })
      -- Rust
      lspconfig.rust_analyzer.setup({
        cmd = { "rust-analyzer" },
        settings = {
          ['rust-analyzer'] = {}
        }
      })
      -- C/C++
      lspconfig.clangd.setup({
        cmd = { "clangd" },
        on_attach = on_attach,
      })
      -- Kotlin
      lspconfig.kotlin_language_server.setup({
        cmd = { "kotlin-language-server" },
        on_attach = on_attach,
      })
    end
  }
}
