local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()

--> Init <--

local Library = Material.Load({
    Title = "Ninja Legends  ―  Bleus",
    Style = 1,
    SizeX = 400,
    SizeY = 400,
    Theme = "Aqua",
    ColorOverrides = {
        MainFrame = Color3.fromRGB(35,35,35)
    }
})

local s = setmetatable({}, {
    __index = function(self, key)
        return game:GetService(key)
    end
})

local Player = s.Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:wait()

Player.CharacterAdded:Connect(function(char)
    Character = char
end)

--> Functions <--

local Functions = {}; do
    
    function Functions:Find(Directory, Name)
        local d, e = math.huge
        
        for i, v in next, Directory:GetDescendants() do
            if (v.Name:find(Name)) then
                local Magnitude = Player:DistanceFromCharacter(v.Position)
                
                if (Magnitude < d) then
                    d = Magnitude
                    e = v
                end
            end
        end
        
        return e
    end
    
    function Functions:Tween(obj, Properties, Time, ...)
        local Tweeb = s.TweenService:Create(obj, TweenInfo.new(Time), Properties)
        Tweeb:Play()
        
    	return Tweeb
    end
end

--> other stuff <--

Player.Idled:Connect(function()
   s.VirtualUser:Button2Down(Vector2.new(0,0), s.Workspace.CurrentCamera.CFrame)
   wait(1)
   s.VirtualUser:Button2Up(Vector2.new(0,0), s.Workspace.CurrentCamera.CFrame)
end)

local RankList = {"Rookie", "Grasshopper", "Apprentice", "Samurai", "Assassin", "Shadow", "Ninja", "Master Ninja", "Sensei", "Master Sensei", "Ninja Legend", "Master Of Shadows", "Immortal Assassin", "Eternity Hunter", "Shadow Legend", "Dragon Warrior", "Dragon Master", "Chaos Sensei", "Chaos Legend", "Master Of Elements", "Elemental Legend", "Ancient Battle Master", "Ancient Battle Legend", "Legendary Shadow Duelist", "Master Legend Assassin", "Mythic Shadowmaster", "Legendary Shadowmaster", "Awakened Scythemaster", "Awakened Scythe Legend", "Master Legend Zephyr", "Golden Sun Shuriken Master", "Golden Sun Shuriken Legend", "Dark Sun Samurai Legend", "Dragon Evolution Form I", "Dragon Evolution Form II", "Dragon Evolution Form III", "Dragon Evolution Form IV", "Dragon Evolution Form V", "Cybernetic Electro Master", "Cybernetic Electro Legend", "Shadow Chaos Assassin", "Shadow Chaos Legend", "Infinity Sensei", "Infinity Legend", "Aether Genesis Master Ninja", "Master Legend Sensei Hunter", "Skystorm Series Samurai Legend", "Master Elemental Hero", "Eclipse Series Soul Master", "Starstrike Master Sensei", "Evolved Series Master Ninja", "Dark Elements Guardian", "Elite Series Master Legend", "Infinity Shadows Master", "Lightning Storm Sensei", "Dark Elements Blademaster", "Rising Shadow Eternal Ninja", "Skyblade Ninja Master", "Shadow Storm Sensei"}

--> Pages <--

local Main = Library.New({
    Title = "Main"
})

local Modules = Library.New({
    Title = "AutoFarm"
})

local Misc = Library.New({
    Title = "Misc"
})

--> Actual Shit <--

local AutoSwing = Main.Toggle({
    Text = "AutoSwing",
    Callback = function(v)
        shared.AutoSwing = v
    end,
    
    Enabled = false
})

local AutoSell = Main.Toggle({
    Text = "AutoSell",
    Callback = function(v)
        shared.AutoSell = v
    end,
    
    Enabled = false
})

local AutoBuySwords = Main.Toggle({
    Text = "AutoBuySwords",
    Callback = function(v)
        shared.AutoBuySwords = v
    end,
    
    Enabled = false
})

local AutoBuyBelts = Main.Toggle({
    Text = "AutoBuyBelts",
    Callback = function(v)
        shared.AutoBuyBelts = v
    end,
    
    Enabled = false
})

local AutoRankUp = Main.Toggle({
    Text = "AutoRankUp",
    Callback = function(v)
        shared.AutoRankUp = v
    end,
    
    Enabled = false
})


--> Modules <--

local AutoFarmCoins = Modules.Toggle({
    Text = "AutoFarm Coins",
    Callback = function(v)
        shared.AutoFarmCoins = v
    end,
    
    Enabled = false
})

local AutoFarmChi = Modules.Toggle({
    Text = "AutoFarm Chi",
    Callback = function(v)
        shared.AutoFarmChi = v
    end,
    
    Enabled = false
})

local AutoFarmHoops = Modules.Toggle({
    Text = "AutoFarm Hoops",
    Callback = function(v)
        shared.AutoFarmHoops = v
    end,
    
    Enabled = false
})

--> Misc <--

local UnlockAll = Misc.Button({
    Text = "Unlock All Island's",
    Callback = function(v)
        if not Character then return end

        local Parts = s.Workspace.islandUnlockParts
        
        for i, p in next, Parts:GetDescendants() do
            if firetouchinterest and p:IsA("TouchTransmitter") then
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, p.Parent, 0)
                wait()
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, p.Parent, 1)
            end
        end
    end
})

local HidePopUps = Misc.Button({
    Text = "Hide PopUps",
    Callback = function(v)
        if not Character then return end
        
        Player.PlayerGui.statEffectsGui:Destroy()
    end
})

--> Main Loop <--

coroutine.wrap(function()
    while wait() do
        if not Character then return end
        
        if (shared.AutoSwing) then
            for i, v in next, Player.Backpack:GetDescendants() do
                if v:FindFirstChild("ninjitsuGain") and not Character:FindFirstChild("ninjitsuGain") then
                    Character.Humanoid:EquipTool(v)
                end
            end
            
            Player.ninjaEvent:FireServer("swingKatana")
        end
            
        if (shared.AutoSell) then
            local SellArea = s.Workspace.sellAreaCircles["sellAreaCircle16"]
            
            for i, v in next, SellArea:GetDescendants() do
                if firetouchinterest and v:IsA("TouchTransmitter") then
                    firetouchinterest(Character.HumanoidRootPart, v.Parent, 0)
                    wait()
                    firetouchinterest(Character.HumanoidRootPart, v.Parent, 1)
                end
            end
        end
            
        if (shared.AutoBuyBelts) then
            Player.ninjaEvent:FireServer("buyAllBelts", "Inner Peace Island")
        end
            
        if (shared.AutoBuySwords) then
            Player.ninjaEvent:FireServer("buyAllSwords", "Inner Peace Island")
        end
        
        if (shared.AutoFarmHoops) then
            for i, h in next, s.Workspace.Hoops:GetDescendants() do
                if firetouchinterest and h:IsA("TouchTransmitter") then
                    firetouchinterest(Character.HumanoidRootPart, h.Parent, 0)
                    wait()
                    firetouchinterest(Character.HumanoidRootPart, h.Parent, 1)
                end
            end
        end
        
        if (shared.AutoFarmCoins) then
            local Coins = Functions:Find(s.Workspace.spawnedCoins.Valley, "Coin")
            local ds = (Character.HumanoidRootPart.Position - Coins.Position).Magnitude / 1500
                
            if Coins:IsA("Part") then
                Character.Humanoid:ChangeState(11)
                    
                Functions:Tween(Character.HumanoidRootPart, {CFrame = CFrame.new(Coins.Position)}, ds, Enum.EasingStyle.Sine)
            end
        end
            
        if (shared.AutoFarmChi) then
            local Chi = Functions:Find(s.Workspace.spawnedCoins.Valley, "Chi")
            local ds = (Character.HumanoidRootPart.Position - Chi.Position).Magnitude / 1500
                
            if Chi:IsA("Part") then
                Character.Humanoid:ChangeState(11)
                    
                Functions:Tween(Character.HumanoidRootPart, {CFrame = CFrame.new(Chi.Position)}, ds, Enum.EasingStyle.Sine) 
            end
        end
            
        if (shared.AutoRankUp) then
            for i, v in next, RankList do
                Player.ninjaEvent:FireServer("buyRank", v)
            end
        end
        
        wait()
    end
end)()
