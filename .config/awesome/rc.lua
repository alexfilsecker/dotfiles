-- WELCOME TO ALEX AWESOME CONFIG

-- Standard awesome library
local awful = require("awful")
local gears = require("gears")

-- This enables auto focusing when changing screens
require("awful.autofocus")

-- Catch errors
require("main.error_handling")

-- standard theme library
local beautiful = require("beautiful")
local theme = require("theme.theme")
beautiful.init(theme)

-- Set up all global bindings
local global_buttons = require("binding.global_buttons")
local global_keys = require("binding.global_keys")
local tag_keys = require("binding.tag_keys")
root.buttons(global_buttons)
root.keys(gears.table.join(global_keys, tag_keys))

-- rules
local rules = require("main.rules")
awful.rules.rules = rules

-- screens
require("main.screens")

-- client
require("main.client")

-- Start picom compositor
awful.spawn.with_shell("picom -b")
