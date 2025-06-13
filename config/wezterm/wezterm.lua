local wezterm = require 'wezterm'
local config = {}

-- wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
--   local pane = tab.active_pane
--   local title = pane.foreground_process_name
--   local color = "navy"
--   if tab.is_active then
--     color = "blue"
--   end
--   return {
--     {Background={Color=color}},
--     {Text=" " .. title .. " "},
--   }
-- end)

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
    config = wezterm.config_builder()
end

local function get_appearance()
    if wezterm.gui then
        return wezterm.gui.get_appearance()
    end
    return 'Dark'
end

local function scheme_for_appearance(appearance)
  if appearance:find 'Dark' then
    return 'Tokyo Night Storm'
  else
    return 'Catppuccin Latte (Gogh)'
  end
end

-- session persistence
config.unix_domains = {
  {
    name = 'unix',
  },
}
config.default_gui_startup_args = { 'connect', 'unix' }

config.color_scheme = scheme_for_appearance(get_appearance())
config.freetype_load_flags = 'NO_HINTING'
config.window_background_opacity = 1
config.font_size = 13
config.font = wezterm.font 'SauceCodePro Nerd Font'
config.warn_about_missing_glyphs = false
config.window_decorations = "TITLE|RESIZE"
config.enable_wayland = true
config.window_close_confirmation = 'NeverPrompt'

local sessionizer = require("sessionizer")

config.keys = {
    { key = "f", mods = "SUPER", action = wezterm.action_callback(sessionizer.toggle) },
    { key = 'f', mods = 'SUPER|SHIFT', action = wezterm.action.ShowLauncherArgs { flags = 'FUZZY|WORKSPACES' } },
    { key = '[', mods = 'SUPER', action = wezterm.action.SwitchWorkspaceRelative(1) },
    { key = ']', mods = 'SUPER', action = wezterm.action.SwitchWorkspaceRelative(-1) },
}

return config
