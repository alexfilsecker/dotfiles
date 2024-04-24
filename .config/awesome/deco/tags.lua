local awful = require("awful")

local layouts = {
  awful.layout.suit.tile,
  awful.layout.suit.fair,
}

-- Set posible layouts
awful.layout.layouts = layouts

local tag_layouts = {
  { "Coding", layouts[1] },
  { "Planning", layouts[1] },
  { "Spotify", layouts[1] },
  { "Others", layouts[1] },
  { "5", layouts[1] },
}

local tag_pairs = {}
tag_pairs.names = {}
tag_pairs.layouts = {}
for i, item in ipairs(tag_layouts) do
  tag_pairs.names[i] = item[1]
  tag_pairs.layouts[i] = item[2]
end

return tag_pairs
