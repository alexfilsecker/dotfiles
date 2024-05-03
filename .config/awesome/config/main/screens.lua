local awful = require("awful")

local set_statusbar = require("config.deco.statusbar")
local set_wallpaper = require("config.deco.wallpaper")

awful.screen.connect_for_each_screen(function(s)
  set_statusbar(s)
  set_wallpaper(s)
end)
