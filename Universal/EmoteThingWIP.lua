local s = setmetatable({}, {
    __index = function(self, key)
        return game:GetService(key);
    end;
});

-- Localization.
local Client = s.Players.LocalPlayer;

local HttpService = s.HttpService;
local MarketplaceService = s.MarketplaceService;

-- main stuff.
shared._emoteEnums = { }; do
    for i, v in next, HttpService:JSONDecode(game:HttpGet("https://catalog.roblox.com/v1/search/items?category=Featured&limit=100&subcategory=EmoteAnimations")).data do
        if type(v) ~= "table" then continue end;
        local Info = MarketplaceService:GetProductInfo(v.id);
        
        shared._emoteEnums[#shared._emoteEnums + 1] = {
          _id = tonumber(v.id),
          _name = Info.Name
        };
    end;
end;

shared._categories = { -- create categories for gui.
    ["General"] = nil,
    ["Zara Larsson"] = nil,
    ["Lil Nas X"] = nil,
    ["KSI"] = nil,
    ["Twenty One"] = nil,
    ["Royal Blood"] = nil
};
