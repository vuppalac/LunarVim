local ls_install_prefix = vim.fn.stdpath "data"

local opts = {
  cmd = {
    ls_install_prefix .. "/lsp_servers/clangd/clangd",
    -- "clangd",
    "--background-index",
    "--header-insertion=never",
    "--cross-file-rename",
    "--clang-tidy",
    "--clang-tidy-checks=-*,llvm-*,clang-analyzer-*",
    "--compile-commands-dir=build_el7_2020_05"
  }
}
return opts
