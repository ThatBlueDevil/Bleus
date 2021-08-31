local UrlBase = "https://raw.githubusercontent.com/ThatBlueDevil/Bleus/main/";
local Games = {
    [1335695570] = { Name = "Ninja Legends", Link = UrlBase .. "Ninja%20Legends/Source.lua" };
    [1077961373] = { Name = "Giant Simulator", Link = UrlBase .. "GIANT_SIM/source.lua" };
};

assert(Games[game.GameId], "[BLEUS] This game isn't supported!");
loadstring(game:HttpGet(Games[game.GameId].Link))();
