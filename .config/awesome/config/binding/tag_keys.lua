-- The idea of this file is to create

local awful = require("awful")
local gears = require("gears")

local modkey = require("config.main.user_variables").modkey
local nprint = require("utils.nprint")
local screen_tags = require("config.deco.tags")

local num_of_tags = 0
for screen_index = 1, #screen_tags do
  local tags = screen_tags[screen_index]
  num_of_tags = num_of_tags + #tags
end

local function get_screen_data_from_key(key)
  local acc = 0
  local index = 0
  while key > acc do
    index = index + 1
    acc = acc + #screen_tags[index]
  end

  local data = {}
  data.screen_index = index
  data.tag_index = key - acc + #screen_tags[index]

  return data
end

local tag_bindings = {}
for i = 1, num_of_tags do
  local data = get_screen_data_from_key(i)
  local s = screen[data.screen_index]
  local tag_name = screen_tags[data.screen_index][data.tag_index]
  tag_name = '"' .. tag_name .. '"'

  tag_bindings = gears.table.join(
    tag_bindings,

    -- View tag only.
    awful.key({ modkey }, "#" .. i + 9, function()
      local tag = s.tags[data.tag_index]
      if tag then
        tag:view_only()
        awful.screen.focus(s)
      end
    end, {
      description = "View "
        .. tag_name
        .. " on screen #"
        .. data.screen_index
        .. " and focus it",
      group = "tag",
    }),

    -- Toggle tag display.
    awful.key({ modkey, "Control" }, "#" .. i + 9, function()
      local tag = s.tags[data.tag_index]
      if tag then
        awful.tag.viewtoggle(tag)
        awful.screen.focus(s)
      end
    end, {
      description = "Toggle display on "
        .. tag_name
        .. " on screen #"
        .. data.screen_index
        .. " and focus it",
      group = "tag",
    }),

    -- Move client to tag and focus that tag
    awful.key({ modkey, "Shift" }, "#" .. i + 9, function()
      if client.focus then
        local tag = s.tags[data.tag_index]
        if tag then
          client.focus:move_to_tag(tag)
          tag:view_only()
          awful.screen.focus(s)
        end
      end
    end, {
      description = "Move focused client to "
        .. tag_name
        .. " in screen #"
        .. data.screen_index
        .. " and focus that screen and tag",
      group = "tag",
    })

    -- Toggle focused client on tag.
    -- TODO this does not work on fucking different screens
    -- I don't know why soy I am just going to comment the whole thing xd
    -- awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9, function()
    --   if client.focus then
    --     local tag = s.tags[data.tag_index]
    --     if tag then
    --       nprint(tag.name)
    --       nprint(tag.screen.index)
    --       client.focus:toggle_tag(tag)
    --     end
    --   end
    -- end, {
    --   description = "Toggle focused client on tag #" .. i,
    --   group = "tag",
    -- })
  )
end

return tag_bindings
