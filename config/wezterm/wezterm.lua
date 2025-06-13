local wezterm = require 'wezterm'
local sessionizer = require("sessionizer")

-- Integration with neovim panes
local function isViProcess(pane)
    -- get_foreground_process_name On Linux, macOS and Windows,
    -- the process can be queried to determine this path. Other operating systems
    -- (notably, FreeBSD and other unix systems) are not currently supported
    -- return pane:get_foreground_process_name():find('n?vim') ~= nil
    -- Use get_title as it works for multiplexed sessions too
    return pane:get_title():find("n?vim") ~= nil
end

local function conditionalActivatePane(window, pane, pane_direction, vim_direction)
    local vim_pane_changed = false

    if isViProcess(pane) then
        local before = pane:get_cursor_position()
        window:perform_action(
            -- This should match the keybinds you set in Neovim.
            wezterm.action.SendKey({ key = vim_direction, mods = 'CTRL' }),
            pane
        )
        wezterm.sleep_ms(50)
        local after = pane:get_cursor_position()

        if before.x ~= after.x and before.y ~= after.y then
            vim_pane_changed = true
        end
    end

    if not vim_pane_changed then
        window:perform_action(wezterm.action.ActivatePaneDirection(pane_direction), pane)
    end
end

wezterm.on('ActivatePaneDirection-right', function(window, pane)
    conditionalActivatePane(window, pane, 'Right', 'l')
end)
wezterm.on('ActivatePaneDirection-left', function(window, pane)
    conditionalActivatePane(window, pane, 'Left', 'h')
end)
wezterm.on('ActivatePaneDirection-up', function(window, pane)
    conditionalActivatePane(window, pane, 'Up', 'k')
end)
wezterm.on('ActivatePaneDirection-down', function(window, pane)
    conditionalActivatePane(window, pane, 'Down', 'j')
end)

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

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
local config = {}
if wezterm.config_builder then
    config = wezterm.config_builder()
end

config = {
    -- session persistence
    unix_domains = {
      {
        name = 'unix',
      },
    },
    default_gui_startup_args = { 'connect', 'unix' },
    color_scheme = scheme_for_appearance(get_appearance()),
    freetype_load_flags = 'NO_HINTING',
    window_background_opacity = 1,
    font_size = 13,
    font = wezterm.font 'SauceCodePro Nerd Font',
    warn_about_missing_glyphs = false,
    window_decorations = "TITLE|RESIZE",
    enable_wayland = true,
    window_close_confirmation = 'NeverPrompt',
    leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 },
    keys = {
        { key = "f", mods = "SUPER", action = wezterm.action_callback(sessionizer.toggle) },
        { key = 's', mods = 'LEADER', action = wezterm.action.ShowLauncherArgs { flags = 'WORKSPACES' } },
        { key = '[', mods = 'SUPER', action = wezterm.action.SwitchWorkspaceRelative(1) },
        { key = ']', mods = 'SUPER', action = wezterm.action.SwitchWorkspaceRelative(-1) },
        { key = '=', mods = 'LEADER', action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain'} },
        { key = '-', mods = 'LEADER', action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain'} },
        -- Integration with neovim panes
        { key = 'h', mods = 'CTRL', action = wezterm.action.EmitEvent('ActivatePaneDirection-left') },
        { key = 'j', mods = 'CTRL', action = wezterm.action.EmitEvent('ActivatePaneDirection-down') },
        { key = 'k', mods = 'CTRL', action = wezterm.action.EmitEvent('ActivatePaneDirection-up') },
        { key = 'l', mods = 'CTRL', action = wezterm.action.EmitEvent('ActivatePaneDirection-right') },
        -- { key = 'h', mods = 'CTRL', action = wezterm.action.ActivatePaneDirection("Left") },
        -- { key = 'j', mods = 'CTRL', action = wezterm.action.ActivatePaneDirection("Down") },
        -- { key = 'k', mods = 'CTRL', action = wezterm.action.ActivatePaneDirection("Up") },
        -- { key = 'l', mods = 'CTRL', action = wezterm.action.ActivatePaneDirection("Right") },
    }
}

return config
