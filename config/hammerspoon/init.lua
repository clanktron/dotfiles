-- lua lsp stuff
-- hs.loadSpoon("EmmyLua")

-- terminal hotkey
hs.application.enableSpotlightForNameSearches(true)

apps = {
  {key="1", app="Ghostty"},
  {key="2", app="Safari"},
  {key="3", app="Spotify"},
  {key="4", app="Slack"}
}

for _, a in ipairs(apps) do
  hs.hotkey.bind({"alt"}, a.key, function()
    hs.application.launchOrFocus(a.app)
  end)
end
