local volume_widget = require("awesome-wm-widgets.volume-widget.volume")

return volume_widget({
  -- https://github.com/streetturtle/awesome-wm-widgets/tree/master/brightness-widget#customization
  -- options go here
  device = "sysdefault:1",
  -- Default toggle command is broken
  toggle_cmd = "pactl set-sink-mute 0 toggle",
  widget_type = "arc",
  -- arc customization
  thickness = 3,
  size = 25,
  mute_color = "#ff0000",
})
