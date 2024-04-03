local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")
local menubar = require("menubar")

-- For showing hotkeys of other things, like tmux
require("awful.hotkeys_popup.keys")

-- Start theme
beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")

require('main.error-handling')
require('main.screens')

menubar.utils.terminal = require("main.user-variables").terminal

require("deco.statusbar")

local bindtotags = require("binding.bindtotags")
local globalbuttons = require("binding.globalbuttons")
local globalkeys = require("binding.globalkeys")
globalkeys = bindtotags(globalkeys)
root.buttons(globalbuttons)
root.keys(globalkeys)

awful.rules.rules = require("main.rules")

require("main.signals")
