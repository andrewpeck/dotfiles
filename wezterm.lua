-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28

-- or, changing the font size and color scheme.
if (wezterm.hostname() == "larry") then
  config.font_size = 10
else
  config.font_size = 15
end

config.color_scheme = 'Gruvbox Dark (Gogh)'

config.use_fancy_tab_bar = false

config.scrollback_lines = 100000

-- config.show_close_tab_button_in_tabs = true
config.use_fancy_tab_bar = true

config.keys = {
  {
    key = '(',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },

  {
    key = ')',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },

  -- close pane with confirmation if active process
  {
    key = 'w',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },

}
-- Finally, return the configuration to wezterm:
return config
