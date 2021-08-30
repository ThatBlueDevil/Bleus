--[[
    Author: Isela
    Credits: Duh#0100 | Helped me understand the ui lib a little more
--]]

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))().Load({
    Title = "Ninja Legends  ―  Bleus",
    Style = 1,
    SizeX = 400,
    SizeY = 400,
    Theme = "Aqua",
    ColorOverrides = {
        MainFrame = Color3.fromRGB(35, 35, 35)
    }
})

local s = setmetatable({}, {
    __index = function(self, key)
        return game:GetService(key)
    end
})

-- Localization.
repeat wait() until (game and game:IsLoaded()) and (s.Players.LocalPlayer and s.Players.LocalPlayer.Character);
local Player = s.Players.LocalPlayer;
local Character = Player.Character or Player.CharacterAdded:Wait();

Player.CharacterAdded:Connect(function(char)
    Character = char;
end);

local Workspace = s.Workspace;
local TweenService = s.TweenService;
local RunService = s.RunService;
local VirtualUser = s.VirtualUser;
local ReplicatedStorage = s.ReplicatedStorage;

local Camera = Workspace.CurrentCamera;
local Heartbeat, Stepped, RenderStepped = RunService.Heartbeat, RunService.Stepped, RunService.RenderStepped;

-- Exploit Check.
if not firetouchinterest then
    Player:Kick("[BLEUS]: Your exploit isn't compatible with this script.");
    return;
end;

-- thing for rank check.
Character.HumanoidRootPart.CFrame = CFrame.new(120, 3, 32);

-- Functions consist of: Find | Tween | ninjaEvent | sellNin | getLastRank.
local Find, Tween, ninjaEvent, sellNin, getItem; do
    function Find(Directory, Name)
        local d, e = math.huge;
        
        for i, v in next, Directory:GetDescendants() do
            if (v.Name:find(Name) and (v.Transparency and v.Transparency ~= 1)) then
                local Magnitude = Player:DistanceFromCharacter(v.Position);
                
                if Magnitude < d then
                    d = Magnitude;
                    e = v;
                end;
            end;
        end;
        
        return e;
    end;
    
    function Tween(Obj, Properties, Time)
        local Tweeb = TweenService:Create(Obj, TweenInfo.new(Time), Properties);
        Tweeb:Play();
        
    	return Tweeb;
    end;
    
    function ninjaEvent(...)
        if not Player.ninjaEvent then return end;
        Player.ninjaEvent:FireServer(...);
    end;
    
    function sellNin(t) -- please lets just not...
        local Menu = Player.PlayerGui.gameGui.maxNinjitsuMenu;
        local SellCircle = Workspace.sellAreaCircles.sellAreaCircle16.circleInner:FindFirstChildWhichIsA("TouchTransmitter");
        
        local Root = (Character.HumanoidRootPart or Character:WaitForChild("HumanoidRootPart"));
        
        if t then
            if Menu.Visible then
                firetouchinterest(Root, SellCircle.Parent, 0);
                wait(0.1);
                firetouchinterest(Root, SellCircle.Parent, 1);
            end;
        else
            firetouchinterest(Root, SellCircle.Parent, 0);
            wait(0.1);
            firetouchinterest(Root, SellCircle.Parent, 1);
        end;
    end;
    
    function getItem(Option) -- lazy ass coding I dont wanna make better.
        local dir; do
            if (Option == "Weapons") then
                dir = Player.PlayerGui.gameGui.itemsShopMenu.menus.swordsMenu;
            else
                dir = Player.PlayerGui.gameGui.itemsShopMenu.menus.ranksMenu;
            end;
        end;
        
        local Results = { };
        for i, v in next, dir:GetChildren() do
            if v:IsA("Frame") and (v:FindFirstChild("swordButton") and v:FindFirstChild("lockImage", true) and v:FindFirstChild("equippedLabel", true) and not v.swordButton.lockImage.Visible and not v.swordButton.equippedLabel.Visible) then
                Results[#Results + 1] = v:FindFirstChildWhichIsA("ObjectValue").Value
            end;
        end;
        
        return Results[#Results]
    end;
end;

-- Anti-AFK.
if getconnections then
    for i = 1, #getconnections(Player.Idled) do
        getconnections(Player.Idled)[i]:Disable();
    end;
else
    Player.Idled:Connect(function()
       VirtualUser:Button2Down(Vector2.new(0, 0), CurrentCamera.CFrame);
       wait(1);
       VirtualUser:Button2Up(Vector2.new(0, 0), CurrentCamera.CFrame);
    end);
end;

-- Flags and Chips.
shared._Flags, shared._Chips = {
    AutoSwing,
    AutoSell,
    AutoBuySwords,
    AutoBuyBelts,
    AutoBuyShurikens,
    AutoBuySkills,
    AutoRankUp,
    AutoFarmCoins,
    AutoFarmChi
}, {
    SellAtMaxNin,
    HideWeapon  
};

-- Library Initalation.
local Main = Library.New({
    Title = "Main";
}); do
    Main.Toggle({
        Text = "Auto Swing",
        Callback = function(v)
            shared._Flags.AutoSwing = v;
        end,
        
        Enabled = false;
    });
    
    Main.ChipSet({
        Text = "pop",
        Callback = function(Chip)
            table.foreach(Chip, function(Option, State)
                shared._Chips.HideWeapon = State
            end)
        end,
        
        Options = { ["Hide Weapon"] = false };
    });
    
    Main.Toggle({
        Text = "Auto Sell",
        Callback = function(v)
            shared._Flags.AutoSell = v;
        end,
        
        Enabled = false;
    });
    
    Main.ChipSet({
        Text = "pop2",
        Callback = function(Chip)
            table.foreach(Chip, function(Option, State)
                shared._Chips.SellAtMaxNin = State
            end)
        end,
        
        Options = { ["Sell At Max Ninjitsu"] = false };
    });
    
    Main.Toggle({
        Text = "Auto Buy Swords",
        Callback = function(v)
            shared._Flags.AutoBuySwords = v;
        end,
        
        Enabled = false;
    });
        
    Main.Toggle({
        Text = "Auto Buy Belts",
        Callback = function(v)
            shared._Flags.AutoBuyBelts = v;
        end,
        
        Enabled = false;
    });
    
    Main.Toggle({
        Text = "Auto Buy Shurikens",
        Callback = function(v)
            shared._Flags.AutoBuyShurikens = v;
        end,
        
        Enabled = false;
    });
    
    Main.Toggle({
        Text = "Auto Buy Skills",
        Callback = function(v)
            shared._Flags.AutoBuySkills = v;
        end,
        
        Enabled = false;
    });
    
    Main.Toggle({
        Text = "Auto RankUp",
        Callback = function(v)
            shared._Flags.AutoRankUp = v;
        end,
        
        Enabled = false;
    });
end;

local Farming = Library.New({
    Title = "Farming";
}); do
    Farming.Toggle({
        Text = "Farm Coins",
        Callback = function(v)
            shared._Flags.AutoFarmCoins = v;
        end,
        
        Enabled = false;
    });
    
    Farming.Toggle({
        Text = "Farm Chi",
        Callback = function(v)
            shared._Flags.AutoFarmChi = v;
        end,
        
        Enabled = false;
    });
end;

local Teleports = Library.New({ -- not order but that's not my problem lololol
    Title = "Teleports";
}); do
    for i = 1, #Workspace.islandUnlockParts:GetChildren() do
        local v = Workspace.islandUnlockParts:GetChildren()[i];
        
        Teleports.Button({
            Text = v.Name,
            Callback = function()
                (Character.HumanoidRootPart or Character:WaitForChild("HumanoidRootPart")).CFrame = (v.CFrame + Vector3.new(0, -25, 0));
                wait();
                (Character.Humanoid or Character:WaitForChild("Humanoid")):ChangeState(11);
            end;
        });
    end;
end;

local Misc = Library.New({
    Title = "Misc"
}); do
    Misc.Button({
        Text = "Unlock All Island's",
        Callback = function(v)
            for i, v in next, Workspace.islandUnlockParts:GetChildren() do
                if v:FindFirstChildWhichIsA("TouchTransmitter") then
                    local Transmitter = v:FindFirstChildWhichIsA("TouchTransmitter");
                    
                    firetouchinterest((Character.HumanoidRootPart or Character:WaitForChild("HumanoidRootPart")), Transmitter.Parent, 0);
                    wait(0.1);
                    firetouchinterest((Character.HumanoidRootPart or Character:WaitForChild("HumanoidRootPart")), Transmitter.Parent, 1);
                end;
            end;
        end;
    });
    
    Misc.Button({
        Text = "Open All Chest's",
        Callback = function(v)
            for i, v in next, Workspace:GetChildren() do
                if (v:FindFirstChild("Chest") and (v:FindFirstChild("circleInner") and v.circleInner:FindFirstChildWhichIsA("TouchTransmitter"))) then
                    local Transmitter = v.circleInner:FindFirstChildWhichIsA("TouchTransmitter");
                    
                    firetouchinterest((Character.HumanoidRootPart or Character:WaitForChild("HumanoidRootPart")), Transmitter.Parent, 0);
                    wait(0.1);
                    firetouchinterest((Character.HumanoidRootPart or Character:WaitForChild("HumanoidRootPart")), Transmitter.Parent, 1);
                end;
            end;
        end;
    });
    
    Misc.Button({
        Text = "Hide Pop-Ups",
        Callback = function(v)
            if Player.PlayerGui:FindFirstChild("statEffectsGui") then
                Player.PlayerGui.statEffectsGui:Destroy();
            end;
        end;
    });
end;

-- Main Loop.
pcall(function() if shared._loop then shared._loop:Disconnect() end end);

wait()
task.spawn(function()
    shared._loop = Stepped:Connect(function()
        local Root = (Character.HumanoidRootPart or Character:WaitForChild("HumanoidRootPart"));
        local Humanoid = (Character.Humanoid or Character:WaitForChild("Humanoid"));
        
        if shared._Flags.AutoSwing then
            if not Player:FindFirstChild("ninjaEvent") then return end;
            
            for i, v in next, Player.Backpack:GetChildren() do
                if (v:FindFirstChild("ninjitsuGain") and not Character:FindFirstChild("ninjitsuGain")) then
                    Humanoid:EquipTool(v);
                end;
            end;
            
            if Character:FindFirstChildWhichIsA("Tool") then
                ninjaEvent("swingKatana");
                
                if shared._Chips.HideWeapon then
                    local Weapon = Character:FindFirstChildWhichIsA("Tool");
                    for i = 1, #Weapon:GetChildren() do
                        local v = Weapon:GetChildren()[i];
                        
                        if (v:FindFirstChildWhichIsA("ParticleEmitter") or v:FindFirstChildWhichIsA("PointLight") or v:FindFirstChildWhichIsA("Trail")) then
                            task.defer(v.Destroy, v);
                        elseif v:IsA("MeshPart") then
                            v.Transparency = 1;
                        end;
                    end;
                    
                    if Character:FindFirstChild("swordCloneModel") then
                        task.defer(Character.swordCloneModel.Destroy, Character.swordCloneModel);
                    end
                end;
            end;
        end;
        
        if shared._Flags.AutoSell then -- had the idea that this was gonna be super cool! turned out like dog shit.
            sellNin(shared._Chips.SellAtMaxNin);
        end;
        
        if shared._Flags.AutoBuyBelts then
            ninjaEvent("buyAllBelts", "Blazing Vortex Island");
        end;
        
        if shared._Flags.AutoBuySwords then
            ninjaEvent("buySword", tostring(getItem("Weapons")));
        end;
        
        if shared._Flags.AutoBuyShurikens then
            ninjaEvent("buyAllShurikens", "Blazing Vortex Island");
        end;

        if shared._Flags.AutoBuySkills then
            ninjaEvent("buyAllSkills", "Blazing Vortex Island");
        end;
        
        if shared._Flags.AutoFarmCoins then
            local Coins = Find(Workspace.spawnedCoins.Valley, "Coin");
            
            if Coins then
                Humanoid:ChangeState(11);
                Tween(Root, {CFrame = CFrame.new(Coins.Position)}, Player:DistanceFromCharacter(Coins.Position) / 1500, Enum.EasingStyle.Linear);
            end;
        end;
        
        if shared._Flags.AutoFarmChi then
            local Chi = Find(Workspace.spawnedCoins.Valley, "Chi");
            
            if Chi then
                Humanoid:ChangeState(11);
                Tween(Root, {CFrame = CFrame.new(Chi.Position)}, Player:DistanceFromCharacter(Chi.Position) / 1500, Enum.EasingStyle.Linear);
            end;
        end;
        
        if shared._Flags.AutoRankUp then
            ninjaEvent("buyRank", tostring(getItem()));
        end;
    end);
end);
