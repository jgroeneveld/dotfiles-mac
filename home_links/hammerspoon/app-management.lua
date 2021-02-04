-- AppManagement originally by jqno, modified by Jaap

local This = {}

-- Quickly move to and from a specific app
-- (Thanks Teije)
local previousApp = ""

function This.showBundleId()
  local focusedWindow = hs.window.focusedWindow()

  if focusedWindow == nil then
    hs.alert.show("No window")
  else 
    hs.alert.show(focusedWindow:application():bundleID())
  end
end

-- function This.switchToAndFromApp(bundleID)
--   local focusedWindow = hs.window.focusedWindow()

--   if focusedWindow == nil then
--     hs.application.launchOrFocusByBundleID(bundleID)
--   elseif focusedWindow:application():bundleID() == bundleID then
--     if previousApp == nil then
--       hs.window.switcher.nextWindow()
--     else
--       previousApp:activate()
--     end
--   else
--     previousApp = focusedWindow:application()
--     hs.application.launchOrFocusByBundleID(bundleID)
--   end
-- end

function This.switchToAndFromApp(name)
  local focusedWindow = hs.window.focusedWindow()

  if focusedWindow == nil then
    hs.application.launchOrFocus(name)
  elseif focusedWindow:application():name() == name then
    if previousApp == nil then
      hs.window.switcher.nextWindow()
    else
      previousApp:activate()
    end
  else
    previousApp = focusedWindow:application()
    hs.application.launchOrFocus(name)
  end
end

function This.bindSwitchToAndFromApps(modifiers, apps)
  for i, app in ipairs(apps) do
    hs.hotkey.bind(modifiers, app[1], function() This.switchToAndFromApp(app[2]) end)
  end
end

function This.switchToApp(name)  
    hs.application.launchOrFocus(name)
end

function This.bindSwitchToApps(modifiers, apps)
  for i, app in ipairs(apps) do
    hs.hotkey.bind(modifiers, app[1], function() This.switchToApp(app[2]) end)
  end
end

function This.killApps(apps)
  for i, appname in ipairs(apps) do
    local app = hs.application.find(appname)
    if(app ~= nil) then
      app:kill()
    end
  end
end

return This
