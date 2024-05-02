local volume_widget = require("awesome-wm-widgets.volume-widget.volume")

return volume_widget({
  -- options go here
  device = "sysdefault:1",
  -- Default toggle command is broken
  toggle_cmd = "pactl set-sink-mute 0 toggle",
  widget_type = "arc",
})
