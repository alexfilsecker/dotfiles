local awful = require("awful")
local gears = require("gears")
local hotkeys_popup = require("awful.hotkeys_popup")
local menubar = require("menubar")
-- local naughty = require("naughty") -- In case I need to debug

local user_variables = require("config.main.user_variables")
local modkey = user_variables.modkey
local terminal = user_variables.terminal

local brightness_widget =
  require("awesome-wm-widgets.brightness-widget.brightness")
local minimized_counter_widget =
  require("config.deco.widgets.minimized_counter")
local volume_widget = require("awesome-wm-widgets.volume-widget.volume")

return gears.table.join(
  -- AWESOME GROUP
  -- < Super + s > Show help ui
  awful.key(
    { modkey },
    "s",
    hotkeys_popup.show_help,
    { description = "Show help", group = "awesome" }
  ),

  awful.key(
    { modkey, "Control", "Alt" },
    "s",
    awful.spawn("scrot -s holaaa"),
    { description = "Show help", group = "awesome" }
  ),

  -- < Super + r > Reload Awesome
  awful.key(
    { modkey, "Control" },
    "r",
    awesome.restart,
    { description = "Reload awesome", group = "awesome" }
  ),

  -- < Super + Shift + q > Quit Awesome
  awful.key(
    { modkey, "Shift" },
    "q",
    awesome.quit,
    { description = "Quit awesome", group = "awesome" }
  ),

  -- < Super + x > Execute lua prompt
  awful.key({ modkey }, "x", function()
    awful.prompt.run({
      prompt = "Run Lua code: ",
      textbox = awful.screen.focused().promptbox_widget.widget,
      exe_callback = awful.util.eval,
      history_path = awful.util.get_cache_dir() .. "/history_eval",
    })
  end, { description = "Execute lua prompt", group = "awesome" }),

  -- LAUNCHER GROUP
  -- < Super + Return > Open default terminal
  awful.key({ modkey }, "Return", function()
    awful.spawn(terminal)
  end, { description = "Open default terminal", group = "launcher" }),

  -- < Super + r > Run lua prompt
  awful.key({ modkey }, "r", function()
    awful.screen.focused().promptbox_widget:run()
  end, { description = "Run lua prompt", group = "launcher" }),

  -- < Super + p > Show applications
  awful.key({ modkey }, "p", function()
    menubar.show()
  end, { description = "Show applications", group = "launcher" }),

  -- < Super + g > Opens Google Chrome
  awful.key({ modkey }, "g", function()
    awful.spawn("google-chrome-stable")
  end, { desc = "Open Google Chrome", group = "launcher" }),

  -- < Super + v > Opens Visual Studio Code
  awful.key({ modkey }, "v", function()
    awful.spawn("code")
  end, { desc = "Open Visual Studio Code", group = "launcher" }),

  -- SCREENS
  -- < Super + Ctrl + j > Focus next screen
  awful.key({ modkey, "Control" }, "j", function()
    awful.screen.focus_relative(1)
  end, { description = "Focus next screen", group = "screen" }),

  -- < Super + Ctrl + k > Focus previous screen
  awful.key({ modkey, "Control" }, "k", function()
    awful.screen.focus_relative(-1)
  end, { description = "focus the previous screen", group = "screen" }),

  -- TAGS GROUP
  -- < Super + LeftArrow > View previous tag
  awful.key(
    { modkey },
    "Left",
    awful.tag.viewprev,
    { description = "View previous tag", group = "tag" }
  ),

  -- < Super + RightArrow > View next tag
  awful.key(
    { modkey },
    "Right",
    awful.tag.viewnext,
    { description = "View next tag", group = "tag" }
  ),

  -- < Super + Esc > Go back on tag history
  awful.key(
    { modkey },
    "Escape",
    awful.tag.history.restore,
    { description = "Go back on tag history", group = "tag" }
  ),

  -- CLIENT GROUP
  -- < Super + j > Focus next client in screen by index
  awful.key({ modkey }, "j", function()
    awful.client.focus.byidx(1)
  end, {
    description = "Focus next client in screen by index",
    group = "client",
  }),

  -- < Super + k > Focus previous client in screen by index
  awful.key({ modkey }, "k", function()
    awful.client.focus.byidx(-1)
  end, {
    description = "Focus previous client in screen by index",
    group = "client",
  }),

  -- < Super + Tab > Focus previous client by history
  awful.key({ modkey }, "Tab", function()
    awful.client.focus.history.previous()
    if client.focus then
      client.focus:raise()
    end
  end, {
    description = "Focus previous client by history",
    group = "client",
  }),

  -- < Super + Shift + j > Swaps index with next client
  awful.key({ modkey, "Shift" }, "j", function()
    awful.client.swap.byidx(1)
  end, { description = "Swaps index with next client", group = "client" }),

  -- < Super + Shift + k > Swaps index with next client
  awful.key({ modkey, "Shift" }, "k", function()
    awful.client.swap.byidx(-1)
  end, {
    description = "Swaps index with previous client",
    group = "client",
  }),

  -- < Super + u > Jump to urgent client
  awful.key(
    { modkey },
    "u",
    awful.client.urgent.jumpto,
    { description = "Jump to urgent client", group = "client" }
  ),

  -- < Super + Ctrl + n > Restore minimized clients
  awful.key({ modkey, "Control" }, "n", function()
    local c = awful.client.restore()
    -- Focus restored client
    if c then
      c:emit_signal("request::activate", "key.unminimize", { raise = true })
      minimized_counter_widget:dec()
    end
  end, { description = "Restore minimized clients", group = "client" }),

  -- LAYOUT GROUP
  -- < Super + Space > Select next layout
  awful.key({ modkey }, "space", function()
    awful.layout.inc(1)
  end, { description = "Select next layout", group = "layout" }),

  -- < Super + Space > Select previous layout
  awful.key({ modkey, "Shift" }, "space", function()
    awful.layout.inc(-1)
  end, { description = "select previous", group = "layout" }),

  -- < Super + l > Increase master client width
  awful.key({ modkey }, "l", function()
    awful.tag.incmwfact(0.05)
  end, { description = "Increase master client width", group = "layout" }),

  -- < Super + l > Decrease master client width
  awful.key({ modkey }, "h", function()
    awful.tag.incmwfact(-0.05)
  end, { description = "Decrease master client width", group = "layout" }),

  -- < Super + Shift + l > Increase number of master clients
  awful.key({ modkey, "Shift" }, "l", function()
    awful.tag.incnmaster(1, nil, true)
  end, { description = "Increase number of master clients", group = "layout" }),

  -- < Super + Shift + h > Decrease number of master clients
  awful.key({ modkey, "Shift" }, "h", function()
    awful.tag.incnmaster(-1, nil, true)
  end, { description = "Decrease number of master clients", group = "layout" }),

  -- < Super + Ctrl + l > Increase the number of columns
  awful.key({ modkey, "Control" }, "l", function()
    awful.tag.incncol(1, nil, true)
  end, { description = "Increase the number of columns", group = "layout" }),

  -- < Super + Ctrl + h > Decrease the number of columns
  awful.key({ modkey, "Control" }, "h", function()
    awful.tag.incncol(-1, nil, true)
  end, { description = "Decrease the number of columns", group = "layout" }),

  -- BRIGHTNESS GROUP
  -- < Fn + F5 > Increase brightness
  awful.key({}, "XF86MonBrightnessUp", function()
    brightness_widget:inc()
  end, { description = "Increase brightness", group = "brightness" }),

  -- -- < Fn + F4 > Decrease brightness
  awful.key({}, "XF86MonBrightnessDown", function()
    brightness_widget:dec()
  end, { description = "Decrease brightness", group = "brightness" }),

  -- VOLUME GROUP
  -- < Fn + F1 > Toggle mute
  awful.key({}, "XF86AudioMute", function()
    volume_widget:toggle()
  end, { description = "Toggle mute", group = "volume" }),

  -- < Fn + F2 > Decrease volume
  awful.key({}, "XF86AudioLowerVolume", function()
    volume_widget:dec(5)
  end, { description = "Decrease volume", group = "volume" }),
  
  -- < Fn + F3 > Increase volume
  awful.key({}, "XF86AudioRaiseVolume", function()
    volume_widget:inc(5)
  end, { description = "Increase volume", group = "volume" })
)
