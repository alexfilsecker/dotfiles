local awful = require("awful")
local gears = require("gears")

local buttons = gears.table.join(
  -- < LeftClick > Toogles minimzation and activates the client
  awful.button({}, 1, function(c)
    if c == client.focus then
      c.minimized = true
    else
      c:emit_signal("request::activate", "tasklist", { raise = true })
    end
  end),

  -- < RightClick > Opens a menu with all clients
  awful.button({}, 3, function()
    awful.menu.client_list({ theme = { width = 250 } })
  end),

  -- I do not have 4th click. But I'll leave this for the future
  awful.button({}, 4, function()
    awful.client.focus.byidx(1)
  end),

  -- I do not have 4th click. But I'll leave this for the future
  awful.button({}, 5, function()
    awful.client.focus.byidx(-1)
  end)
)

return function(s)
  return awful.widget.tasklist({
    screen = s,
    filter = awful.widget.tasklist.filter.currenttags,
    buttons = buttons,
  })
end
