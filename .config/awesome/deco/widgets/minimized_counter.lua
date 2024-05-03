local gfs = require("gears.filesystem")
local wibox = require("wibox")

local minimized_counter_widget = {}
local path_to_icon = gfs.get_configuration_dir()
  .. "theme/icons/arrow-minimize.svg"

return setmetatable(minimized_counter_widget, {
  __call = function(_, ...)
    return worker(...)
  end,
})
