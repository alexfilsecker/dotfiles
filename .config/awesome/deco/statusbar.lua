local awful = require("awful")
local wibox = require("wibox")

local battery_widget = require("deco.widgets.battery")
local brightness_widget = require("deco.widgets.brightness")
local create_layoutbox_widget = require("deco.widgets.layoutbox")
local create_taglist_widget = require("deco.widgets.taglist")
local create_tasklist_widget = require("deco.widgets.tasklist")
local promptbox_widget = require("deco.widgets.promptbox")
local text_clock_widget = require("deco.widgets.text_clock")
local volume_widget = require("deco.widgets.volume")

local set_statusbar = function(s)
  -- create widgets
  local taglist_widget = create_taglist_widget(s)
  local tasklist_widget = create_tasklist_widget(s)
  local layoutbox_widget = create_layoutbox_widget(s)

  -- Save important widgets in the screen object
  s.promptbox_widget = promptbox_widget

  -- Create the wibox
  local mywibox = awful.wibar({
    -- See options in https://awesomewm.org/apidoc/popups_and_bars/awful.wibar.html#awful.wibar
    screen = s,
    position = "top",
    height = 40,
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
    tasklist_widget, -- Middle widget
    { -- Right widgets
      layout = wibox.layout.fixed.horizontal,
      spacing = 10,
      volume_widget,
      brightness_widget,
      battery_widget,
      text_clock_widget,
      layoutbox_widget,
    },
  })
end

return set_statusbar
