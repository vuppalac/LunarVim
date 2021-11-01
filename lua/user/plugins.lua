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
    {
      "ray-x/lsp_signature.nvim",
      config = function() require("user/lsp_signature").config() end,
      event = "BufRead"
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
      "folke/todo-comments.nvim",
      event = "BufRead",
      config = function()
        -- require("user.todo_comments").config()
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
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("trouble").setup()
      end,
      cmd = "Trouble",
    },
    {
      "IndianBoy42/hop.nvim",
      event = "BufRead",
      config = function()
        require("user.hop").config()
      end,
    },
    {
      'simrat39/symbols-outline.nvim',
      config = function()
        vim.g.symbols_outline.auto_preview = false
      end,
      -- event = "BufReadPost",
      cmd = 'SymbolsOutline'
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
          "Lviminfo",
          "alpha"
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
      "tzachar/cmp-tabnine",
      run = "./install.sh",
      requires = "hrsh7th/nvim-cmp",
      config = function()
        local tabnine = require "cmp_tabnine.config"
        tabnine:setup {
          max_lines = 1000,
          max_num_results = 10,
          sort = true,
        }
      end,
      disable = not lvim.builtin.tabnine.active,
    },
    {
      "folke/twilight.nvim",
      config = function()
        require("user.twilight").config()
      end,
      event = "BufRead",
    },
    {
      "kevinhwang91/nvim-bqf",
      config = function()
        require("user.bqf").config()
      end,
      event = "BufRead",
    },
    {
      "rcarriga/nvim-dap-ui",
      config = function()
        require("dapui").setup()
      end,
      ft = { "python", "rust", "go" },
      requires = { "mfussenegger/nvim-dap" },
      disable = not lvim.builtin.dap.active,
    },
    {
      "andymass/vim-matchup",
      event = "CursorMoved",
      config = function()
        vim.g.matchup_enabled = 1
        vim.g.matchup_surround_enabled = 1
        vim.g.matchup_matchparen_deferred = 1
        vim.g.matchup_matchparen_offscreen = { method = "popup" }
      end,
    },
    {
      "windwp/nvim-spectre",
      event = "BufRead",
      config = function()
        require("user.spectre").config()
      end,
    },
    {
      "norcalli/nvim-colorizer.lua",
      config = function()
        require("user.colorizer").config()
      end,
      event = "BufRead",
    },
    {
      "danymat/neogen",
      config = function()
        require("neogen").setup {
          enabled = true,
        }
      end,
      ft = { "lua", "python", "javascript", "typescriptreact", "c", "cpp", "go" },
      event = "InsertEnter",
      requires = "nvim-treesitter/nvim-treesitter",
    },
    {
      "folke/lua-dev.nvim",
      ft = "lua",
      before = "williamboman/nvim-lsp-installer",
      disable = not lvim.builtin.lua_dev.active,
    },
    {
      "akinsho/bufferline.nvim",
      config = function()
        require("user.bufferline").config()
      end,
      requires = "nvim-web-devicons",
      disable = not lvim.builtin.fancy_bufferline.active,
    }, 
    {
      "goolord/alpha-nvim",
      config = function()
        require("user.dashboard").config()
      end,
      disable = not lvim.builtin.fancy_dashboard.active,
    },
    {
      "gelguy/wilder.nvim",
      -- event = { "CursorHold", "CmdlineEnter" },
      rocks = { "luarocks-fetch-gitrec", "pcre2" },
      requires = { "romgrk/fzy-lua-native" },
      config = function()
        vim.cmd(string.format("source %s", "~/.config/lvim/vimscript/wilder.vim"))
      end,
      run = ":UpdateRemotePlugins",
      disable = not lvim.builtin.fancy_wild_menu.active,
    },
    {
      "karb94/neoscroll.nvim",
      config = function()
        require("neoscroll").setup()
      end,
      event = "BufRead",
      disable = not lvim.builtin.neoscroll.active,
    },
    {
      "github/copilot.vim",
      disable = not lvim.builtin.sell_your_soul_to_devil,
    },
    {
      "ThePrimeagen/harpoon",
      requires = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-lua/popup.nvim" },
      },
      disable = not lvim.builtin.harpoon.active,
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
      'editorconfig/editorconfig-vim',
    }, 
    {
      'vim-scripts/DoxygenToolkit.vim',
      cmd = "Dox",
      setup = function ()
        vim.g.DoxygenToolkit_commentType = "C++"
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
