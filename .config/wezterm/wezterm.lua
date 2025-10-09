local wezterm = require "wezterm"

local config = wezterm.config_builder()

config.color_scheme = "Jellybeans"
config.font = wezterm.font "Cascadia Code"

return config