local brightness_widget =
  require("awesome-wm-widgets.brightness-widget.brightness")

return brightness_widget({
  -- Configuration goes here
  type = "icon_and_text",
  program = "brightnessctl",
})
