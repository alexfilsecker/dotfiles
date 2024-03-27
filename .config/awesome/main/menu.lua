local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup").widget
local beautiful = require("beautiful") -- for awesome.icon

local terminal = RC.vars.terminal
local editor_cmd = RC.vars.editor_cmd

local my_awesome_menu = {
  { "hotkeys",     function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
  { "manual",      terminal .. " -e man awesome" },
  { "edit config", editor_cmd .. " " .. awesome.conffile },
  { "restart",     awesome.restart },
  { "quit",        function() awesome.quit() end },
}

return {
  { "awesome", my_awesome_menu, beautiful.awesome_subicon },
  { "open terminal", terminal }
}
