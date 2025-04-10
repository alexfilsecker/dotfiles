local awful = require("awful")
local nprint = require("utils.nprint")

local layouts = {
  awful.layout.suit.tile,
  awful.layout.suit.fair,
}

-- Set posible layouts
awful.layout.layouts = layouts

local tags = {
  -- Main Screen
  {
    { "💻 Code", layouts[1] },
    { "💻 Code 2", layouts[1] },
    { "🎵 Spotify", layouts[1] },
    { "📆 Planning", layouts[1] },
    { "Others", layouts[1] },
    { "6", layouts[1] },
  },
  -- Secondary screen
  {
    { "semen", layouts[1] },
    { "caca", layouts[1] },
  },
}

local screen_tags = {}
for screen_index = 1, 2 do
  local tag_pairs = {}
  tag_pairs.names = {}
  tag_pairs.layouts = {}
  for i, item in ipairs(tags[screen_index]) do
    tag_pairs.names[i] = item[1]
    tag_pairs.layouts[i] = item[2]
  end

  screen_tags[screen_index] = tag_pairs
end

return screen_tags
