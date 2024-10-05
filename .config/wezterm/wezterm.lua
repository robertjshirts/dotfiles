-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- Try wayland fixing
config.enable_wayland = false

-- Use nerd font
config.font = wezterm.font("JetBrainsMono Nerd Font")

-- Use bash as default shell
config.default_prog = { "bash" }

-- Use a color scheme
config.color_scheme = "Ashes (base16)"

-- and finally, return the configuration to wezterm
return config
