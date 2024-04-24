local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup").widget
local beautiful = require("beautiful") -- for awesome.icon

local user_variables = require("main.user_variables")
local terminal = user_variables.terminal
local editor_cmd = user_variables.editor_cmd

local my_awesome_menu = {
	{
		"hotkeys",
		function()
			hotkeys_popup.show_help(nil, awful.screen.focused())
		end,
	},
	{ "manual", terminal .. " -e man awesome" },
	{ "edit config", editor_cmd .. " " .. awesome.conffile },
	{ "restart", awesome.restart },
	{
		"quit",
		function()
			awesome.quit()
		end,
	},
}

return awful.menu({
	{ "awesome", my_awesome_menu, beautiful.awesome_subicon },
	{ "open terminal", terminal },
})
