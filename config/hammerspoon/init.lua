-- lua lsp stuff
-- hs.loadSpoon("EmmyLua")

-- terminal hotkey
hs.application.enableSpotlightForNameSearches(true)

apps = {
  {key="1", app="ghostty"},
  {key="2", app="safari"},
  {key="3", app="spotify"},
  {key="4", app="slack"}
}

for _, a in ipairs(apps) do
  hs.hotkey.bind({"alt"}, a.key, function()
    hs.application.launchOrFocus(a.app)
  end)
end
