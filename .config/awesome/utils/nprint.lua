local naughty = require("naughty")

local function nprint(string)
  naughty.notify({ text = tostring(string) })
end

return nprint
