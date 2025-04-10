local awful = require("awful")

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
    { "🌐 Google", layouts[1] },
  },
  -- Secondary screen
  {
    { "💻 Code 2", layouts[1] },
    { "🌐 Google", layouts[1] },
    { "🎵 Spotify", layouts[1] },
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
