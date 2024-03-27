local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")
local menubar = require("menubar")

require("awful.hotkeys_popup.keys")

beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")

require('main.error-handling')
require('main.screens')

RC = {}
RC.vars = require("main.user-variables")
RC.mainmenu = awful.menu(require("main.menu"))

menubar.utils.terminal = RC.vars.terminal

require("deco.statusbar")

local bindtotags = require("binding.bindtotags")
local globalbuttons = require("binding.globalbuttons")
local globalkeys = require("binding.globalkeys")
globalkeys = bindtotags(globalkeys)
root.buttons(globalbuttons)
root.keys(globalkeys)

awful.rules.rules = require("main.rules")

require("main.signals")
