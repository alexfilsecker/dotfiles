local brightness_widget =
  require("awesome-wm-widgets.brightness-widget.brightness")

return brightness_widget({
  -- Configuration goes here
  -- https://github.com/streetturtle/awesome-wm-widgets/tree/master/brightness-widget#customization
  type = "icon_and_text",
  program = "brightnessctl",
  size = 25,
  font = "Play 8",
  tooltip = true,
})
