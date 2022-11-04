hs.hotkey.bind({"cmd"}, "e", function()
  alacritty = hs.application.find('alacritty')
  if alacritty ~= nil and alacritty:isFrontmost() then
    alacritty:hide()
  else
    hs.application.launchOrFocus("/Applications/Alacritty.app")
    alacritty.activate(alacritty)
  end
end
)