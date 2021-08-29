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
local Player = s.Players.LocalPlayer;
local Character = Player.Character or Player.CharacterAdded:Wait();

local Humanoid = (Character and Character:FindFirstChildWhichIsA("Humanoid"));
local Root = (Character and Character:FindFirstChild("HumanoidRootPart"));

Player.CharacterAdded:Connect(function(char)
    Character = char;
    Humanoid = (char and char:FindFirstChildWhichIsA("Humanoid"));
    Root = (char and char:FindFirstChild("HumanoidRootPart"));
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

-- Find Close Objects | Tweening | ninjaEvents | sellNin | getCurrency
local Find, Tween, ninjaEvent, sellNin; do
    function Find(Directory, Name)
        local d, e = math.huge;
        
        for i, v in next, Directory:GetDescendants() do
            if (v.Name:find(Name) and (v.Transparency and v.Transparency ~= 1)) then
                local Magnitude = Player:DistanceFromCharacter(v.Position);
                
                if (Magnitude < d) then
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
    
    function ninjaEvent(Type)
        if not Player.ninjaEvent then return end;
        Player.ninjaEvent:FireServer(Type, "Blazing Vortex Island");
    end;
    
    function getCurrency(tblval)
        local a = Player.PlayerGui.gameGui.currencyFrame.strengthFrame.amountLabel.Text:split("/")[tblval];
        return tonumber(a:match("[%d]+"));
    end;
    
    function sellNin(lol) -- please lets just not...
        local SellCircle = Workspace.sellAreaCircles.sellAreaCircle16.circleInner:FindFirstChildWhichIsA("TouchTransmitter");
        if not SellCircle then return end;
        
        if lol then
            if (getCurrency(1) >= getCurrency(2)) then
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
end;

-- Anti-AFK.
if getconnections then
    for i = 1, #getconnections(Player.Idled) do
        getconnections(Player.Idled)[i]:Disable();
    end;
else
    Player.Idled:Connect(function()
       VirtualUser:Button2Down(Vector2.new(0,0), CurrentCamera.CFrame);
       wait(1);
       VirtualUser:Button2Up(Vector2.new(0,0), CurrentCamera.CFrame);
    end);
end

-- Tabs and Toggles.
shared.SellAtMaxNin = false

local Main = Library.New({
    Title = "Main";
}); do
    Main.Toggle({
        Text = "Auto Swing",
        Callback = function(v)
            shared.AutoSwing = v;
        end,
        
        Enabled = false;
    });
    
    Main.Toggle({
        Text = "Auto Sell",
        Callback = function(v)
            shared.AutoSell = v;
        end,
        
        Enabled = false;
    });
    
    Main.ChipSet({
        Text = "pop",
        Callback = function(Chip)
            table.foreach(Chip, function(Option, State)
                shared.SellAtMaxNin = State
            end)
        end,
        
        Options = { ["Sell At Max Ninjitsu"] = false };
    });
    
    Main.Toggle({
        Text = "Auto Buy Swords",
        Callback = function(v)
            shared.AutoBuySwords = v;
        end,
        
        Enabled = false;
    });
        
    Main.Toggle({
        Text = "Auto Buy Belts",
        Callback = function(v)
            shared.AutoBuyBelts = v;
        end,
        
        Enabled = false;
    });
    
    Main.Toggle({
        Text = "Auto Buy Shurikens",
        Callback = function(v)
            shared.AutoBuyShurikens = v;
        end,
        
        Enabled = false;
    });
    
    Main.Toggle({
        Text = "Auto Buy Skills",
        Callback = function(v)
            shared.AutoBuySkills = v;
        end,
        
        Enabled = false;
    });
    
    Main.Toggle({
        Text = "Auto RankUp",
        Callback = function(v)
            shared.AutoRankUp = v;
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
            shared.AutoFarmCoins = v;
        end,
        
        Enabled = false;
    });
    
    Farming.Toggle({
        Text = "Farm Chi",
        Callback = function(v)
            shared.AutoFarmChi = v;
        end,
        
        Enabled = false;
    });
end;

local Misc = Library.New({
    Title = "Misc"
}); do
    Misc.Button({
        Text = "Unlock All Island's",
        Callback = function(v)
            if not Character or not Root then return end;
            for i, v in next, Workspace.islandUnlockParts:GetChildren() do
                if v:FindFirstChildWhichIsA("TouchTransmitter") then
                    local Transmitter = v:FindFirstChildWhichIsA("TouchTransmitter");
                    
                    firetouchinterest(Root, Transmitter.Parent, 0);
                    wait(0.1);
                    firetouchinterest(Root, Transmitter.Parent, 1);
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
                    
                    firetouchinterest(Root, Transmitter.Parent, 0);
                    wait(0.1);
                    firetouchinterest(Root, Transmitter.Parent, 1);
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

--> Main Loop <--
pcall(function() if shared.loop then shared.loop:Disconnect() end end);

wait()
coroutine.wrap(function()
    shared.loop = Heartbeat:Connect(function()
        if not Character or not Root then return end;
        
        if shared.AutoSwing then
            if not Player:FindFirstChild("ninjaEvent") then return end;
            
            for i, v in next, Player.Backpack:GetChildren() do
                if (v:FindFirstChild("ninjitsuGain") and not Character:FindFirstChild("ninjitsuGain")) then
                    task.spawn(Humanoid.EquipTool, Character.Humanoid, v);
                end;
            end;
            
            if Character:FindFirstChildWhichIsA("Tool") then
                task.spawn(ninjaEvent, "swingKatana");
            end;
        end;
        
        if shared.AutoSell then -- had the idea that this was gonna be super cool! turned out like dog shit.
            task.spawn(sellNin, shared.SellAtMaxNin);
        end;
            
        if shared.AutoBuyBelts then
            task.spawn(ninjaEvent, "buyAllBelts");
        end;
        
        if shared.AutoBuySwords then
            task.spawn(ninjaEvent, "buyAllSwords");
        end;
        
        if shared.AutoBuyShurikens then
            task.spawn(ninjaEvent, "buyAllShurikens");
        end;

        if shared.AutoBuySkills then
            task.spawn(ninjaEvent, "buyAllSkills");
        end;
        
        if shared.AutoFarmCoins then
            local Coins = Find(Workspace.spawnedCoins.Valley, "Coin");
            
            if Coins then
                Character.Humanoid:ChangeState(11);
                task.spawn(Tween, Root, {CFrame = CFrame.new(Coins.Position)}, (Root.Position - Coins.Position).Magnitude / 1500, Enum.EasingStyle.Linear);
            end;
        end;
        
        if shared.AutoFarmChi then
            local Chi = Find(Workspace.spawnedCoins.Valley, "Chi");
            
            if Chi then
                Humanoid:ChangeState(11);
                task.spawn(Tween, Root, {CFrame = CFrame.new(Chi.Position)}, (Root.Position - Chi.Position).Magnitude / 1500, Enum.EasingStyle.Linear);
            end;
        end;
            
        if shared.AutoRankUp then
            for i = 1, #ReplicatedStorage.Ranks.Ground:GetChildren() do
                task.spawn(ninjaEvent, "buyRank", ReplicatedStorage.Ranks.Ground:GetChildren()[i].Name);
            end;
        end;
        
        wait()
    end);
end)();
