local opts = {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim", "lvim", "nvim"},
      },
      workspace = {
        library = {
          [require("lvim.utils").join_paths(get_runtime_dir(), "lvim", "lua")] = true,
          [require("lvim.utils").join_paths(get_runtime_dir(), "lua")] = true,
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
}
return opts
