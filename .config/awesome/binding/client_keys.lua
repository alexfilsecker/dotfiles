local gears = require("gears")
local awful = require("awful")

local modkey = require("main.user_variables").modkey

return gears.table.join(
	-- < Super + f > toogles client fullscreen
	awful.key({ modkey }, "f", function(c)
		c.fullscreen = not c.fullscreen
		c:raise()
	end, { description = "Toggle client fullscreen", group = "client" }),

	-- < Super + Shift + c > closes the client
	awful.key({ modkey, "Shift" }, "c", function(c)
		c:kill()
	end, { description = "close", group = "client" }),

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

	awful.key({ modkey }, "t", function(c)
		c.ontop = not c.ontop
	end, { description = "toggle keep on top", group = "client" }),

	awful.key({ modkey }, "n", function(c)
		-- The client currently has the input focus, so it cannot be
		-- minimized, since minimized clients can't have the focus.
		c.minimized = true
	end, { description = "minimize", group = "client" }),

	awful.key({ modkey }, "m", function(c)
		c.maximized = not c.maximized
		c:raise()
	end, { description = "(un)maximize", group = "client" }),

	awful.key({ modkey, "Control" }, "m", function(c)
		c.maximized_vertical = not c.maximized_vertical
		c:raise()
	end, { description = "(un)maximize vertically", group = "client" }),

	awful.key({ modkey, "Shift" }, "m", function(c)
		c.maximized_horizontal = not c.maximized_horizontal
		c:raise()
	end, { description = "(un)maximize horizontally", group = "client" })
)
