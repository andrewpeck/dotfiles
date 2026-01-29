local wezterm = require("wezterm")
local config = wezterm.config_builder()
config.font_size = 15
config.font = wezterm.font("AdwaitaMono Nerd Font")
config.color_scheme = "Gruvbox Dark (Gogh)"
config.initial_cols = 120
config.initial_rows = 28
config.scrollback_lines = 500000
config.use_fancy_tab_bar = true
config.keys = {{key = "(", mods = "CTRL|SHIFT", action = wezterm.action.SplitHorizontal({domain = "CurrentPaneDomain"})}, {key = ")", mods = "CTRL|SHIFT", action = wezterm.action.SplitVertical({domain = "CurrentPaneDomain"})}, {key = "w", mods = "CTRL|SHIFT", action = wezterm.action.CloseCurrentPane({confirm = true})}}
return config
