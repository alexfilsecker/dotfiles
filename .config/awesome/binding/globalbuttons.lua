local gears = require("gears")
local awful = require("awful")

return gears.table.join(
  awful.button({ }, 3, function() RC.mainmenu:toggle() end)
)
