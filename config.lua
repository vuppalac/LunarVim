-- Neovim
-- =========================================
lvim.log.level = "warn"
lvim.format_on_save = false
lvim.lint_on_save = true
-- vim.g.tokyonight_style = "storm"
-- vim.g.tokyonight_italic_functions = false
-- vim.g.tokyonight_lualine_bold = true
-- vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }
lvim.colorscheme = "onedarker"
lvim.leader = "space"
require("user.settings").config()

-- Customization
-- =========================================
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
-- lvim.builtin.lastplace = { active = false } -- change to false if you are jumping to future
-- lvim.builtin.tabnine = { active = true } -- change to false if you don't like tabnine
-- lvim.builtin.persistence = { active = true } -- change to false if you don't want persistence
-- lvim.builtin.presence = { active = false } -- change to true if you want discord presence
-- lvim.builtin.orgmode = { active = false } -- change to true if you want orgmode.nvim
-- lvim.builtin.dap.active = false -- change this to enable/disable debugging
lvim.builtin.fancy_statusline = { active = false } -- change this to enable/disable fancy statusline
lvim.builtin.fancy_bufferline = { active = false } -- change this to enable/disable fancy bufferline
-- lvim.builtin.lua_dev = { active = true } -- change this to enable/disable folke/lua_dev
-- lvim.builtin.test_runner = { active = true } -- change this to enable/disable vim-test, ultest
-- lvim.builtin.cheat = { active = true } -- enable cheat.sh integration
lvim.lsp.diagnostics.virtual_text = false -- remove this line if you want to see inline errors
-- lvim.lsp.automatic_servers_installation = true
-- lvim.lsp.document_highlight = true
-- lvim.lsp.code_lens_refresh = true

lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.cmp.active = true
lvim.builtin.comment.active = true
lvim.builtin.gitsigns.opts.git_path = 'git'
require("user.builtin").config()

-- add your own keymapping
-- local ls_install_prefix = vim.fn.stdpath "data"
-- lvim.lsp.cpp.compile_commands_dir = "build_el7_2020_05"
-- lvim.lsp.cpp.provider = "ccls"
-- lvim.lsp.cpp.cmd = {
--   ls_install_prefix .. "/lspinstall/cpp/ccls/bin/ccls",
--   '--init={"compilationDatabaseDirectory": "build_el7_2020_05", "index": {"threads": 1}}'
-- }

-- lvim.lsp.cpp.provider = "clangd"
-- lvim.lsp.cpp.cmd = {
--   ls_install_prefix .. "/lspinstall/cpp/clangd/bin/clangd",
--   -- "clangd",
--   "--background-index",
--   "--header-insertion=never",
--   "--cross-file-rename",
--   "--clang-tidy",
--   "--clang-tidy-checks=-*,llvm-*,clang-analyzer-*",
--   "--compile-commands-dir=build_el7_2020_05",
-- }

-- StatusLine
-- =========================================
if lvim.builtin.fancy_statusline.active then
  require("user.lualine").config()
end

-- Debugging
-- =========================================
-- if lvim.builtin.dap.active then
--   require("user.dap").config()
-- end

-- Language Specific
-- =========================================
-- require("user.null_ls").config()
-- lvim.lsp.override = { "dockerls", "sumneko_lua", "texlab", "tsserver", "rust_analyzer" }
-- for _, server_name in pairs(lvim.lsp.override) do
--   local lsp_installer_servers = require "nvim-lsp-installer.servers"
--   local server_available, requested_server = lsp_installer_servers.get_server(server_name)
--   if server_available then
--     if not requested_server:is_installed() then
--       if lvim.lsp.automatic_servers_installation then
--         requested_server:install()
--       else
--         return
--       end
--     end
--   end

--   local default_config = {
--     on_attach = require("lvim.lsp").common_on_attach,
--     on_init = require("lvim.lsp").common_on_init,
--     capabilities = require("lvim.lsp").common_capabilities(),
--   }

--   local status_ok, custom_config = pcall(require, "user/providers/" .. requested_server.name)
--   if status_ok then
--     local new_config = vim.tbl_deep_extend("force", default_config, custom_config)
--     requested_server:setup(new_config)
--   else
--     requested_server:setup(default_config)
--   end
-- end

-- Additional Plugins
-- =========================================
require("user.plugins").config()

-- Autocommands
-- =========================================
require("user.autocommands").config()

-- Additional keybindings
-- =========================================
require("user.keybindings").config()

-- require("user.lsp.servers.ccls")

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }
