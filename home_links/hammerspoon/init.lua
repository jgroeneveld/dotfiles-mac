-- hs.loadSpoon("SpoonInstall")
-- spoon.SpoonInstall.use_syncinstall = true
-- Install=spoon.SpoonInstall


-- -----------------------------------------
-- Hyper Keys
-- -----------------------------------------

local hyper = require('hyper')

hyper.install('F18') -- capslock with karabiner
local appKeys = {"ctrl", "cmd"}


-- -----------------------------------------
-- App Management
-- -----------------------------------------

local am = require('app-management')

am.bindSwitchToAndFromApps(appKeys, {
  {'s', "Google Chrome"},
  {'e', "PhpStorm"},
  {'g', "Sublime Merge"},
  {'c', "Alacritty"},  
  {'z', "Slack"},  
  {'x', "Spark"},  
  {'p', "Spotify"}
})


-- -----------------------------------------
-- WindowManager
-- -----------------------------------------

local wm = require('window-management')

hs.grid.setGrid('7x2')
hs.grid.setMargins("8,8")
hs.window.animationDuration = 0

-- WindowManager: General 

hyper.bindKey("up", wm.maximizeWindow)
hyper.bindKey("delete", wm.alignAllToGrid)

-- WindowManager: 2x2 Grid

hyper.bindKey("left", wm.setHalfFrameLeft)
hyper.bindKey("right", wm.setHalfFrameRight)

-- WindowManager: 7x2 Grid

hyper.bindKey("q", wm.setGridFn(wm.gridTopLeft))
hyper.bindKey("a", wm.setGridFn(wm.gridLeft))
hyper.bindKey("z", wm.setGridFn(wm.gridBottomLeft))

hyper.bindKey("w", wm.setGridFn(wm.gridTopMid))
hyper.bindKey("s", wm.setGridFn(wm.gridMid))
hyper.bindKey("x", wm.setGridFn(wm.gridBottomMid))

hyper.bindKey("e", wm.setGridFn(wm.gridTopRight))
hyper.bindKey("d", wm.setGridFn(wm.gridRight))
hyper.bindKey("c", wm.setGridFn(wm.gridBottomRight))

hyper.bindKey("u", function() hs.grid.show() end)
hyper.bindShiftKey("left", wm.setGridFn(wm.gridOversizeLeft))
hyper.bindShiftKey("up", wm.setGridFn(wm.gridOversizeMid))
hyper.bindShiftKey("right", wm.setGridFn(wm.gridOversizeRight))

-- WindowManager: Layouts

hyper.bindKey('1', function()
  wm.gridLayout({
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

-- WindowManager: Special window sizes

hs.urlevent.bind("window1920x1080", function(eventName, params)
  wm.resizeCentered(1920, 1080)
end)

hs.urlevent.bind("window1280x720", function(eventName, params)
  wm.resizeCentered(1280, 720)
end)
