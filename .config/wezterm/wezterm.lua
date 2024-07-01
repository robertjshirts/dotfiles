-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- Use nerd font
config.font = wezterm.font("JetBrainsMono Nerd Font")

-- Use fish as default shell
config.default_prog = { "fish", "-l" }

-- Use a color scheme
config.color_scheme = "Ashes (base16)"

-- and finally, return the configuration to wezterm
return config
