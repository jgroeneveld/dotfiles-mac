hs.loadSpoon("SpoonInstall")
spoon.SpoonInstall.use_syncinstall = true
Install=spoon.SpoonInstall


-- -----------------------------------------
-- Reduce screen brightness if needed
-- -----------------------------------------


Install:andUse('Shade')


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

am.bindSwitchToApps(appKeys, {
  {'s', "Google Chrome"},
  {'e', "Visual Studio Code"},
  {'g', "Sublime Merge"},
  {'c', "Alacritty"},  
  {'z', "Slack"},  
  {'x', "Spark"},  
  {'p', "Spotify"},
  {'m', "Things3"}
})


-- -----------------------------------------
-- WindowManager
-- -----------------------------------------

local wm = require('window-management')
local grid = wm.gridSmall;

hs.grid.setGrid(grid.dimensions)
-- hs.grid.setMargins("4,4")
hs.grid.setMargins("0,0")
hs.window.animationDuration = 0

-- WindowManager: General 

hyper.bindKey("up", wm.maximizeWindow)
hyper.bindKey("delete", function() wm.alignAllToGrid(grid.dimensions) end)

-- WindowManager: 2x2 Grid

-- hyper.bindKey("up", wm.maximizeWindow)
hyper.bindKey("left", wm.setHalfFrameLeft)
hyper.bindKey("right", wm.setHalfFrameRight)

-- WindowManager: 7x2 Grid
hyper.bindKey("q", wm.setGridFn(grid.topLeftCell))
hyper.bindKey("a", wm.setGridFn(grid.leftCell))
hyper.bindKey("z", wm.setGridFn(grid.bottomLeftCell))

hyper.bindKey("w", wm.setGridFn(grid.topMidCell))
hyper.bindKey("s", wm.setGridFn(grid.midCell))
hyper.bindKey("x", wm.setGridFn(grid.bottomMidCell))

hyper.bindKey("e", wm.setGridFn(grid.topRightCell))
hyper.bindKey("d", wm.setGridFn(grid.rightCell))
hyper.bindKey("c", wm.setGridFn(grid.bottomRightCell))

hyper.bindKey("u", function() hs.grid.show() end)
hyper.bindShiftKey("left", wm.setGridFn(wm.gridOversizeLeft))
hyper.bindShiftKey("up", wm.setGridFn(wm.gridOversizeMid))
hyper.bindShiftKey("right", wm.setGridFn(wm.gridOversizeRight))

hyper.bindKey("m", function()
  -- get the focused window
  local win = hs.window.focusedWindow()
  -- get the screen where the focused window is displayed, a.k.a. current screen
  local screen = win:screen()
  -- compute the unitRect of the focused window relative to the current screen
  -- and move the window to the next screen setting the same unitRect 
  win:move(win:frame():toUnitRect(screen:frame()), screen:next(), true, 0)
end)

-- WindowManager: Layouts

hyper.bindKey('1', function()
  wm.gridLayout({
    gridDimensions = grid.dimensions,
    launch = {
      "Google Chrome",
      "Things3",
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
      { "com.culturedcode.ThingsMac", wm.gridRight},
      { "Sublime Text", wm.gridRight},
      { "Alacritty", wm.gridTopRight}
    }
  })

  hs.alert.show("Arbeit Arbeit !!", { textSize  = 50, })
end)

hyper.bindKey('p', function()
  am.showBundleId()
end)

hyper.bindKey('2', function()
  am.killApps({
    "com.tinyspeck.slackmacgap",
    "Spark",
    "Spotify",
    "PhpStorm",
    "com.culturedcode.ThingsMac",
    "Bear",
    "Sublime Text",
    -- "Code",
    "Agenda",
    "Alacritty"
  })

  hs.alert.show("Feierabend !!", { textSize  = 50, })
end)

-- WindowManager: Special window sizes

hs.urlevent.bind("window1920x1080", function(eventName, params)
  wm.resizeCentered(1920, 1080)
end)

hs.urlevent.bind("window1280x720", function(eventName, params)
  wm.resizeCentered(1280, 720)
end)
