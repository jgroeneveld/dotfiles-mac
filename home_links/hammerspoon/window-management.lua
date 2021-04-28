-- WindowManagement by Jaap

local This = {}

function This.gridLayout(config)
  local windowInFocusBefore = hs.window.focusedWindow();

  This.alignAllToGrid(config.gridDimensions)

  for i, app in ipairs(config.launch) do
    hs.application.launchOrFocus(app)
  end

  for i, app in ipairs(config.layout) do
    This.setAppInGrid(app[1], app[2])
  end

  windowInFocusBefore:focus();
end

function This.setAppInGrid(appname, cell)
	local app = hs.appfinder.appFromName(appname);
	if (app ~= nil) then
	    hs.fnutils.each(app:allWindows(), function(win) 
	    	hs.grid.set(win, cell)
	    end)
	end
end

function This.alignAllToGrid(dimensions)
	hs.grid.setGrid(dimensions)
	hs.fnutils.each(hs.window.visibleWindows(), function(win) 
	    hs.grid.snap(win)
	end)
end

function This.maximizeWindow()
  window = hs.window.focusedWindow()
   if window then
      window:maximize()
   end
end

function This.setHalfFrameLeft() 
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local max = win:screen():frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end

function This.setHalfFrameRight() 
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local max = win:screen():frame()

  f.x = max.w / 2
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end

function This.resizeCentered(width, height)
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local frame = screen:frame()

  f.x = frame.x + frame.w/2 - width/2
  f.y = frame.y + frame.h/2 - height/2
  f.w = width
  f.h = height
  win:setFrame(f)
end

function This.setGridFn(cell) 
  return function()
    hs.grid.set(hs.window.focusedWindow(), cell)
  end
end

This.gridSmall = {
  dimensions = "2x2",
  
  leftCell = { 0, 0, 1, 2},
  midCell = { 0, 0, 2, 2},
  rightCell = { 1, 0, 1, 2},

  topLeftCell = { 0, 0, 1, 1},
  bottomLeftCell = { 0, 1, 1, 1},

  topMidCell = { 0, 0, 2, 1},
  bottomMidCell = { 0, 1, 2, 1},

  topRightCell = { 1, 0, 1, 1},
  bottomRightCell = { 1, 1, 1, 1},

  oversizeLeftCell = "none",
  oversizeMidCell = "none",
  oversizeRightCell = "none",
}

This.gridBig = {
  dimensions = "7x2",

  leftCell = { 0, 0, 2, 3},
  midCell = { 2, 0, 3, 3},
  rightCell = { 5, 0, 2, 3},

  topLeftCell = { 0, 0, 2, 1},
  bottomLeftCell = { 0, 2, 2, 1},

  topMidCell = { 2, 0, 3, 1},
  bottomMidCell = { 2, 2, 3, 1},

  topRightCell = { 5, 0, 2, 1},
  bottomRightCell = { 5, 2, 2, 1},

  oversizeLeftCell = { 0, 0, 5, 3},
  oversizeMidCell = { 1, 0, 5, 3},
  oversizeRightCell = { 2, 0, 5, 3},
}

This.gridLeft = { 0, 0, 2, 3}
This.gridMid = { 2, 0, 3, 3}
This.gridRight = { 5, 0, 2, 3}

This.gridTopLeft = { 0, 0, 2, 1}
This.gridBottomLeft = { 0, 2, 2, 1}

This.gridTopMid = { 2, 0, 3, 1}
This.gridBottomMid = { 2, 2, 3, 1}

This.gridTopRight = { 5, 0, 2, 1}
This.gridBottomRight = { 5, 2, 2, 1}

This.gridOversizeLeft = { 0, 0, 5, 3}
This.gridOversizeMid = { 1, 0, 5, 3}
This.gridOversizeRight = { 2, 0, 5, 3}

return This
