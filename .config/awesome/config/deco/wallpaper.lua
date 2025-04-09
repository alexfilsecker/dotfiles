local beautiful = require("beautiful")
local gears = require("gears")

local function list_files(directory)
  local files = {}
  local handle = io.popen("ls " .. directory)
  if handle then
    for line in handle:lines() do
      table.insert(files, line)
    end
    handle:close()
    return files
  else
    return nil -- Or handle the error as needed
  end
end

local function get_random_file(file_list, s)
  if not file_list or #file_list == 0 then
    return nil -- Return nil if the list is empty or nil
  end

  math.randomseed(os.clock() * s.index)

  local random_index = math.random(#file_list) -- Generate a random index
  return file_list[random_index] -- Return the item at the random index
end

local function get_random_wallpaper(s)
  if not beautiful.wallpapers_path then
    return nil
  end

  local wallpapers_path = beautiful.wallpapers_path
  local wallpapers = list_files(wallpapers_path)
  if not wallpapers then
    return nil
  end

  local random_wallpaper = get_random_file(wallpapers, s)
  if not random_wallpaper then
    return nil
  end

  return wallpapers_path .. "/" .. random_wallpaper
end

local function set_wallpaper(s)
  local wallpaper = beautiful.default_wallpaper
  local random_wallpaper = get_random_wallpaper(s)
  if random_wallpaper then
    wallpaper = random_wallpaper
  end

  gears.wallpaper.maximized(wallpaper, s, true)
end

return set_wallpaper
