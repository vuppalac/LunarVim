-- Additional Plugins
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
  {'ray-x/guihua.lua', run = 'cd lua/fzy && make'}
}
