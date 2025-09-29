-- lua lsp stuff
-- hs.loadSpoon("EmmyLua")

hs.application.enableSpotlightForNameSearches(true)

local function toggleApplication(application)
  local app = hs.application.find(application)
  if app ~= nil and app:isFrontmost() then
    app:hide()
  else
    hs.application.launchOrFocus(application)
    local launchedApp = hs.application.find(appName)
    if launchedApp then
      launchedApp:activate()
    end
  end
end

hs.hotkey.bind({"cmd"}, "1", function()
    toggleApplication('ghostty')
end
)

hs.hotkey.bind({"cmd"}, "2", function()
    toggleApplication('firefox')
end
)

hs.hotkey.bind({"cmd"}, "3", function()
    toggleApplication('spotify')
end
)

hs.hotkey.bind({"cmd"}, "4", function()
    toggleApplication('slack')
end
)
