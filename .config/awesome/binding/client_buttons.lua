-- Here are all actions that happen when clicking clients

local awful = require("awful")
local gears = require("gears")

local modkey = require("main.user_variables").modkey

return gears.table.join(
  -- Activate client when clicking it
  awful.button({}, 1, function(c)
    c:emit_signal("request::activate", "mouse_click", { raise = true })
  end),

  -- Activate client and move it when clicking with modkey
  awful.button({ modkey }, 1, function(c)
    c:emit_signal("request::activate", "mouse_click", { raise = true })
    awful.mouse.client.move(c)
  end),

  -- Activate and start resizing when right clicking with modkey
  awful.button({ modkey }, 3, function(c)
    c:emit_signal("request::activate", "mouse_click", { raise = true })
    awful.mouse.client.resize(c)
  end)
)
