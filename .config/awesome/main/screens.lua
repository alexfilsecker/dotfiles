local awful = require("awful")

local layouts = {
  floating = awful.layout.suit.floating,
  tile = awful.layout.suit.tile,
  left = awful.layout.suit.tile.left,
  bottom = awful.layout.suit.tile.bottom,
  top = awful.layout.suit.tile.top,
  fair = awful.layout.suit.fair,
  horizontal = awful.layout.suit.fair.horizontal,
  spiral = awful.layout.suit.spiral,
  dwindle = awful.layout.suit.spiral.dwindle,
  max = awful.layout.suit.max,
  fullscreen = awful.layout.suit.max.fullscreen,
  magnifier = awful.layout.suit.magnifier,
  nw = awful.layout.suit.corner.nw,
}

local tag_layouts = {
  { '1️⃣ NeoVim', layouts['tile'] },
  { '2️⃣ Slack', layouts['max'] },
  { '3️⃣ VSCode', layouts['max'] },
  { '4 Alacritty', layouts['max'] }
}

local tag_pairs = {}
tag_pairs.names = {}
tag_pairs.layouts = {}
for i, item in ipairs(tag_layouts) do
  tag_pairs.names[i] = item[1]
  tag_pairs.layouts[i] = item[2]
end

awful.screen.connect_for_each_screen(function(s)
  awful.tag(tag_pairs.names, s, tag_pairs.layouts)
end)
