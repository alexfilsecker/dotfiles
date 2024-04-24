local awful = require("awful")
local gears = require("gears")

local modkey = require("main.user_variables").modkey

return gears.table.join(
  -- < Super + f > toogles client fullscreen
  awful.key({ modkey }, "f", function(c)
    c.fullscreen = not c.fullscreen
    c:raise()
  end, { description = "Toggle client fullscreen", group = "client" }),

  -- < Super + q > closes the client
  awful.key({ modkey }, "q", function(c)
    c:kill()
  end, { description = "Close current client", group = "client" }),

  -- < Super + Ctrl + Space > toogles floating window
  awful.key(
    { modkey, "Control" },
    "space",
    awful.client.floating.toggle,
    { description = "Toggle floating window on client", group = "client" }
  ),

  -- < Super + Ctrl + Retrun > moves current client to master
  -- Master is the predominant place in a layout
  awful.key({ modkey, "Control" }, "Return", function(c)
    c:swap(awful.client.getmaster())
  end, { description = "Move current client to master", group = "client" }),

  -- < Super + o > Moves client to screen
  -- I do not know what this does
  awful.key({ modkey }, "o", function(c)
    c:move_to_screen()
  end, { description = "Move to screen", group = "client" }),

  -- < Super + t > Toogles client keep on top property
  awful.key({ modkey }, "t", function(c)
    c.ontop = not c.ontop
  end, { description = "Toggles client keep on top", group = "client" }),

  -- < Super + n > Minimizes the client client.
  -- Notice that you cannot regain focus on a minimized client
  -- unless you click it on the status bar
  awful.key({ modkey }, "n", function(c)
    c.minimized = true
  end, { description = "Minimize client", group = "client" }),

  -- < Super + m > Toggle client maximization
  awful.key({ modkey }, "m", function(c)
    c.maximized = not c.maximized
    c:raise()
  end, { description = "Toggle client maximization", group = "client" }),

  -- < Super + Ctrl + m > Toggle client vertical maximization
  awful.key(
    { modkey, "Control" },
    "m",
    function(c)
      c.maximized_vertical = not c.maximized_vertical
      c:raise()
    end,
    { description = "Toggle client vertical maximization", group = "client" }
  ),

  -- < Super + Shift + m > Toggle client horizontal maximization
  awful.key(
    { modkey, "Shift" },
    "m",
    function(c)
      c.maximized_horizontal = not c.maximized_horizontal
      c:raise()
    end,
    { description = "Toggle client horizontal maximization", group = "client" }
  )
)
