--[[
    Author: Scarlett
    
    "Spawn killing has been patched!" 🤓
--]]

local quick = loadstring(game:HttpGet('https://raw.githubusercontent.com/Belkworks/quick/master/init.lua'))();
local lib = loadstring(game:HttpGet('https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua'))().Load({
    Title = 'Swordman Simulator  ―  Bleus',
    Style = 1,
    SizeX = 400,
    SizeY = 400,
    Theme = 'Aqua',
    ColorOverrides = {
        MainFrame = Color3.fromRGB(35, 35, 35);
    }
}).New;

local s = quick.Service;

local workspace = s.Workspace;
local replicatedStorage = s.ReplicatedStorage;
local players = s.Players;
local runService = s.RunService;
local stepped = runService.Stepped;

local client = players.LocalPlayer;
local character = client.Character or client.CharacterAdded:Wait();

client.CharacterAdded:Connect(function(char)
    character = char;
end);

local swordFuncs = require(replicatedStorage.Framework.Core.Shared.SwordFunctions);

local function getStrength(player)
    local strength = (player:FindFirstChild('leaderstats') and player.leaderstats:FindFirstChild('\240\159\146\170 Strength'));
    return strength and strength.Value;
end;

local function autoSwing() -- complicated? I'll just improve ltr on
    local sword = swordFuncs.GetBestSword(client).ModelPath.Name;
    if not character:FindFirstChild(sword) then
        client.Backpack[sword].Parent = character;
    end;
    
    character[sword]:Activate();
end;

local function getClosestPlayer()
    local t, d = nil, math.huge;
    for i = 1, #players:GetPlayers() do
        local v = players:GetPlayers()[i];
        if v ~= client and (v.Character and (v.Character and (v.Character:FindFirstChild('Humanoid') and v.Character:FindFirstChild('HumanoidRootPart')))) then
            if v.Character.Humanoid.Health <= 0 then continue end;
            if v.Character:FindFirstChild('ForceField') then continue end;
            
            do
                local clientStrength = getStrength(client);
                local targetStrength = getStrength(v);
                if (clientStrength and targetStrength) and targetStrength > clientStrength then
                    continue;
                end;
            end;
            
            local magnitude = client:DistanceFromCharacter(v.Character.HumanoidRootPart.Position);
            if magnitude <= d then
                t = v;
                d = magnitude;
            end;
        end;
    end;
    return t;
end;

local main = lib({
    Title = 'Main';
}); do
    main.Toggle({
        Text = 'Auto Swing',
        Callback = function(state)
            getgenv().autoSwingState = state;
            while autoSwingState do
                autoSwing();
                task.wait();
            end;
        end;
    });

    main.Toggle({
        Text = 'Farm Kills',
        Callback = function(state)
            getgenv().farmKillsState = state;
            while farmKillsState do
                task.spawn(function()
                    local target = getClosestPlayer();
                    if target then
                        local targetRootPart = target.Character.HumanoidRootPart;
                        
                        character.HumanoidRootPart.CFrame = targetRootPart.CFrame + (targetRootPart.CFrame.lookVector * 2.5);
                        if not autoSwingState then
                            autoSwing();
                        end;
                    end;
                end);
                task.wait();
            end;
        end;
    });

    main.Button({
        Text = 'Anonymous',
        Callback = function()
            if not character then return end;
            
            local billBoard = (character:FindFirstChild('Head') and character.Head:FindFirstChildWhichIsA('BillboardGui'));
            if billBoard then billBoard:Destroy() end;
            client:ClearCharacterAppearance();
        end;
    });
end;
