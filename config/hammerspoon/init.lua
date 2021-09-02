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

-- open iA Writer with "cmd+ctrl+a"
hs.hotkey.bind({"cmd", "ctrl"}, "a", function()
  hs.application.open('iA Writer.app')
end)

-- open Brave with "cmd+ctrl+b"
hs.hotkey.bind({"cmd", "ctrl"}, "b", function()
  hs.application.open('Brave Browser.app')
end)

-- open Dash with "cmd+ctrl+d"
hs.hotkey.bind({"cmd", "ctrl"}, "d", function()
  hs.application.open('Dash.app')
end)

-- open Firefox with "cmd+ctrl+f"
hs.hotkey.bind({"cmd", "ctrl"}, "f", function()
  hs.application.open('Firefox.app')
end)

-- open Figma with "cmd+ctrl+g"
hs.hotkey.bind({"cmd", "ctrl"}, "g", function()
  hs.application.open('Figma.app')
end)

-- open Insomnia with "cmd+ctrl+i"
hs.hotkey.bind({"cmd", "ctrl"}, "i", function()
  hs.application.open('Insomnia.app')
end)

-- open Kitty with "cmd+ctrl+k"
hs.hotkey.bind({"cmd", "ctrl"}, "k", function()
  hs.application.open('Kitty.app')
end)

-- open Mail with "cmd+ctrl+m"
hs.hotkey.bind({"cmd", "ctrl"}, "m", function()
  hs.application.open('Mail.app')
end)

-- open Nova with "cmd+ctrl+n"
hs.hotkey.bind({"cmd", "ctrl"}, "n", function()
  hs.application.open('Notion.app')
end)

-- open Spotify with "cmd+ctrl+p"
hs.hotkey.bind({"cmd", "ctrl"}, "p", function()
  hs.application.open('Spotify.app')
end)

-- open Safari with "cmd+ctrl+s"
hs.hotkey.bind({"cmd", "ctrl"}, "s", function()
  hs.application.open('Safari.app')
end)

-- open TextEdit with "cmd+ctrl+t"
hs.hotkey.bind({"cmd", "ctrl"}, "t", function()
  hs.application.open('TextEdit.app')
end)

-- open Notion with "cmd+ctrl+v"
hs.hotkey.bind({"cmd", "ctrl"}, "v", function()
  hs.application.open('Nova.app')
end)
