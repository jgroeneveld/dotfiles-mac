-- AppManagement originally by jqno

local This = {}

-- Quickly move to and from a specific app
-- (Thanks Teije)
local previousApp = ""

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


return This
