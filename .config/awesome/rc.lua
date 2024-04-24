-- WELCOME TO ALEX AWESOME CONFIG

-- Standard awesome library
local awful = require("awful")
local gears = require("gears")

-- This enables auto focusing when changing screens
require("awful.autofocus")

-- For showing hotkeys of other things, like tmux
require("awful.hotkeys_popup.keys")

-- standard theme library
local beautiful = require("beautiful")
beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")

-- No clue what menubar is
-- No clue what this does
local menubar = require("menubar")
menubar.utils.terminal = require("main.user_variables").terminal

-- Catch errors
require("main.error_handling")

-- Set status bar
require("deco.statusbar")

local bindtotags = require("binding.tag_bindings")
local globalbuttons = require("binding.global_buttons")
local globalkeys = require("binding.global_keys")
globalkeys = bindtotags(globalkeys)
root.buttons(globalbuttons)
root.keys(globalkeys)

awful.rules.rules = require("main.rules")

require("main.signals")
