-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()
local mux = wezterm.mux

wezterm.on("gui-startup", function()
	local tab, pane, window = mux.spawn_window({})
	window:gui_window():maximize()
	window:gui_window():toggle_fullscreen()
end)

config.color_scheme = "JetBrains Darcula"
config.font_size = 10
config.font = wezterm.font("JetBrains Mono")
config.hide_tab_bar_if_only_one_tab = true
config.default_prog = { "nvim" }
config.window_close_confirmation = "NeverPrompt"

return config
