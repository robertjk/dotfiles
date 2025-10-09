local wezterm = require "wezterm"

local config = wezterm.config_builder()

config.font = wezterm.font "Cascadia Code"

config.color_scheme = "Jellybeans (Gogh)" -- Alternatively "Jellybeans"
config.colors = {
    scrollbar_thumb = "#404040"
}

config.enable_scroll_bar = true

return config