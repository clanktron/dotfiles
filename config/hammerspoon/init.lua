hs.loadSpoon("EmmyLua")

hs.hotkey.bind({"cmd"}, "e", function()
  local alacritty = hs.application.find('alacritty')
  if alacritty ~= nil and alacritty:isFrontmost() then
    alacritty:hide()
  else
    hs.application.launchOrFocus("/Applications/Alacritty.app")
    alacritty.activate(alacritty)
  end
end
)

hs.loadSpoon("Swipe")
-- use three finger swipe to focus nearby window
local current_id, threshold
Swipe = hs.loadSpoon("Swipe")
Swipe:start(3, function(direction, distance, id)
    if id == current_id then
        if distance > threshold then
            threshold = math.huge -- only trigger once per swipe
            -- use "natural" scrolling
            local aerospaceExecutable = "/usr/local/bin/aerospace"
            print("triggered")
            if direction == "left" then
                print('Swiped Left')
                print(hs.execute('echo test', false))
                -- print(hs.execute('/Users/clayton/.rd/bin/kubectl get pods', false))
                print(hs.execute('/usr/local/bin/aerospace list-workspaces --monitor mouse --visible', false))
                -- print(hs.execute('/usr/local/bin/aerospace "$(/usr/local/bin/aerospace list-workspaces --monitor mouse --visible)" && /usr/local/bin/aerospace workspace next'))
                -- print(hs.execute(aerospaceExecutable.. '"$(' ..aerospaceExecutable.. ' list-workspaces --monitor mouse --visible)" && ' ..aerospaceExecutable.. ' workspace next'))
                -- print(os.execute('/usr/local/bin/aerospace workspace 8'))
            elseif direction == "right" then
                print('Swiped Right')
                -- print(hs.execute('/usr/local/bin/aerospace "$(/usr/local/bin/aerospace list-workspaces --monitor mouse --visible)" && /usr/local/bin/aerospace workspace prev'))
                -- print(hs.execute(aerospaceExecutable.. '"$(' ..aerospaceExecutable.. ' list-workspaces --monitor mouse --visible)" && ' ..aerospaceExecutable.. ' workspace prev'))
                -- print(os.execute('/usr/local/bin/aerospace workspace 4'))
            end
        end
    else
        current_id = id
        threshold = 0.05 -- swipe distance > 20% of trackpad
    end
end)

