local theme = require("config.theme.theme")
local wibox = require("wibox")

-- FontAwesome
local function make_fa_icon(code)
  return wibox.widget({
    font = theme.icon_font .. theme.icon_size,
    markup = ' <span color="' .. theme.icon_color .. '">' .. code .. "</span> ",
    align = "center",
    valign = "center",
    widget = wibox.widget.textbox,
  })
end

return make_fa_icon
