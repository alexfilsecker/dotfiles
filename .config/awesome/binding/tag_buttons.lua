local awful = require("awful")
local gears = require("gears")

local user_variables = require("main.user_variables")
local modkey = user_variables.modkey

return gears.table.join(

  -- < LeftClick > Right click on tab to view it
  awful.button({}, 1, function(t)
    t:view_only()
  end),

  -- < Sueper + LeftClick > Move client to tag and focus that tag
  awful.button({ modkey }, 1, function(t)
    if client.focus then
      client.focus:move_to_tag(t)
      t:view_only()
    end
  end),

  -- < RightClick > Toggle tag display
  awful.button({}, 3, awful.tag.viewtoggle),

  -- < Super + RightClick > Toggle focused client on tag
  awful.button({ modkey }, 3, function(t)
    if client.focus then
      client.focus:toggle_tag(t)
    end
  end),

  -- I do not have 4th click. But I'll leave this for the future
  awful.button({}, 4, function(t)
    awful.tag.viewnext(t.screen)
  end),

  -- I do not have 4th click. But I'll leave this for the future
  awful.button({}, 5, function(t)
    awful.tag.viewprev(t.screen)
  end)
)
