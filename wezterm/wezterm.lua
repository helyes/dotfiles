-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- custom Catppuccin
local customppuccin = wezterm.color.get_builtin_schemes()["Catppuccin Mocha"]
customppuccin.background = "#000000"
customppuccin.tab_bar.background = "#040404"
customppuccin.tab_bar.inactive_tab.bg_color = "#0f0f0f"
customppuccin.tab_bar.new_tab.bg_color = "#080808"

local customTokyoNight = wezterm.color.get_builtin_schemes()["Tokyo Night"]
customTokyoNight.background = "#000000"
customTokyoNight.tab_bar.background = "#040404"
customTokyoNight.tab_bar.inactive_tab.bg_color = "#0f0f0f"
customTokyoNight.tab_bar.new_tab.bg_color = "#080808"

config.color_schemes = {
  ["Customppuccin"] = customppuccin,
  ["CustomTokyoNight"] = customTokyoNight,
}

config.color_scheme = 'Customppuccin'
-- config.color_scheme = 'Catppuccin Mocha'
-- config.color_scheme = 'CustomTokyoNight'
-- config.color_scheme = 'Tokyo Night'


config.font_size = 24.0
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.96

config.initial_cols = 150
config.initial_rows = 60

-- https://wezfurlong.org/wezterm/config/default-keys.html
config.keys = {
	-- Make Page up/down work
	{ key = 'PageUp', action = wezterm.action.ScrollByPage(-1) },
	{ key = 'PageDown', action = wezterm.action.ScrollByPage(1) }
}

config.adjust_window_size_when_changing_font_size = false

return config
