local awful = require("awful")
local gears = require("gears")

local buttons
gears.table.join(
  -- Change layout when click
  awful.button({}, 1, function()
    awful.layout.inc(1)
  end),

  -- Change layout when right clicking
  awful.button({}, 3, function()
    awful.layout.inc(-1)
  end)
)

return function(s)
  local layoutbox = awful.widget.layoutbox(s)
  layoutbox:buttons(buttons) -- asign widget to be clickable
  return layoutbox
end
