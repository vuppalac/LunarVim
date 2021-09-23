
if lvim.lsp.cpp.provider == "ccls" then
  lvim.lang.c = {
    formatters = { },
    linters = {},
    lsp = {
      provider = "ccls",
      setup = {
        cmd = lvim.lsp.cpp.cmd
        -- cmd = {
        --   ls_install_prefix .. "/lspinstall/cpp/ccls/bin/ccls",
        --   '--init={"compilationDatabaseDirectory": "build_el7_2020_05", "index": {"threads": 1}}'
        -- },
      }
    }
  }

  lvim.lang.cpp = {
    formatters = lvim.lang.c.formatters,
    linters = {},
    lsp = {
      provider = "ccls",
      setup = {
        cmd = lvim.lsp.cpp.cmd
        -- cmd = {
        --   ls_install_prefix .. "/lspinstall/cpp/ccls/bin/ccls",
        --   '--init={"compilationDatabaseDirectory": "build_el7_2020_05", "index": {"threads": 1}}'
        -- },
      }
    }
  }
end

if lvim.lsp.cpp.provider == "clangd" then
  lvim.lang.c = {
    formatters = lvim.lang.c.formatters,
    linters = {},
    lsp = {
      provider = "clangd",
      setup = {
        cmd = lvim.lsp.cpp.cmd
        -- cmd = {
        --   ls_install_prefix .. "/lspinstall/cpp/clangd/bin/clangd",
        --   "--background-index",
        --   "--header-insertion=never",
        --   "--cross-file-rename",
        --   "--clang-tidy",
        --   "--clang-tidy-checks=-*,llvm-*,clang-analyzer-*",
        --   "--compile-commands-dir=build_el7_2020_05",
        -- },
      }
    }
  }

  lvim.lang.cpp = {
    formatters = lvim.lang.c.formatters,
    linters = {},
    lsp = {
      provider = "clangd",
      setup = {
        cmd = lvim.lsp.cpp.cmd
        -- cmd = {
        --   ls_install_prefix .. "/lspinstall/cpp/clangd/bin/clangd",
        --   "--background-index",
        --   "--header-insertion=never",
        --   "--cross-file-rename",
        --   "--clang-tidy",
        --   "--clang-tidy-checks=-*,llvm-*,clang-analyzer-*",
        --   "--compile-commands-dir=build_el7_2020_05",
        -- },
      }
    }
  }
end
