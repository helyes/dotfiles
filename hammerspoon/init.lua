-- global
local hyper = {"cmd", "alt", "ctrl","shift"}
local log = hs.logger.new('hammerspoon','debug')

hs.application.enableSpotlightForNameSearches(true)

-- open hide app
function openApp(name)
  local app = hs.application.get(name)

  log.i("open App "..name)
  -- log.i(name)
  -- log.i(app)

  if app then
    if app:isFrontmost() then
      log.i("app hiding")
      app:hide()
    else
      log.i("app focusing ")
      app:mainWindow():focus()
    end
  else
    log.i("app launch ")
    hs.application.launchOrFocus(name)
  end
end

function alacritty()
  openApp("Alacritty")
end

function chrome()
  openApp("Google Chrome")
end

function chromium()
  openApp("Chromium")
end

function firefox()
  openApp("Firefox Developer Edition")
end

function iterm()
  openApp("iTerm")
end

function vscode()
  openApp("Visual Studio Code")
end

function forklift()
  openApp("ForkLift")
end

function slack()
  openApp("Slack")
end

function toggleSleep()
  if (hs.caffeinate.toggle("systemIdle")) then
    hs.alert.show("Preventing sleep")
  else
    hs.alert.show("Allowing sleep")
  end
end

-- apps
hs.hotkey.bind(hyper, 'a', alacritty)
hs.hotkey.bind(hyper, 'b', chromium)
hs.hotkey.bind(hyper, 'e', chromium)
-- hs.hotkey.bind(hyper, 'c', chrome)
hs.hotkey.bind(hyper, 'f', firefox)
-- hs.hotkey.bind(hyper, 'i', iterm)
hs.hotkey.bind(hyper, 's', slack)
hs.hotkey.bind(hyper, 'v', vscode)
hs.hotkey.bind(hyper, 'z', forklift)

-- sleep
hs.hotkey.bind(hyper, '=', toggleSleep)
-- hs.hotkey.bind(hyper, '=', function()
--   if (hs.caffeinate.toggle("systemIdle")) then
--     hs.alert.show("Preventing sleep")
--   else
--     hs.alert.show("Allowing sleep")
--   end
-- end)
-- local tv_identifier = "LG TV"
-- local mac_address = "4c:ba:d7:dd:82:86"
-- local tv_found = (hs.screen.find(tv_identifier) ~= nil)
-- local debug = true  -- Set to true to enable debug messages

-- if debug then
--   print("List of all screens: " .. hs.inspect(hs.screen.allScreens()))
--   if tv_found then print("TV with identifier '"..tv_identifier.."' was detected.") end
-- end

-- watcher = hs.caffeinate.watcher.new(function(eventType)
--   if (eventType == hs.caffeinate.watcher.screensDidWake or
--       eventType == hs.caffeinate.watcher.systemDidWake or
--       eventType == hs.caffeinate.watcher.screensDidUnlock) and tv_found then

--     if debug then print("TV was turned on.") end
--     hs.execute("/usr/local/bin/wakeonlan "..mac_address)
--   end
-- end)
-- watcher:start()