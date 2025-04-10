local naughty = require("naughty")

local function nprint(string)
  naughty.notify({ text = string })
end

return nprint
