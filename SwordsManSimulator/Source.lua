--[[
    Author: Scarlett
    
    I put little to no effort into this script, checks can be simplified and such more.
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

repeat wait() until (game and game:IsLoaded());
local s = quick.Service;

local workspace = s.Workspace;
local players = s.Players;
local runService = s.RunService;
local stepped = runService.Stepped;

local client = players.LocalPlayer;
local character = client.Character or client.CharacterAdded:Wait();
client.CharacterAdded:Connect(function(char)
    character = char;
end);

local function getWeapon(dir)
    if not dir then return end;
    return quick.find(dir:GetChildren(), function(v)
        return v.Name:find('Sword');
    end);
end;

local function getStrength(player)
    if not player or not player:FindFirstChild('leaderstats') then return end; -- Might be a useless check? I didn't put much thought into it.
    local amount = quick.find(player.leaderstats:GetChildren(), function(v)
        return v.Name:find('Strength');
    end).Value;
    
    if not amount then return end;
    return amount;
end;

local function autoSwing()
    local weapon = getWeapon(character);
    if not weapon then
        weapon = getWeapon(client.Backpack);
        if weapon then weapon.Parent = character end;
    end;
    
    if (weapon and weapon:FindFirstChild('Animation')) then
        weapon.Animation.Slash:FireServer();
    end;
end;

local main = lib({
    Title = 'Main';
}); do
    main.Toggle({
        Text = 'Farm Kills',
        Callback = function(state)
            getgenv().farmKillsState = state;
        end;
    });

    main.Toggle({
        Text = 'Auto Swing',
        Callback = function(state)
            getgenv().autoSwingState = state;
        end;
    });

    main.Button({
        Text = 'Invisibility',
        Callback = function()
            if not character or (character and not character:FindFirstChild('HumanoidRootPart')) then return end;
            local oldCFrame = character.HumanoidRootPart.CFrame;
            character.HumanoidRootPart.CFrame = CFrame.new(256, 551, 312);
            
            character.LowerTorso:BreakJoints();
            character.HumanoidRootPart.CFrame = oldCFrame;
        end;
    });
end;

pcall(function() 
    if mainLoop then
        mainLoop:Disconnect();
    end;
end);
getgenv().mainLoop = stepped:Connect(function()
    if not character or (character and not character:FindFirstChild('HumanoidRootPart')) then return end;
    
    if autoSwingState then
        task.spawn(autoSwing);
    end;
    if farmKillsState then
        local playerCollection = players:GetPlayers();
        quick.each(playerCollection, function(v)
            if not v.Character then return end;
            local humanoid = v.Character:FindFirstChild('Humanoid');
            if (humanoid and humanoid.Health <= 0) then return end;
            
            if getStrength(v) > getStrength(client) then
                return; -- You're probably going to die lmao.
            end;
            if v.Character:FindFirstChild('ForceField') then
                return; -- Target has a forcefield, prevent attempt to damaging them.
            end;
            
            if v.Character:FindFirstChild('HumanoidRootPart') then
                local targetRootPart = v.Character.HumanoidRootPart;
                character.HumanoidRootPart.CFrame = targetRootPart.CFrame + (targetRootPart.CFrame.lookVector * 2.5);
                if not autoSwingState then autoSwing() end;
            end;
            task.wait();
        end);
    end;
end);
