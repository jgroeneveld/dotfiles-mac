hs.loadSpoon("SpoonInstall")
spoon.SpoonInstall.use_syncinstall = true
Install=spoon.SpoonInstall

-- require("spotifymenubar")



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

-- Install:andUse('MicMute')
-- spoon.MicMute:bindHotkeys(
--   {
--     toggle = {{"cmd", "alt"}, "m"}
--   },
--   0.75
-- )






-- -----------------------------------------
-- App Launcher
-- -----------------------------------------

local function showOrLaunchApp(name)
  return function()
    hs.application.launchOrFocus(name)
  end
end

hs.hotkey.bind(appLauncher, "s", showOrLaunchApp("Google Chrome"))
hs.hotkey.bind(appLauncher, "e", showOrLaunchApp("PhpStorm"))
hs.hotkey.bind(appLauncher, "c", showOrLaunchApp("Alacritty"))

hs.hotkey.bind(appLauncher, "z", showOrLaunchApp("Slack"))
hs.hotkey.bind(appLauncher, "x", showOrLaunchApp("Spark"))


-- -----------------------------------------
-- Layouts
-- -----------------------------------------

hs.hotkey.bind(appLauncher, '1', function()
  local windowInFocusBefore = getWin();

	hs.grid.setGrid("7x2")

	hs.application.launchOrFocus('Google Chrome')
	hs.application.launchOrFocus('Things')
	hs.application.launchOrFocus('Slack')
	hs.application.launchOrFocus('Spark')

	setAppInGrid("Spotify", { 0, 0, 2, 3}) -- left
	setAppInGrid("Slack", { 0, 0, 2, 3}) -- left

	setAppInGrid("Spark", { 2, 0, 3, 3}) -- mid
	setAppInGrid("Google Chrome", { 2, 0, 3, 3}) -- mid
  setAppInGrid("PhpStorm", { 2, 0, 3, 3}) -- mid

	setAppInGrid("Things", { 5, 0, 2, 3}) -- right
	setAppInGrid("Sublime Text", { 5, 0, 2, 3}) -- right
	setAppInGrid("Alacritty", { 5, 0, 2, 1}) -- top right

  windowInFocusBefore:focus();
end)


-- -----------------------------------------
-- WindowManager
-- -----------------------------------------
function setAppInGrid(appname, cell)
	local app = hs.appfinder.appFromName(appname);
	if (app ~= nil) then
	    hs.fnutils.each(app:allWindows(), function(win) 
	    	hs.grid.set(win, cell)
	    end)
	end
end

function setGridMargins()
  hs.grid.setMargins("8,8")  
end

function unsetGridMargins()
  hs.grid.setMargins("0,0")  
end

function maximizeWindow()
  unsetGridMargins()
  hs.grid.maximizeWindow()
  setGridMargins()
end

function getWin()
  return hs.window.focusedWindow()
end

function setFullGrid(gridSize, cell) 
  return function()
    unsetGridMargins() 
    hs.grid.setGrid(gridSize)
    hs.grid.set(getWin(), cell)
    setGridMargins()
  end
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

setGridMargins()
hs.window.animationDuration = 0.1

-- WindowManager: General 

hs.hotkey.bind(windowsAlt, "return", maximizeWindow)
hs.hotkey.bind(windowsAlt, "delete", alignAllToGrid())
hs.hotkey.bind(windowsAlt, "space", function() local win = getWin(); win:moveToScreen(win:screen():next()) end)
hs.hotkey.bind(windowsAlt, "left", function() getWin():moveOneScreenWest() end)
hs.hotkey.bind(windowsAlt, "right", function() getWin():moveOneScreenEast() end)

-- WindowManager: 2x2 Grid

hs.hotkey.bind(windowsDefault, "left", setFullGrid('2x2', {0, 0, 1, 2}))
hs.hotkey.bind(windowsDefault, "right", setFullGrid('2x2', {1, 0, 1, 2}))

-- WindowManager: 3x2 Grid

hs.hotkey.bind(windowsAlt, "q", setGrid('3x2', {0, 0, 1, 1}))
hs.hotkey.bind(windowsAlt, "a", setGrid('3x2', {0, 0, 1, 3}))
hs.hotkey.bind(windowsAlt, "z", setGrid('3x2', {0, 2, 1, 1}))

hs.hotkey.bind(windowsAlt, "w", setGrid('3x2', {1, 0, 1, 1}))
hs.hotkey.bind(windowsAlt, "s", setGrid('3x2', {1, 0, 1, 3}))
hs.hotkey.bind(windowsAlt, "x", setGrid('3x2', {1, 2, 1, 1}))

hs.hotkey.bind(windowsAlt, "e", setGrid('3x2', {2, 0, 1, 1}))
hs.hotkey.bind(windowsAlt, "d", setGrid('3x2', {2, 0, 1, 3}))
hs.hotkey.bind(windowsAlt, "c", setGrid('3x2', {2, 2, 1, 1}))

-- WindowManager: 7x2 Grid

hs.hotkey.bind(windowsDefault, "q", setGrid('7x2', { 0, 0, 2, 1}))
hs.hotkey.bind(windowsDefault, "a", setGrid('7x2', { 0, 0, 2, 3}))
hs.hotkey.bind(windowsDefault, "z", setGrid('7x2', { 0, 2, 2, 1}))

hs.hotkey.bind(windowsDefault, "w", setGrid('7x2', { 2, 0, 3, 1}))
hs.hotkey.bind(windowsDefault, "s", setGrid('7x2', { 2, 0, 3, 3}))
hs.hotkey.bind(windowsDefault, "x", setGrid('7x2', { 2, 2, 3, 1}))

hs.hotkey.bind(windowsDefault, "e", setGrid('7x2', { 5, 0, 2, 1}))
hs.hotkey.bind(windowsDefault, "d", setGrid('7x2', { 5, 0, 2, 3}))
hs.hotkey.bind(windowsDefault, "c", setGrid('7x2', { 5, 2, 2, 1}))

hs.hotkey.bind(windowsDefault, "m", setGrid('7x2', { 1, 0, 5, 3}))

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

hs.urlevent.bind("window1280x720", function(eventName, params)
  local win = getWin()
  local f = win:frame()
  local screen = win:screen()
  local frame = screen:frame()

  f.x = frame.x + frame.w/2 - 1280/2
  f.y = frame.y + frame.h/2 - 720/2
  f.w = 1280
  f.h = 720
  win:setFrame(f)
end)

