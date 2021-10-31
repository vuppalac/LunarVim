local M = {}

M.config = function ()
  -- Snippets
  -- =========================================
  require("luasnip/loaders/from_vscode").load { paths = { "~/.config/nvim/snippets" } }

  -- Barbar
  -- =========================================
  if lvim.builtin.fancy_bufferline.active then
    lvim.builtin.bufferline.active = false
  end

  -- CMP
  -- =========================================
  -- lvim.builtin.cmp.sources = {
  --   { name = "nvim_lsp" },
  --   { name = "cmp_tabnine", max_item_count = 3 },
  --   { name = "buffer", max_item_count = 5 },
  --   { name = "path", max_item_count = 5 },
  --   { name = "luasnip", max_item_count = 3 },
  --   { name = "nvim_lua" },
  --   { name = "calc" },
  --   { name = "emoji" },
  --   { name = "treesitter" },
  --   { name = "crates" },
  -- }
  -- lvim.builtin.cmp.documentation.border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }
  -- lvim.builtin.cmp.experimental = {
  --   ghost_text = false,
  --   native_menu = false,
  --   custom_menu = true,
  -- }
  -- lvim.builtin.cmp.formatting.kind_icons = require("user.lsp_kind").symbols()
  -- lvim.builtin.cmp.formatting.source_names = {
  --   buffer = "(Buffer)",
  --   nvim_lsp = "(LSP)",
  --   luasnip = "(Snip)",
  --   treesitter = " ",
  --   nvim_lua = "(NvLua)",
  --   spell = " 暈",
  --   emoji = "  ",
  --   path = "  ",
  --   calc = "  ",
  --   cmp_tabnine = "  ",
  --   ["vim-dadbod-completion"] = "𝓐",
  -- }

  if lvim.builtin.sell_your_soul_to_devil then
    vim.g.copilot_no_tab_map = true
    vim.g.copilot_assume_mapped = true
    vim.g.copilot_tab_fallback = ""
    local cmp = require "cmp"
    lvim.builtin.cmp.mapping["<C-e>"] = function(fallback)
      cmp.mapping.abort()
      local copilot_keys = vim.fn["copilot#Accept"]()
      if copilot_keys ~= "" then
        vim.api.nvim_feedkeys(copilot_keys, "i", true)
      else
        fallback()
      end
    end
  end

  -- Dashboard
  -- =========================================
  -- lvim.builtin.dashboard.active = true
  lvim.builtin.dashboard.custom_section["m"] = {
    description = { "  Marks              " },
    command = "Telescope marks",
  }
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

  -- LSP
  -- =========================================
  -- lvim.lsp.diagnostics.signs.values = {
  --   { name = "LspDiagnosticsSignError", text = " " },
  --   { name = "LspDiagnosticsSignWarning", text = "" },
  --   { name = "LspDiagnosticsSignHint", text = "" },
  --   { name = "LspDiagnosticsSignInformation", text = "" },
  -- }

  -- Lualine
  -- =========================================
  local components = require("lvim.core.lualine.components")
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

  -- NvimTre
  -- =========================================
  lvim.builtin.nvimtree.setup.auto_open = 0
  lvim.builtin.nvimtree.setup.diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  }
  lvim.builtin.nvimtree.side = "left"
  lvim.builtin.nvimtree.show_icons.git = 0
  lvim.builtin.nvimtree.hide_dotfiles = 0

  -- Project
  -- =========================================
  -- lvim.builtin.project.active = false
  lvim.builtin.project.patterns = { "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" }
  lvim.builtin.project.show_hidden = true
  lvim.builtin.project.silent_chdir = false

  -- Treesiter
  -- =========================================
  lvim.builtin.treesitter.context_commentstring.enable = true
  lvim.builtin.treesitter.ensure_installed = "maintained"
  lvim.builtin.treesitter.ignore_install = { "haskell" }
  lvim.builtin.treesitter.highlight.enabled = true
  -- lvim.builtin.treesitter.highlight.disable = {}
  lvim.builtin.treesitter.rainbow.enable = true
  -- lvim.builtin.treesitter.incremental_selection = {
  --   enable = true,
  --   keymaps = {
  --     init_selection = "<C-n>",
  --     node_incremental = "<C-n>",
  --     scope_incremental = "<C-s>",
  --     node_decremental = "<C-r>",
  --   },
  -- }
  -- lvim.builtin.treesitter.indent = { enable = true, disable = { "yaml", "python" } } -- treesitter is buggy :(
  -- lvim.builtin.treesitter.matchup.enable = true
  -- -- lvim.treesitter.textsubjects.enable = true
  -- -- lvim.treesitter.playground.enable = true
  -- lvim.builtin.treesitter.query_linter = {
  --   enable = true,
  --   use_virtual_text = true,
  --   lint_events = { "BufWrite", "CursorHold" },
  -- }
  -- lvim.builtin.treesitter.on_config_done = function()
  --   local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
  --   parser_config.solidity = {
  --     install_info = {
  --       url = "https://github.com/JoranHonig/tree-sitter-solidity",
  --       files = { "src/parser.c" },
  --       requires_generate_from_grammar = true,
  --     },
  --     filetype = "solidity",
  --   }
  --   parser_config.jsonc.used_by = "json"
  --   parser_config.markdown = {
  --     install_info = {
  --       url = "https://github.com/ikatyang/tree-sitter-markdown",
  --       files = { "src/parser.c", "src/scanner.cc" },
  --     },
  --   }
  -- end

  -- Telescope
  -- =========================================
  -- lvim.builtin.telescope.defaults.path_display = { "smart", "absolute", "truncate" }
  lvim.builtin.telescope.defaults.path_display = { shorten = 10 }
  lvim.builtin.telescope.defaults.winblend = 6
  lvim.builtin.telescope.defaults.layout_strategy = "horizontal"
  lvim.builtin.telescope.defaults.file_ignore_patterns = {
    "vendor/*",
    "%.lock",
    "__pycache__/*",
    "%.sqlite3",
    "%.ipynb",
    "node_modules/*",
    "%.jpg",
    "%.jpeg",
    "%.png",
    "%.svg",
    "%.otf",
    "%.ttf",
    ".git/",
    "%.webp",
    ".dart_tool/",
    ".github/",
    ".gradle/",
    ".idea/",
    ".settings/",
    ".vscode/",
    "__pycache__/",
    "build/",
    "env/",
    "gradle/",
    "node_modules/",
    "target/",
  }
  lvim.builtin.telescope.defaults.layout_config = require("user.telescope").layout_config()
  lvim.builtin.telescope.defaults.mappings = {
    i = {
      ["<esc>"] = require("telescope.actions").close,
      ["<C-y>"] = require("telescope.actions").which_key,
    },
  }

  local telescope_actions = require "telescope.actions.set"
  lvim.builtin.telescope.defaults.pickers.find_files = {
    attach_mappings = function(_)
      telescope_actions.select:enhance {
        post = function()
          vim.cmd ":normal! zx"
        end,
      }
      return true
    end,
    find_command = { "fd", "--type=file", "--hidden", "--smart-case" },
  }

  -- Terminal
  -- =========================================
  lvim.builtin.terminal.execs = {
    { "lazygit", "gg", "LazyGit" },
  }

  -- WhichKey
  -- =========================================
  lvim.builtin.which_key.setup.window.winblend = 10
  lvim.builtin.which_key.setup.window.border = "none"
  lvim.builtin.which_key.setup.ignore_missing = true
--   lvim.builtin.which_key.on_config_done = function(wk)
--     local keys = {
--       ["ga"] = { "<cmd>lua require('user.telescope').code_actions()<CR>", "Code Action" },
--       ["gR"] = { "<cmd>Trouble lsp_references<CR>", "Goto References" },
--       ["gI"] = { "<cmd>lua require('user.telescope').lsp_implementations()<CR>", "Goto Implementation" },
  --     }

--     -- better keybindings for ts and tsx files
--     local langs = { "typescript", "typescriptreact" }
--     local ftype = vim.bo.filetype
--     if vim.tbl_contains(langs, ftype) then
--       local ts_keys = {
--         ["gA"] = { "<cmd>TSLspImportAll<CR>", "Import All" },
--         ["gr"] = { "<cmd>TSLspRenameFile<CR>", "Rename File" },
--         ["gS"] = { "<cmd>TSLspOrganize<CR>", "Organize Imports" },
--       }
--       wk.register(ts_keys, { mode = "n" })
--     end
--     wk.register(keys, { mode = "n" })
  --   end
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

  -- ETC
  -- =========================================
  local _time = os.date "*t"
  if _time.hour >= 21 and _time.hour <= 24 then
    lvim.colorscheme = "onedarker"
  end
  --   if lvim.builtin.lastplace.active == false then
  --     -- go to last loc when opening a buffer
  --     vim.cmd [[
  --   autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif
  -- ]]
  --   end

end

return M
