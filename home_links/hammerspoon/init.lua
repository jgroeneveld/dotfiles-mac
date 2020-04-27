hs.loadSpoon("SpoonInstall")
spoon.SpoonInstall.use_syncinstall = true
Install=spoon.SpoonInstall







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
-- WindowManager
-- -----------------------------------------

wmModsDefault = {"ctrl", "alt"}
wmModsAlt = {"ctrl", "alt", "cmd"}
hs.grid.setMargins("8,8")
hs.window.animationDuration = 0.1

function getWin()
  return hs.window.focusedWindow()
end

function setGrid(gridSize, cell)
  hs.grid.setGrid(gridSize)
  hs.grid.set(getWin(), cell)
end

function setGridFn(gridSize, cell) return function() setGrid(gridSize, cell) end end

function alignAllToGrid()
  hs.grid.setGrid('3x2')
  hs.fnutils.each(hs.window.visibleWindows(), function(win) 
      hs.grid.snap(win)
  end)
end

-- WindowManager: General 

hs.hotkey.bind(wmModsDefault, "return", function() hs.grid.maximizeWindow() end)
hs.hotkey.bind(wmModsDefault, "delete", function() alignAllToGrid() end)
hs.hotkey.bind(wmModsDefault, "space", function() local win = getWin(); win:moveToScreen(win:screen():next()) end)
hs.hotkey.bind(wmModsAlt, "left", function() getWin():moveOneScreenWest() end)
hs.hotkey.bind(wmModsAlt, "right", function() getWin():moveOneScreenEast() end)

-- WindowManager: 2x2 Grid

hs.hotkey.bind(wmModsDefault, "left", setGridFn('2x2', {0, 0, 1, 2}))
hs.hotkey.bind(wmModsDefault, "right", setGridFn('2x2', {1, 0, 1, 2}))

-- WindowManager: 3x2 Grid

hs.hotkey.bind(wmModsDefault, "q", setGridFn('3x2', {0, 0, 1, 1}))
hs.hotkey.bind(wmModsDefault, "a", setGridFn('3x2', {0, 0, 1, 3}))
hs.hotkey.bind(wmModsDefault, "z", setGridFn('3x2', {0, 2, 1, 1}))

hs.hotkey.bind(wmModsDefault, "w", setGridFn('3x2', {1, 0, 1, 1}))
hs.hotkey.bind(wmModsDefault, "s", setGridFn('3x2', {1, 0, 1, 3}))
hs.hotkey.bind(wmModsDefault, "x", setGridFn('3x2', {1, 2, 1, 1}))

hs.hotkey.bind(wmModsDefault, "e", setGridFn('3x2', {2, 0, 1, 1}))
hs.hotkey.bind(wmModsDefault, "d", setGridFn('3x2', {2, 0, 1, 3}))
hs.hotkey.bind(wmModsDefault, "c", setGridFn('3x2', {2, 2, 1, 1}))

-- WindowManager: 5x2 Grid

hs.hotkey.bind(wmModsAlt, "q", setGridFn('5x2', { 0, 0, 1, 1}))
hs.hotkey.bind(wmModsAlt, "a", setGridFn('5x2', { 0, 0, 1, 3}))
hs.hotkey.bind(wmModsAlt, "z", setGridFn('5x2', { 0, 2, 1, 1}))

hs.hotkey.bind(wmModsAlt, "w", setGridFn('5x2', { 1, 0, 3, 1}))
hs.hotkey.bind(wmModsAlt, "s", setGridFn('5x2', { 1, 0, 3, 3}))
hs.hotkey.bind(wmModsAlt, "x", setGridFn('5x2', { 1, 2, 3, 1}))

hs.hotkey.bind(wmModsAlt, "e", setGridFn('5x2', { 4, 0, 1, 1}))
hs.hotkey.bind(wmModsAlt, "d", setGridFn('5x2', { 4, 0, 1, 3}))
hs.hotkey.bind(wmModsAlt, "c", setGridFn('5x2', { 4, 2, 1, 1}))

-- -- WindowManager: Special window sizes

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