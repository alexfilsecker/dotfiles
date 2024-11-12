local awful = require("awful")

local minimized_counter_widget =
  require("config.deco.widgets.minimized_counter")
local set_statusbar = require("config.deco.statusbar")
local set_wallpaper = require("config.deco.wallpaper")

awful.screen.connect_for_each_screen(function(s)
  set_statusbar(s)
  set_wallpaper(s)
  minimized_counter_widget.update_from_screen(s)
end)
