local UrlBase = "https://raw.githubusercontent.com/ThatBlueDevil/Bleus/main/"
local Games = {
  [1] = { Name = "", Link = UrlBase .. "" }
}

if (Games[game.PlaceId]) then
  return loadstring(game:HttpGet(Games[game.PlaceId].Link)() -- coded this on my school device so this getting big rework when I'm home
end
