-- http://www.hammerspoon.org/

-- reload config each time this file changes
function reloadConfig(files)
  doReload = false
  for _,file in pairs(files) do
    if file:sub(-4) == ".lua" then
      doReload = true
    end
  end
  if doReload then
    hs.reload()
  end
end
myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Config loaded")

-- open Kitty with F1
hs.hotkey.bind({}, "f1", function()
  hs.application.open('Kitty.app')
end)
-- open Nova with F2
hs.hotkey.bind({}, "f2", function()
  hs.application.open('Nova.app')
end)
-- open Safari with F3
hs.hotkey.bind({}, "f3", function()
  hs.application.open('Safari.app')
end)
-- open Notion with F4
hs.hotkey.bind({}, "f4", function()
  hs.application.open('Notion.app')
end)
-- open Firefox with F5
hs.hotkey.bind({}, "f5", function()
  hs.application.open('Firefox.app')
end)
-- open iA Writer with F6
hs.hotkey.bind({}, "f6", function()
  hs.application.open('iA Writer.app')
end)
-- open Dash with F7
hs.hotkey.bind({}, "f7", function()
  hs.application.open('Dash.app')
end)
-- open TextEdit with F8
hs.hotkey.bind({}, "f8", function()
  hs.application.open('TextEdit.app')
end)
-- open Mail with F9
hs.hotkey.bind({}, "f9", function()
  hs.application.open('Mail.app')
end)
-- open Spotify with F10
hs.hotkey.bind({}, "f10", function()
  hs.application.open('Spotify.app')
end)
-- open Brave with F11
hs.hotkey.bind({}, "f11", function()
  hs.application.open('Brave Browser.app')
end)
-- open Insomnia with F12
hs.hotkey.bind({}, "f12", function()
  hs.application.open('Insomnia.app')
end)
