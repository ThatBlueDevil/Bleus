--[[
    Author: Scarlett
    
    I literally pasted most of the work from my old script LOL
--]]

local quick = loadstring(game:HttpGet('https://raw.githubusercontent.com/Belkworks/quick/master/init.lua'))();
local lib = loadstring(game:HttpGet('https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua'))().Load({
    Title = 'Knockout  ―  Bleus',
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
    return quick.find(dir:GetChildren(), function(v)
        return v:IsA('Tool') and v:FindFirstChild('Damage');
    end);
end;

local function autoSwing(remote, args)
    local weapon = getWeapon(character);
    if not weapon then
        weapon = getWeapon(client.Backpack);
        if weapon then weapon.Parent = character end;
    end;
    
    if (weapon and weapon:FindFirstChild(remote)) then
        weapon[remote]:FireServer(args);
    end;
end;

local main = lib({
    Title = 'Main';
}); do
    main.Toggle({
        Text = 'Auto Swing',
        Callback = function(state)
            getgenv().autoSwingState = state;
        end;
    });

    main.Toggle({
        Text = 'Harm Others',
        Callback = function(state)
            getgenv().harmOthersState = state;
        end;
    });
end;

pcall(function() 
    if getgenv().mainLoop then
        getgenv().mainLoop:Disconnect();
    end;
end);
getgenv().mainLoop = stepped:Connect(function()
    if not character or (character and not character:FindFirstChild('HumanoidRootPart')) then return end;
    
    if autoSwingState then
        task.spawn(autoSwing, 'ExpRemote');
    end;
    if harmOthersState then
        local playerCollection = players:GetPlayers();
        quick.each(playerCollection, function(v)
            if v == client then return end;
            local humanoid = v.Character and v.Character:FindFirstChild('Humanoid');
            if (not humanoid or (humanoid and humanoid.Health <= 0)) then return end;
            
            if v.Character:FindFirstChild('SafeTag') or v.Character:FindFirstChildWhichIsA('ForceField') then
                return; -- Target is in SafeZone(or has a forcefield), prevent attempt to damaging them.
            end;
            
            autoSwing('DamageRemote', humanoid);
            task.wait();
        end);
    end;
end);
