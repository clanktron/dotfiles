-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
function get_appearance()
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  end
  return 'Dark'
end

function scheme_for_appearance(appearance)
  if appearance:find 'Dark' then
    return 'Tokyo Night Storm'
  else
    return 'Github Light (Gogh)'
  end
end

config.color_scheme = scheme_for_appearance(get_appearance())
config.freetype_load_flags = 'NO_HINTING'
config.window_background_opacity = 0.95
config.font_size = 16
config.font = wezterm.font 'SauceCodePro Nerd Font'
config.font_rules = {
	{
		intensity = "Bold",
		italic = false,
		font = wezterm.font("SauceCodePro Nerd Font", { weight = "Bold", stretch = "Normal", style = "Normal" }),
	},
	{
		intensity = "Bold",
		italic = true,
		font = wezterm.font("SauceCodePro Nerd Font", { weight = "Bold", stretch = "Normal", style = "Italic" }),
	},
}
config.window_decorations = "TITLE|RESIZE"
config.enable_tab_bar = false
config.enable_wayland = true
config.window_close_confirmation = 'NeverPrompt'
config.keys = {
  {
    key = 'w',
    mods = 'CMD',
    action = wezterm.action.CloseCurrentTab { confirm = false },
  },
}

-- and finally, return the configuration to wezterm
return config
