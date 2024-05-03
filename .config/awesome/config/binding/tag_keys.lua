-- The idea of this file is to create

local awful = require("awful")
local gears = require("gears")

local modkey = require("config.main.user_variables").modkey
local tag_pairs = require("config.deco.tags")

local tag_bindings = gears.table.join()
for i = 1, #tag_pairs.names do
  local tag_name = '"' .. tag_pairs.names[i] .. '"'

  tag_bindings = gears.table.join(
    tag_bindings,
    -- View tag only.
    awful.key({ modkey }, "#" .. i + 9, function()
      local screen = awful.screen.focused()
      local tag = screen.tags[i]
      if tag then
        tag:view_only()
      end
    end, {
      description = "View tag #" .. i .. " " .. tag_name,
      group = "tag",
    }),

    -- Toggle tag display.
    awful.key({ modkey, "Control" }, "#" .. i + 9, function()
      local screen = awful.screen.focused()
      local tag = screen.tags[i]
      if tag then
        awful.tag.viewtoggle(tag)
      end
    end, {
      description = "Toggle display on tag #" .. i .. " " .. tag_name,
      group = "tag",
    }),

    -- Move client to tag and focus that tag
    awful.key({ modkey, "Shift" }, "#" .. i + 9, function()
      if client.focus then
        local tag = client.focus.screen.tags[i]
        if tag then
          client.focus:move_to_tag(tag)
          tag:view_only()
        end
      end
    end, {
      description = "Move client to tag #"
        .. i
        .. " "
        .. tag_name
        .. " and focus it",
      group = "tag",
    }),

    -- Toggle focused client on tag.
    awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9, function()
      if client.focus then
        local tag = client.focus.screen.tags[i]
        if tag then
          client.focus:toggle_tag(tag)
        end
      end
    end, {
      description = "Toggle focused client on tag #" .. i .. " " .. tag_name,
      group = "tag",
    })
  )
end

return tag_bindings
