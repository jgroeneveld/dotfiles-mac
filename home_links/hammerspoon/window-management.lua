-- WindowManagement by Jaap

local This = {}

function This.gridLayout(config)
  local windowInFocusBefore = hs.window.focusedWindow();

  hs.grid.setGrid(config.grid)
  This.alignAllToGrid()

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

function This.alignAllToGrid()
	hs.grid.setGrid('7x2')
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
