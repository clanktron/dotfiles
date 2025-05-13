-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

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

config.color_scheme = scheme_for_appearance(get_appearance())
config.freetype_load_flags = 'NO_HINTING'
config.window_background_opacity = 1
config.font_size = 13
config.warn_about_missing_glyphs = false
config.window_decorations = "TITLE|RESIZE"
config.enable_tab_bar = false
config.enable_wayland = true
config.window_close_confirmation = 'NeverPrompt'

local act = wezterm.action
config.keys = {
    {
        key = 'w',
        mods = 'CMD',
        action = act.Multiple {
            act.SendKey { key = "a", mods = "CTRL" },
            act.SendKey { key = "&" },
        }
    },
    {
        key = 'v',
        mods = 'CMD',
        action = act.PasteFrom 'Clipboard'
    },
    {
        key = 'r',
        mods = 'CMD',
        action = act.Multiple {
            act.SendKey { key = "a", mods = "CTRL" },
            act.SendKey { key = "{" },
        }
    },
    {
        key = 't',
        mods = 'CMD',
        action = act.Multiple {
            act.SendKey { key = "a", mods = "CTRL" },
            act.SendKey { key = "c" },
        }
    },
    {
        key = '1',
        mods = 'CMD',
        action = act.Multiple {
            act.SendKey { key = "a", mods = "CTRL" },
            act.SendKey { key = "1" },
        }
    },
    {
        key = '2',
        mods = 'CMD',
        action = act.Multiple {
            act.SendKey { key = "a", mods = "CTRL" },
            act.SendKey { key = "2" },
        }
    },
    {
        key = '3',
        mods = 'CMD',
        action = act.Multiple {
            act.SendKey { key = "a", mods = "CTRL" },
            act.SendKey { key = "3" },
        }
    },
    {
        key = '4',
        mods = 'CMD',
        action = act.Multiple {
            act.SendKey { key = "a", mods = "CTRL" },
            act.SendKey { key = "4" },
        }
    },
    {
        key = '5',
        mods = 'CMD',
        action = act.Multiple {
            act.SendKey { key = "a", mods = "CTRL" },
            act.SendKey { key = "5" },
        }
    },
    {
        key = '6',
        mods = 'CMD',
        action = act.Multiple {
            act.SendKey { key = "a", mods = "CTRL" },
            act.SendKey { key = "6" },
        }
    },
    {
        key = '7',
        mods = 'CMD',
        action = act.Multiple {
            act.SendKey { key = "a", mods = "CTRL" },
            act.SendKey { key = "7" },
        }
    },
    {
        key = '8',
        mods = 'CMD',
        action = act.Multiple {
            act.SendKey { key = "a", mods = "CTRL" },
            act.SendKey { key = "8" },
        }
    },
    {
        key = '9',
        mods = 'CMD',
        action = act.Multiple {
            act.SendKey { key = "a", mods = "CTRL" },
            act.SendKey { key = "9" },
        }
    },
}

-- and finally, return the configuration to wezterm
return config
