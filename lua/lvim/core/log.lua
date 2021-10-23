local Log = {}

local logfile = string.format("%s/%s.log", vim.fn.stdpath "cache", "lvim")
local in_headless = #vim.api.nvim_list_uis() == 0

Log.levels = {
  TRACE = 1,
  DEBUG = 2,
  INFO = 3,
  WARN = 4,
  ERROR = 5,
}

vim.tbl_add_reverse_lookup(Log.levels)

function Log:init()
  local status_ok, structlog = pcall(require, "structlog")
  if not status_ok then
    return nil
  end

  local nvim_notify_params = {}
  local nvim_notify_params_injecter = function(_, entry)
    for key, value in pairs(nvim_notify_params) do
      entry[key] = value
    end
    return entry
  end

  local nvim_notify_default_namer = function(logger, entry)
    entry["title"] = logger.name
    return entry
  end

  nvim_notify_params_injecter(nil, {})
  local log_level = Log.levels[(lvim.log.level):upper() or "WARN"]
  local lvim_log = {
    lvim = {
      sinks = {
        structlog.sinks.Console(log_level, {
          async = false,
          processors = {
            structlog.processors.Namer(),
            structlog.processors.StackWriter({ "line", "file" }, { max_parents = 0, stack_level = 2 }),
            structlog.processors.Timestamper "%H:%M:%S",
          },
          formatter = structlog.formatters.FormatColorizer( --
            "%s [%-5s] %s: %-30s",
            { "timestamp", "level", "logger_name", "msg" },
            { level = structlog.formatters.FormatColorizer.color_level() }
          ),
        }),
        structlog.sinks.File(Log.levels.TRACE, logfile, {
          processors = {
            structlog.processors.Namer(),
            structlog.processors.StackWriter({ "line", "file" }, { max_parents = 3, stack_level = 2 }),
            structlog.processors.Timestamper "%H:%M:%S",
          },
          formatter = structlog.formatters.Format( --
            "%s [%-5s] %s: %-30s",
            { "timestamp", "level", "logger_name", "msg" }
          ),
        }),
      },
    },
  }

  if not in_headless and lvim.builtin.notify.active then
    table.insert(
      lvim_log.lvim.sinks,
      structlog.sinks.NvimNotify(Log.levels.INFO, {
        processors = {
          nvim_notify_default_namer,
          nvim_notify_params_injecter,
        },
        formatter = structlog.formatters.Format( --
          "%s",
          { "msg" },
          { blacklist_all = true }
        ),
        params_map = {
          icon = "icon",
          keep = "keep",
          on_open = "on_open",
          on_close = "on_close",
          timeout = "timeout",
          title = "title",
        },
      })
    )
  end

  structlog.configure(lvim_log)

  local logger = structlog.get_logger "lvim"

  if not in_headless and lvim.builtin.notify.active and lvim.log.override_notify then
    -- Overwrite vim.notify to use the logger
    vim.notify = function(msg, vim_log_level, opts)
      nvim_notify_params = vim.tbl_deep_extend("force", lvim.builtin.notify.opts, opts)
      -- vim_log_level can be omitted
      if vim_log_level == nil then
        vim_log_level = Log.levels["INFO"]
      end
      if type(vim_log_level) == "string" then
        vim_log_level = Log.levels[(vim_log_level):upper() or "INFO"]
      end
      -- https://github.com/neovim/neovim/blob/685cf398130c61c158401b992a1893c2405cd7d2/runtime/lua/vim/lsp/log.lua#L5
      logger:log(vim_log_level + 1, msg)
    end
  end

  return logger
end

--- Adds a log entry using Plenary.log
---@fparam msg any
---@param level string [same as vim.log.log_levels]
function Log:add_entry(level, msg, event)
  if self.__handle then
    self.__handle:log(level, vim.inspect(msg), event)
    return
  end

  local logger = self:init()
  if not logger then
    return
  end

  self.__handle = logger
  self.__handle:log(level, vim.inspect(msg), event)
end

---Retrieves the path of the logfile
---@return string path of the logfile
function Log:get_path()
  return logfile
end

---Add a log entry at TRACE level
---@param msg any
---@param event any
function Log:trace(msg, event)
  self:add_entry(self.levels.TRACE, msg, event)
end

---Add a log entry at DEBUG level
---@param msg any
---@param event any
function Log:debug(msg, event)
  self:add_entry(self.levels.DEBUG, msg, event)
end

---Add a log entry at INFO level
---@param msg any
---@param event any
function Log:info(msg, event)
  self:add_entry(self.levels.INFO, msg, event)
end

---Add a log entry at WARN level
---@param msg any
---@param event any
function Log:warn(msg, event)
  self:add_entry(self.levels.WARN, msg, event)
end

---Add a log entry at ERROR level
---@param msg any
---@param event any
function Log:error(msg, event)
  self:add_entry(self.levels.ERROR, msg, event)
end

setmetatable({}, Log)

return Log
