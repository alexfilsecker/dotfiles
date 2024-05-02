local battery_widget =
  require("awesome-wm-widgets.batteryarc-widget.batteryarc")

return battery_widget({
  font = "FiraCode Nerd Font 6",
  show_current_level = true,
  arc_thickness = 3,
  size = 30,
})
