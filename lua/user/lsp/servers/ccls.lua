local lspconfig = require "lspconfig"
local configs = require "lspconfig/configs"
local servers = require "nvim-lsp-installer.servers"
local server = require "nvim-lsp-installer.server"
local path = require "nvim-lsp-installer.path"

local server_name = "ccls"

-- 1. (optional, only if lspconfig doesn't already support the server)
--    Create server entry in lspconfig
configs[server_name] = {
    default_config = {
        filetypes = { "lua" },
        root_dir = lspconfig.util.root_pattern ".git",
    },
}

local root_dir = server.get_server_root_path(server_name)

function install_server(server)
  return true
end

-- You may also use one of the prebuilt installers (e.g., std, npm, pip3, go, gem, shell).
local my_installer = function(server, callback, context)
    local is_success = install_server(server)
    if is_success then
        callback(true)
    else
        callback(false)
    end
end

-- 2. (mandatory) Create an nvim-lsp-installer Server instance
local my_server = server.Server:new {
    name = server_name,
    root_dir = root_dir,
    installer = my_installer,
    default_options = {
        cmd = { path.concat { root_dir, "ccls" }, '--init={"compilationDatabaseDirectory": "build_el7_2020_05", "index": {"threads": 1}}'},
    },
}

-- 3. (optional, recommended) Register your server with nvim-lsp-installer.
--    This makes it available via other APIs (e.g., :LspInstall, lsp_installer.get_available_servers()).
servers.register(my_server)

