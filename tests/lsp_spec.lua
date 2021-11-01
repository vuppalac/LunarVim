local a = require "plenary.async_lib.tests"
local utils = require "lvim.utils"
lvim.lsp.templates_dir = join_paths(get_runtime_dir(), "lvim", "tests", "artifacts")

a.describe("lsp workflow", function()
  local Log = require "lvim.core.log"
  local logfile = Log:get_path()

  a.it("shoud be able to delete ftplugin templates", function()
    if utils.is_directory(lvim.lsp.templates_dir) then
      assert.equal(vim.fn.delete(lvim.lsp.templates_dir, "rf"), 0)
    end
    assert.False(utils.is_directory(lvim.lsp.templates_dir))
  end)

  a.it("shoud be able to generate ftplugin templates", function()
    if utils.is_directory(lvim.lsp.templates_dir) then
      assert.equal(vim.fn.delete(lvim.lsp.templates_dir, "rf"), 0)
    end
    require("lvim.lsp").setup()

    -- we need to delay this check until the generation is completed
    vim.schedule(function()
      assert.True(utils.is_directory(lvim.lsp.templates_dir))
    end)
  end)

  a.it("shoud not attempt to re-generate ftplugin templates", function()
    lvim.log.level = "debug"

    local plugins = require "lvim.plugins"
    require("lvim.plugin-loader"):load { plugins, lvim.plugins }

    if utils.is_file(logfile) then
      assert.equal(vim.fn.delete(logfile), 0)
    end

    assert.True(utils.is_directory(lvim.lsp.templates_dir))
    require("lvim.lsp").setup()

    -- we need to delay this check until the log gets populated
    vim.schedule(function()
      assert.False(utils.log_contains "templates")
    end)
  end)

  a.it("shoud not include blacklisted servers in the generated templates", function()
    assert.True(utils.is_directory(lvim.lsp.templates_dir))
    require("lvim.lsp").setup()

    for _, file in ipairs(vim.fn.glob(lvim.lsp.templates_dir .. "/*.lua", 1, 1)) do
      for _, server in ipairs(lvim.lsp.override) do
        assert.False(utils.file_contains(file, server))
      end
    end
  end)

  a.it("shoud only include one server per generated template", function()
    assert.True(utils.is_directory(lvim.lsp.templates_dir))
    require("lvim.lsp").setup()

    for _, file in ipairs(vim.fn.glob(lvim.lsp.templates_dir .. "/*.lua", 1, 1)) do
      local count = 0
      for _ in io.lines(file) do
        count = count + 1
      end
      assert.equal(count, 1)
    end
  end)
end)
