local awful = require("awful")
local gears = require("gears")

local mainmenu = require("main.menu")

return gears.table.join(awful.button({}, 3, function()
  mainmenu:toggle()
end))
