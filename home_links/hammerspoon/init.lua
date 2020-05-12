hs.loadSpoon("SpoonInstall")
spoon.SpoonInstall.use_syncinstall = true
Install=spoon.SpoonInstall


require("spotifymenubar")



-- -----------------------------------------
-- Hyper Keys
-- -----------------------------------------

appLauncher = {"ctrl", "cmd"}
windowsDefault = {"ctrl", "alt"}
windowsAlt = {"ctrl", "alt", "cmd"}






-- -----------------------------------------
-- Reduce screen brightness if needed
-- -----------------------------------------

Install:andUse('Shade')





-- -----------------------------------------
-- MicMute
-- -----------------------------------------

Install:andUse('MicMute')
spoon.MicMute:bindHotkeys(
  {
    toggle = {{"cmd", "alt"}, "m"}
  },
  0.75
)






-- -----------------------------------------
-- App Launcher
-- -----------------------------------------

local function showOrLaunchApp(name)
  return function()
    hs.application.launchOrFocus(name)
  end
end

hs.hotkey.bind(appLauncher, "s", showOrLaunchApp("Google Chrome"))
hs.hotkey.bind(appLauncher, "e", showOrLaunchApp("Visual Studio Code"))
hs.hotkey.bind(appLauncher, "c", showOrLaunchApp("Alacritty"))






-- -----------------------------------------
-- WindowManager
-- -----------------------------------------


hs.grid.setMargins("8,8")
hs.window.animationDuration = 0.1

function getWin()
  return hs.window.focusedWindow()
end

function setGrid(gridSize, cell) 
  return function() 
    hs.grid.setGrid(gridSize)
    hs.grid.set(getWin(), cell)
  end
end

function alignAllToGrid()
  return function()
    hs.grid.setGrid('7x2')
    hs.fnutils.each(hs.window.visibleWindows(), function(win) 
        hs.grid.snap(win)
    end)
  end
end

-- WindowManager: General 

hs.hotkey.bind(windowsDefault, "return", function() hs.grid.maximizeWindow() end)
hs.hotkey.bind(windowsDefault, "delete", alignAllToGrid())
hs.hotkey.bind(windowsDefault, "space", function() local win = getWin(); win:moveToScreen(win:screen():next()) end)
hs.hotkey.bind(windowsAlt, "left", function() getWin():moveOneScreenWest() end)
hs.hotkey.bind(windowsAlt, "right", function() getWin():moveOneScreenEast() end)

-- WindowManager: 2x2 Grid

hs.hotkey.bind(windowsDefault, "left", setGrid('2x2', {0, 0, 1, 2}))
hs.hotkey.bind(windowsDefault, "right", setGrid('2x2', {1, 0, 1, 2}))

-- WindowManager: 3x2 Grid

hs.hotkey.bind(windowsDefault, "q", setGrid('3x2', {0, 0, 1, 1}))
hs.hotkey.bind(windowsDefault, "a", setGrid('3x2', {0, 0, 1, 3}))
hs.hotkey.bind(windowsDefault, "z", setGrid('3x2', {0, 2, 1, 1}))

hs.hotkey.bind(windowsDefault, "w", setGrid('3x2', {1, 0, 1, 1}))
hs.hotkey.bind(windowsDefault, "s", setGrid('3x2', {1, 0, 1, 3}))
hs.hotkey.bind(windowsDefault, "x", setGrid('3x2', {1, 2, 1, 1}))

hs.hotkey.bind(windowsDefault, "e", setGrid('3x2', {2, 0, 1, 1}))
hs.hotkey.bind(windowsDefault, "d", setGrid('3x2', {2, 0, 1, 3}))
hs.hotkey.bind(windowsDefault, "c", setGrid('3x2', {2, 2, 1, 1}))

-- WindowManager: 7x2 Grid

hs.hotkey.bind(windowsAlt, "q", setGrid('7x2', { 0, 0, 2, 1}))
hs.hotkey.bind(windowsAlt, "a", setGrid('7x2', { 0, 0, 2, 3}))
hs.hotkey.bind(windowsAlt, "z", setGrid('7x2', { 0, 2, 2, 1}))

hs.hotkey.bind(windowsAlt, "w", setGrid('7x2', { 2, 0, 3, 1}))
hs.hotkey.bind(windowsAlt, "s", setGrid('7x2', { 2, 0, 3, 3}))
hs.hotkey.bind(windowsAlt, "x", setGrid('7x2', { 2, 2, 3, 1}))

hs.hotkey.bind(windowsAlt, "e", setGrid('7x2', { 5, 0, 2, 1}))
hs.hotkey.bind(windowsAlt, "d", setGrid('7x2', { 5, 0, 2, 3}))
hs.hotkey.bind(windowsAlt, "c", setGrid('7x2', { 5, 2, 2, 1}))

-- WindowManager: Special window sizes

hs.urlevent.bind("window1920x1080", function(eventName, params)
  local win = getWin()
  local f = win:frame()
  local screen = win:screen()
  local frame = screen:frame()

  f.x = frame.x + frame.w/2 - 1920/2
  f.y = frame.y + frame.h/2 - 1080/2
  f.w = 1920
  f.h = 1080
  win:setFrame(f)
end)

