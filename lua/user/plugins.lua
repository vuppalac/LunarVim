local M = {}

M.config = function()
  lvim.plugins = {
    -- {
    --   "abzcoding/zephyr-nvim",
    --   config = function()
    --     vim.cmd [[
    --     colorscheme zephyr
    --     ]]
    --   end,
    --   cond = function()
    --     local _time = os.date "*t"
    --     return (_time.hour >= 5 and _time.hour < 8)
    --   end,
    -- },
    -- {
    --   "Pocco81/Catppuccino.nvim",
    --   config = function()
    --     require("user.theme").catppuccino()
    --   end,
    --   cond = function()
    --     local _time = os.date "*t"
    --     return (_time.hour >= 8 and _time.hour < 11)
    --   end,
    -- },
    -- {
    --   "abzcoding/tokyonight.nvim",
    --   branch = "feature/vim-diagnostics",
    --   config = function()
    --     require("user.theme").tokyonight()
    --     vim.cmd [[
    --     colorscheme tokyonight
    --     ]]
    --   end,
    --   cond = function()
    --     local _time = os.date "*t"
    --     return (_time.hour >= 0 and _time.hour < 5) or (_time.hour >= 11 and _time.hour < 17)
    --   end,
    -- },
    -- {
    --   "abzcoding/doom-one.nvim",
    --   branch = "feat/nvim-cmp-floating",
    --   config = function()
    --     require("user.theme").doom()
    --     vim.cmd [[
    --   colorscheme doom-one
    --   ]]
    --   end,
    --   cond = function()
    --     local _time = os.date "*t"
    --     return (_time.hour >= 17 and _time.hour < 21)
    --   end,
    -- },
    -- {
    --   "tzachar/cmp-tabnine",
    --   run = "./install.sh",
    --   requires = "hrsh7th/nvim-cmp",
    --   config = function()
    --     local tabnine = require "cmp_tabnine.config"
    --     tabnine:setup {
    --       max_lines = 1000,
    --       max_num_results = 10,
    --       sort = true,
    --     }
    --   end,
    --   disable = not lvim.builtin.tabnine.active,
    -- },
    {
      "IndianBoy42/hop.nvim",
      event = "BufRead",
      config = function()
        require("user.hop").config()
      end,
    },
    {
      "akinsho/bufferline.nvim",
      config = function()
        require("user.bufferline").config()
      end,
      requires = "nvim-web-devicons",
      disable = not lvim.builtin.fancy_bufferline.active,
    },
    {"folke/tokyonight.nvim"},
    {
      "ray-x/lsp_signature.nvim",
      config = function() require("user/lsp_signature").config() end,
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
        vim.g.indent_blankline_filetype_exclude = {
          "log",
          "gitcommit",
          "vimwiki",
          "markdown",
          "json",
          "txt",
          "vista",
          "NvimTree",
          "git",
          "TelescopePrompt",
          "undotree",
          "flutterToolsOutline",
          "org",
          "orgagenda",
          "help",
          "startify",
          "dashboard",
          "packer",
          "neogitstatus",
          "NvimTree",
          "Trouble",
          "lspinfo",
          "", -- for all buffers without a file type
          "terminal",
          "Lviminfo"
        }
        vim.g.indent_blankline_buftype_exclude = {"terminal", "nofile"}
        vim.g.indent_blankline_show_trailing_blankline_indent = false
        vim.g.indent_blankline_show_first_indent_level = true
        vim.g.indent_blankline_show_current_context = true
        vim.g.indent_blankline_use_treesitter = true
        vim.g.indent_blankline_context_patterns = {
          "class",
          "return",
          "function",
          "method",
          "^if",
          "^do",
          "^switch",
          "^while",
          "jsx_element",
          "^for",
          "^object",
          "^table",
          "block",
          "arguments",
          "if_statement",
          "else_clause",
          "jsx_element",
          "jsx_self_closing_element",
          "try_statement",
          "catch_clause",
          "import_statement",
          "operation_type",
        }
        -- HACK: work-around for https://github.com/lukas-reineke/indent-blankline.nvim/issues/59
        vim.wo.colorcolumn = "99999"
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
    -- {'ray-x/guihua.lua', run = 'cd lua/fzy && make'},
    {
      'simrat39/symbols-outline.nvim',
      config = function()
        vim.g.symbols_outline.auto_preview = false
      end,
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
end

return M
