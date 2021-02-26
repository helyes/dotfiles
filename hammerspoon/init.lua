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

function chrome()
  openApp("Google Chrome")
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

function toggleSleep()
  if (hs.caffeinate.toggle("systemIdle")) then
    hs.alert.show("Preventing sleep")
  else
    hs.alert.show("Allowing sleep")
  end
end


-- apps
hs.hotkey.bind(hyper, 'c', chrome)
hs.hotkey.bind(hyper, 'f', firefox)
hs.hotkey.bind(hyper, 'i', iterm)
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
