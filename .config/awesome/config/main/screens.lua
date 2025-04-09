local awful = require("awful")
local beautiful = require("beautiful")
local timer = require("gears.timer")

local minimized_counter_widget =
  require("config.deco.widgets.minimized_counter")
local set_statusbar = require("config.deco.statusbar")
local set_wallpaper = require("config.deco.wallpaper")

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
  set_statusbar(s)
  set_wallpaper(s)
  minimized_counter_widget.update_from_screen(s)
end)

timer({
  timeout = beautiful.wallpaper_change_timeout,
  autostart = true,
  callback = function()
    awful.screen.connect_for_each_screen(function(s)
      set_wallpaper(s)
    end)
  end,
})
