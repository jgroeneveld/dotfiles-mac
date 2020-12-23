hs.loadSpoon("SpoonInstall")
spoon.SpoonInstall.use_syncinstall = true
Install=spoon.SpoonInstall

-- require("spotifymenubar")


-- -----------------------------------------
-- Hyper Keys
-- -----------------------------------------

local hyper = require('hyper')
hyper.install('F18') 


appKeys = {"ctrl", "cmd"}
windowsDefault = {"ctrl", "alt"}

-- -----------------------------------------
-- App Management
-- -----------------------------------------

local am = require('app-management')

local apps = {
  {'s', "Google Chrome"},
  {'e', "PhpStorm"},
  {'c', "Alacritty"},  
  {'z', "Slack"},  
  {'x', "Spark"},  
  {'p', "Spotify"}
}
for i, app in ipairs(apps) do
  hs.hotkey.bind(appKeys, app[1], function() am.switchToAndFromApp(app[2]) end)
end


-- -----------------------------------------
-- Reduce screen brightness if needed
-- -----------------------------------------

-- Install:andUse('Shade')




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
-- Layouts
-- -----------------------------------------

local wm = require('window-management')

hyper.bindKey('1', function()
  wm.gridLayout({
    grid = "7x2",
    launch = {
      "Google Chrome",
      "Things",
      "Slack",
      "Spark"
    },
    layout = {
      { "WhatsApp", wm.gridLeft},
      { "Spotify", wm.gridLeft},
      { "Slack", wm.gridLeft},
      { "Newton", wm.gridMid},
      { "HEY", wm.gridMid},
      { "Spark", wm.gridMid},
      { "Google Chrome", wm.gridMid},
      { "PhpStorm", wm.gridMid},
      { "Things", wm.gridRight},
      { "Sublime Text", wm.gridRight},
      { "Alacritty", wm.gridTopRight}
    }
  })
end)

-- -----------------------------------------
-- WindowManager
-- -----------------------------------------


function setGridMargins()
  hs.grid.setMargins("8,8")  
end

function unsetGridMargins()
  hs.grid.setMargins("0,0")  
end

function setFullGrid(gridSize, cell) 
  return function()
    unsetGridMargins() 
    hs.grid.setGrid(gridSize)
    hs.grid.set(hs.window.focusedWindow(), cell)
    setGridMargins()
  end
end

function setGrid(gridSize, cell) 
  return function() 
    hs.grid.setGrid(gridSize)
    hs.grid.set(hs.window.focusedWindow(), cell)
  end
end

setGridMargins()
hs.window.animationDuration = 0.1

-- WindowManager: General 

hyper.bindKey("up", wm.maximizeWindow)
hyper.bindKey("delete", wm.alignAllToGrid)

-- WindowManager: 2x2 Grid

hyper.bindKey("left", wm.setHalfFrameLeft)
hyper.bindKey("right", wm.setHalfFrameRight)

-- WindowManager: 7x2 Gridf

hyper.bindKey("q", setGrid('7x2', wm.gridTopLeft))
hyper.bindKey("a", setGrid('7x2', wm.gridLeft))
hyper.bindKey("z", setGrid('7x2', wm.gridBottomLeft))

hyper.bindKey("w", setGrid('7x2', wm.gridTopMid))
hyper.bindKey("s", setGrid('7x2', wm.gridMid))
hyper.bindKey("x", setGrid('7x2', wm.gridBottomMid))

hyper.bindKey("e", setGrid('7x2', wm.gridTopRight))
hyper.bindKey("d", setGrid('7x2', wm.gridRight))
hyper.bindKey("c", setGrid('7x2', wm.gridBottomRight))

hyper.bindKey("u", function() hs.grid.show() end)
hyper.bindKey("j", setGrid('7x2', wm.gridOversizeLeft))
hyper.bindKey("k", setGrid('7x2', wm.gridOversizeMid))
hyper.bindKey("l", setGrid('7x2', wm.gridOversizeRight))

-- WindowManager: Special window sizes

hs.urlevent.bind("window1920x1080", function(eventName, params)
  local win = hs.window.focusedWindow()
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
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local frame = screen:frame()

  f.x = frame.x + frame.w/2 - 1280/2
  f.y = frame.y + frame.h/2 - 720/2
  f.w = 1280
  f.h = 720
  win:setFrame(f)
end)
