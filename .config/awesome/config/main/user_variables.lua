local terminal = "alacritty"
local modkey = "Mod4"
local editor = os.getenv("EDITOR") or "nvim"
local editor_cmd = terminal .. " -e " .. editor

return {
  terminal = terminal,
  modkey = modkey,
  editor = editor,
  editor_cmd = editor_cmd,
}
