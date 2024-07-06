local ui_plugins = require("plugins_lazy.ui_plugins")
local git_plugins = require("plugins_lazy.git_plugins")
local base_code_plugins = require("plugins_lazy.base_code_plugins")
local lang_plug = require("plugins_lazy.lang_plugins")

local plugins = {
    base_code_plugins,
    git_plugins,
    ui_plugins,
    lang_plug,
}

return plugins
