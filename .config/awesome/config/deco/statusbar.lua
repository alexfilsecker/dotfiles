local awful = require("awful")
local beautiful = require("beautiful")
local wibox = require("wibox")

local battery_widget = require("config.deco.widgets.battery")
local brightness_widget = require("config.deco.widgets.brightness")
local create_layoutbox_widget = require("config.deco.widgets.layoutbox")
local create_taglist_widget = require("config.deco.widgets.taglist")
-- local create_tasklist_widget = require("config.deco.widgets.tasklist")
local minimized_counter_widget =
  require("config.deco.widgets.minimized_counter")
local promptbox_widget = require("config.deco.widgets.promptbox")
local text_clock_widget = require("config.deco.widgets.text_clock")
local volume_widget = require("config.deco.widgets.volume")

local set_statusbar = function(s)
  -- create widgets
  local taglist_widget = create_taglist_widget(s)
  -- local tasklist_widget = create_tasklist_widget(s)
  local layoutbox_widget = create_layoutbox_widget(s)

  -- Save important widgets in the screen object
  s.promptbox_widget = promptbox_widget

  -- Create the wibox
  local mywibox = awful.wibar({
    -- See options in https://awesomewm.org/apidoc/popups_and_bars/awful.wibar.html#awful.wibar
    screen = s,
    position = "top",
    height = 20,
    opacity = 1,
    bg = "#00000099",
  })

  -- Add widgets to the wibox
  mywibox:setup({
    layout = wibox.layout.align.horizontal,
    { -- Left widgets
      layout = wibox.layout.fixed.horizontal,
      taglist_widget,
      promptbox_widget,
    },
    -- tasklist_widget, -- Middle widget
    {
      widget = wibox.widget.separator,
      thickness = 0,
    },
    { -- Right widgets
      layout = wibox.layout.fixed.horizontal,
      spacing = 10,
      minimized_counter_widget(),
      volume_widget,
      brightness_widget,
      battery_widget,
      text_clock_widget,
      layoutbox_widget,
    },
  })
end

return set_statusbar
