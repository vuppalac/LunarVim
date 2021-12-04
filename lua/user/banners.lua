local M = {}

M.dashboard = function()
  math.randomseed(os.time())
  local headers = {
    {
      [[]],
      [[     ___                                    ___     ]],
      [[    /__/\          ___        ___          /__/\    ]],
      [[    \  \:\        /__/\      /  /\        |  |::\   ]],
      [[     \  \:\       \  \:\    /  /:/        |  |:|:\  ]],
      [[ _____\__\:\       \  \:\  /__/::\      __|__|:|\:\ ]],
      [[/__/::::::::\  ___  \__\:\ \__\/\:\__  /__/::::| \:\]],
      [[\  \:\~~\~~\/ /__/\ |  |:|    \  \:\/\ \  \:\~~\__\/]],
      [[ \  \:\  ~~~  \  \:\|  |:|     \__\::/  \  \:\      ]],
      [[  \  \:\       \  \:\__|:|     /__/:/    \  \:\     ]],
      [[   \  \:\       \__\::::/      \__\/      \  \:\    ]],
      [[    \__\/           ~~~~                   \__\/    ]],
      [[]],
    },
    {
      -- [[▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁]],
      [[]],
      [[]],
      [[███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗]],
      [[████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║]],
      [[██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║]],
      [[██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
      [[██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║]],
      [[╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
      [[]],
      [[]],
      -- [[▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔]],
    },
    {
      [[      ____                                        ]],
      [[     /___/\_                                      ]],
      [[    _\   \/_/\__                     __           ]],
      [[  __\       \/_/\            .--.--.|__|.--.--.--.]],
      [[  \   __    __ \ \           |  |  ||  ||        |]],
      [[ __\  \_\   \_\ \ \   __      \___/ |__||__|__|__|]],
      [[/_/\\   __   __  \ \_/_/\                         ]],
      [[\_\/_\__\/\__\/\__\/_\_\/                         ]],
      [[   \_\/_/\       /_\_\/                           ]],
      [[      \_\/       \_\/                             ]],
    },
    {
      [[]],
      [[ ...      (^~^)                              ]],
      [[(°з°)  _ ┐__\|_┌________ __   __ ___ __   __ ]],
      [[|  |  | |       |       |  | |  |   |  |_|  |]],
      [[|   |_| |    ___|  ___  |  |_|  |   |       |]],
      [[|       |   |___| |▀-▀| |       |   |       |]],
      [[|  _    |    ___| |___| |       |   |       |]],
      [[| | |   |   |___|       ||     ||   | ||_|| |]],
      [[|_|  |__|_______|_______| |___| |___|_|   |_|]],
      [[]],
      [[]],
    },
  }
  return headers[math.random(1, #headers)]
end

return M
