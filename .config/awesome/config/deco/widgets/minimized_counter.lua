local awful = require("awful")
local wibox = require("wibox")

local make_fa_icon = require("config.theme.make_fa_icon")
local minimize_icon = make_fa_icon("\u{f78c}")

local minimized_counter_widget = {}

awful.screen.connect_for_each_screen(function(s)
  s:connect_signal("tag::history::update", function()
    local counter = 0
    local tags_on_screen = s.tags
    for tag_index = 1, #tags_on_screen do
      local this_tag = tags_on_screen[tag_index]
      if this_tag.selected == true then
        local clients_on_tag = this_tag:clients()
        for client_index = 1, #clients_on_tag do
          local this_client = clients_on_tag[client_index]
          if this_client.minimized then
            counter = counter + 1
          end
        end
      end
    end

    minimized_counter_widget:set(counter)
  end)
end)

local function worker()
  local current_count = 0

  minimized_counter_widget.widget = wibox.widget({
    spacing = 2,
    layout = wibox.layout.fixed.horizontal,
    set_count = function(self, count)
      local text_number = tostring(count)
      self:get_children_by_id("txt")[1]:set_text(text_number)
    end,

    {
      id = "txt",
      widget = wibox.widget.textbox,
    },
    minimize_icon,
  })

  local update_widget = function(count)
    minimized_counter_widget.widget:set_count(count)
    minimized_counter_widget.widget.visible = count ~= 0
  end

  function minimized_counter_widget:dec()
    current_count = current_count - 1
    update_widget(current_count)
  end

  function minimized_counter_widget:inc()
    current_count = current_count + 1
    update_widget(current_count)
  end

  function minimized_counter_widget:set(count)
    update_widget(count)
  end

  update_widget(current_count)

  return minimized_counter_widget.widget
end

return setmetatable(minimized_counter_widget, {
  __call = function()
    return worker()
  end,
})
