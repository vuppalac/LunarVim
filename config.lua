--[[
cfg is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]

-- general
lvim.log.level = "warn"
lvim.format_on_save = false
lvim.lint_on_save = true
-- lvim.colorscheme = "doom-one"
vim.g.tokyonight_style = "storm"
vim.g.tokyonight_italic_functions = false
vim.g.tokyonight_lualine_bold = true
-- vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }
-- lvim.colorscheme = "tokyonight"
-- lvim.colorscheme = "onedarker"
-- lvim.colorscheme = "aurora"
lvim.colorscheme = "doom-one"
-- lvim.colorscheme = "gruvbox"
-- lvim.builtin.lualine.options.theme = 'gruvbox'

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<C-p>"] = ":Telescope find_files<CR>"
lvim.keys.normal_mode["<C-f>"] = ":Telescope grep_string<CR>"
lvim.keys.normal_mode["<M-f>"] = ":Telescope live_grep<CR>"
lvim.keys.normal_mode["<C-_>"] = ":CommentToggle<CR>"
lvim.keys.visual_mode["<C-_>"] = ":CommentToggle<CR>"
lvim.keys.normal_mode["<C-d>"] = ":Dox<CR>"
lvim.keys.normal_mode["<Tab>"] = ":BufferNext<CR>"
lvim.keys.normal_mode["<S-Tab>"] = ":BufferPrevious<CR>"
lvim.keys.normal_mode["<F12>"] = ":SymbolsOutline<CR>"

lvim.lsp.diagnostics.virtual_text = false
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

lvim.builtin.gitsigns.opts.git_path = 'git'

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["d"] = {
  name = "+Diagnostics",
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  t = { "<cmd>TroubleToggle<cr>", "Trouble" },
  w = { "<cmd>TroubleToggle lsp_workspace_diagnostics<cr>", "Workspace" },
  d = { "<cmd>TroubleToggle lsp_document_diagnostics<cr>", "Document" },
  q = { "<cmd>TroubleToggle quickfix<cr>", "QuickFix" },
  l = { "<cmd>TroubleToggle loclist<cr>", "LocationList" },
  r = { "<cmd>TroubleToggle lsp_references<cr>", "References" },
}

lvim.builtin.which_key.mappings['t'] = {
  name = "+Toggle",
  i = { "<cmd> IndentBlanklineToggle<CR>", "Indent Style"},
  l = { "<cmd> set nu!<CR>", "Line Numbers"},
  w = { "<cmd> set wrap!<CR>", "Wrap Text"},
}

lvim.builtin.which_key.mappings['m'] = {
  name = "+Misc",
  t = { "<cmd> %s/\\s\\+$//e<CR>", "Trim Trailing Whitespace"},
}

lvim.builtin.which_key.mappings["g"]["d"] = {"<cmd>Gvdiff<cr>", "File diff"}
lvim.builtin.which_key.mappings["g"]["h"] = {"<cmd>DiffviewFileHistory<cr>", "File history"}

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.cmp.active = true
lvim.builtin.comment.active = true

lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0
lvim.builtin.nvimtree.hide_dotfiles = 0

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.context_commentstring.enable = true
lvim.builtin.treesitter.rainbow.enable = true

-- All the patterns used to detect root dir, when **"pattern"** is in
-- detection_methods
lvim.builtin.project.patterns = { "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" }
 -- Show hidden files in telescope
lvim.builtin.project.show_hidden = true
-- When set to false, you will get a message when project.nvim changes your
-- directory.
lvim.builtin.project.silent_chdir = false

lvim.builtin.dashboard.custom_header = {
  '▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁',
  '',
  ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
  ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
  ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
  ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
  ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
  ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
  '',
  '▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔',
}

-- require("user.lsp.config")

-- Additional Plugins
-- require('user.plugins')
lvim.plugins = {
  {"folke/tokyonight.nvim"},
  {
    "ray-x/lsp_signature.nvim",
    config = function() require"lsp_signature".on_attach() end,
    event = "BufRead"
  },
  {
    "tpope/vim-fugitive",
    cmd = {
      "G",
      "Git",
      "Gdiffsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "GMove",
      "GDelete",
      "GBrowse",
      "GRemove",
      "GRename",
      "Glgrep",
      "Gedit",
      "Gvdiff",
    },
    ft = {"fugitive"}
  },
  {
    "sindrets/diffview.nvim",
    cmd = {
      "DiffviewFileHistory",
      "DiffviewFocusFiles",
      "DiffviewOpen",
      "DiffViewRefresh",
      "DiffviewToggleFiles",
    },
    config = function ()
      require('diffview').setup({
        diff_binaries = false,    -- Show diffs for binaries
        use_icons = true,         -- Requires nvim-web-devicons
      })
    end
  },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  {
    "ethanholz/nvim-lastplace",
    event = "BufRead",
    config = function()
      require("nvim-lastplace").setup({
        lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
        lastplace_ignore_filetype = {
          "gitcommit", "gitrebase", "svn", "hgcommit",
        },
        lastplace_open_folds = true,
      })
    end,
  },
  {
    'editorconfig/editorconfig-vim',
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    setup = function()
      vim.g.indentLine_enabled = 1
      vim.g.indent_blankline_char_list = { '|', '¦', '┆', '┊' }
      vim.g.indent_blankline_filetype_exclude = {"help", "terminal", "dashboard", "startify", "Lviminfo"}
      vim.g.indent_blankline_buftype_exclude = {"terminal"}
      vim.g.indent_blankline_show_trailing_blankline_indent = false
      vim.g.indent_blankline_show_first_indent_level = true
      vim.g.indent_blankline_show_current_context = true
    end
  },
  {
    'vim-scripts/DoxygenToolkit.vim',
    cmd = "Dox",
    setup = function ()
      vim.g.DoxygenToolkit_commentType = "C++"
    end
  },
  --{
  --  'vuppalac/navigator.lua',
  --  requires = {'ray-x/guihua.lua', run = 'cd lua/fzy && make'},
  --  disable = false
  --},
  {'ray-x/guihua.lua', run = 'cd lua/fzy && make'},
  -- Symbols outline - F12
  {
    'simrat39/symbols-outline.nvim',
    cmd = 'SymbolsOutline'
  },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup {
        keywords = {
          OK = { icon = "✔ ", color = "ok" },
          ISH = { icon = "☛ ", color = "ish" },
          BAD = { icon = "✘ ", color = "bad" },
          TEST = { icon = "⚖ ", color = "test" }
        },
        colors = {
          ok = { "#10B981" },
          ish = { "#e0e031" },
          bad = { "#f06981" },
          test = { "#f02244" }
        },
      }
    end
  },
  {
    "f-person/git-blame.nvim",
    event = "BufRead",
    config = function()
      vim.cmd "highlight default link gitblame SpecialComment"
      vim.g.gitblame_enabled = 0
    end,
  },
  {
    "p00f/nvim-ts-rainbow",
    event = "BufWinEnter",
  },
}

local components = require("core.lualine.components")
lvim.builtin.lualine.sections.lualine_b = {
  components.branch,
  {
    'filename',
    file_status = true, -- displays file status (readonly status, modified status)
    path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
    color = {},
    cond = nil,
  },
}

-- require("user.lsp.servers.ccls")

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }
