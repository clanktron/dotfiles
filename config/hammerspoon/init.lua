-- lua lsp stuff
hs.loadSpoon("EmmyLua")

-- terminal hotkey
hs.application.enableSpotlightForNameSearches(true)
hs.hotkey.bind({"cmd"}, "e", function()
  local wezterm = hs.application.find('wezterm')
  if wezterm ~= nil and wezterm:isFrontmost() then
    wezterm:hide()
  else
    hs.application.launchOrFocus("Wezterm")
    wezterm.activate(wezterm)
  end
end
)
