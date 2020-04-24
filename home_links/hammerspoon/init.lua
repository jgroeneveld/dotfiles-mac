hs.loadSpoon("SpoonInstall")
spoon.SpoonInstall.use_syncinstall = true
Install=spoon.SpoonInstall


-- Magnet replacement bindings

hs.hotkey.bind({"ctrl", "alt"}, "return", function()
  -- size focused window to size of desktop
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h
  win:setFrame(f)
end)


hs.hotkey.bind({"cmd", "alt", "ctrl"}, "F", function()
  -- toggle the focused window to full screen (workspace)
  local win = hs.window.focusedWindow()
  win:setFullScreen(not win:isFullScreen())
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "right", function()
  -- move the focused window one display to the right
  local win = hs.window.focusedWindow()
  win:moveOneScreenEast()
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "left", function()
  -- move the focused window one display to the left
  local win = hs.window.focusedWindow()
  win:moveOneScreenWest()
end)

-- args{columns, rows, left, top, width, height}
local function moveAndZoomGrid(args)
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local frame = screen:frame()
  local colSize = frame.w/args.columns
  local rowSize = frame.h/args.rows

  f.x = frame.x + args.left * colSize
  f.y = frame.y + args.top * rowSize
  f.w = colSize * args.width
  f.h = rowSize * args.height
  win:setFrame(f)
end

-- args{columns, left, width}
local function moveAndZoomColumns(args)
  moveAndZoomGrid{columns=args.columns, left=args.left, width=args.width, rows=1, top=0, height=1}
end

-- ========================
-- ===== Gridsize 1/2 =====
-- ========================

hs.hotkey.bind({"ctrl", "alt"}, "left", function()
  moveAndZoomColumns{columns=2, left=0, width=1}
end)


hs.hotkey.bind({"ctrl", "alt"}, "right", function()
  moveAndZoomColumns{columns=2, left=1, width=1}
end)

-- ========================
-- ===== Gridsize 1/3 =====
-- ========================

hs.hotkey.bind({"ctrl", "alt"}, "a", function()
  moveAndZoomColumns{columns=3, left=0, width=1}
end)

hs.hotkey.bind({"ctrl", "alt"}, "s", function()
  moveAndZoomColumns{columns=3, left=1, width=1}
end)

hs.hotkey.bind({"ctrl", "alt"}, "d", function()
  moveAndZoomColumns{columns=3, left=2, width=1}
end)

hs.hotkey.bind({"ctrl", "alt"}, "q", function()
  moveAndZoomGrid{columns=3, rows=2, left=0, top=0, width=1, height=1}
end)

hs.hotkey.bind({"ctrl", "alt"}, "z", function()
  moveAndZoomGrid{columns=3, rows=2, left=0, top=1, width=1, height=1}
end)


hs.hotkey.bind({"ctrl", "alt"}, "e", function()
  moveAndZoomGrid{columns=3, rows=2, left=2, top=0, width=1, height=1}
end)

hs.hotkey.bind({"ctrl", "alt"}, "c", function()
  moveAndZoomGrid{columns=3, rows=2, left=2, top=1, width=1, height=1}
end)

-- ========================
-- ===== Gridsize 1/5 =====
-- ========================

hs.hotkey.bind({"ctrl", "alt", "cmd"}, "a", function()
  moveAndZoomColumns{columns=5, left=0, width=1}
end)

hs.hotkey.bind({"ctrl", "alt", "cmd"}, "s", function()
  moveAndZoomColumns{columns=5, left=1, width=3}
end)

hs.hotkey.bind({"ctrl", "alt", "cmd"}, "d", function()
  moveAndZoomColumns{columns=5, left=4, width=1}
end)

hs.hotkey.bind({"ctrl", "alt", "cmd"}, "q", function()
  moveAndZoomGrid{columns=5, rows=2, left=0, top=0, width=1, height=1}
end)

hs.hotkey.bind({"ctrl", "alt", "cmd"}, "z", function()
  moveAndZoomGrid{columns=5, rows=2, left=0, top=1, width=1, height=1}
end)

hs.hotkey.bind({"ctrl", "alt", "cmd"}, "e", function()
  moveAndZoomGrid{columns=5, rows=2, left=4, top=0, width=1, height=1}
end)

hs.hotkey.bind({"ctrl", "alt", "cmd"}, "c", function()
  moveAndZoomGrid{columns=5, rows=2, left=4, top=1, width=1, height=1}
end)


hs.urlevent.bind("moveAndZoom_1of5_Right", function(eventName, params)
  moveAndZoom_1of5_Right()
  hs.alert.show("Done moving")
end)