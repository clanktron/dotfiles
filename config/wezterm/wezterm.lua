local wezterm = require 'wezterm'
local sessionizer = require("sessionizer")
local act = wezterm.action

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
            act.SendKey({ key = vim_direction, mods = 'CTRL' }),
            pane
        )
        wezterm.sleep_ms(50)
        local after = pane:get_cursor_position()

        if before.x ~= after.x and before.y ~= after.y then
            vim_pane_changed = true
        end
    end

    if not vim_pane_changed then
        window:perform_action(act.ActivatePaneDirection(pane_direction), pane)
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
    ssh_domains = {
      {
        -- This name identifies the domain
        name = 'fedora.local',
        remote_address = 'fedora.local',
        -- The hostname or address to connect to. Will be used to match settings
        -- from your ssh config file
      }
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
    enable_tab_bar = false,
    window_close_confirmation = 'NeverPrompt',
    leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 },
    keys = {
        { key = "f", mods = "SUPER", action = wezterm.action_callback(sessionizer.toggle) },
        { key = 's', mods = 'LEADER', action = act.ShowLauncherArgs { flags = 'FUZZY|WORKSPACES' } },
        { key = '[', mods = 'SUPER', action = act.SwitchWorkspaceRelative(1) },
        { key = ']', mods = 'SUPER', action = act.SwitchWorkspaceRelative(-1) },
        { key = '=', mods = 'LEADER', action = act.SplitHorizontal { domain = 'CurrentPaneDomain'} },
        { key = '-', mods = 'LEADER', action = act.SplitVertical { domain = 'CurrentPaneDomain'} },
        { key = 'm', mods = 'LEADER', action = act.TogglePaneZoomState },
        -- Integration with neovim panes
        { key = 'h', mods = 'CTRL', action = act.EmitEvent('ActivatePaneDirection-left') },
        { key = 'j', mods = 'CTRL', action = act.EmitEvent('ActivatePaneDirection-down') },
        { key = 'k', mods = 'CTRL', action = act.EmitEvent('ActivatePaneDirection-up') },
        { key = 'l', mods = 'CTRL', action = act.EmitEvent('ActivatePaneDirection-right') },
        -- { key = 'h', mods = 'CTRL', action = act..ActivatePaneDirection("Left") },
        -- { key = 'j', mods = 'CTRL', action = act..ActivatePaneDirection("Down") },
        -- { key = 'k', mods = 'CTRL', action = act..ActivatePaneDirection("Up") },
        -- { key = 'l', mods = 'CTRL', action = act..ActivatePaneDirection("Right") },
    }
}

return config
