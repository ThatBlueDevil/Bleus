--[[ Author: Isela --]]

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))().Load({
    Title = "Giant Simulator  ―  Bleus",
    Style = 1,
    SizeX = 400,
    SizeY = 400,
    Theme = "Aqua",
    ColorOverrides = {
        MainFrame = Color3.fromRGB(30, 30, 30)
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

-- Flags / oh my god I need a ui lib with actual flags :sob:.
shared._Flags = {
    AutoFarm,
    AutoJump,
    AutoAttack
};

-- Anti-AFK and Anti-Logging(idk if they still have it)
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

hookfunction(ReplicatedStorage.ReportGoogleAnalyticsEvent.FireServer, function()
   return nil;
end);

-- Functions consist of: Tween | getNodeFolder | getANode.
local Tween, getNodeFolder, getANode; do
    function Tween(Obj, Properties, Time)
        local Tweeb = TweenService:Create(Obj, TweenInfo.new(Time), Properties);
        Tweeb:Play();
        
    	return Tweeb;
    end;

    function getNodeFolder()
        for _, f in next, Workspace.Scene:GetChildren() do
            if type(tonumber(f.Name)) == "number" then
                return f;
            end;
        end;
    end;
    
    function getANode()
        local d, e = math.huge;
        
        for i, v in next, getNodeFolder():GetChildren() do
            if (v:FindFirstChild("Prefab") and v.Prefab.Position) then
                local Magnitude = Player:DistanceFromCharacter(v.Position);
                
                if (Magnitude < d) then
                    d = Magnitude;
                    e = v;
                end;
            end;
        end;
        
        return e;
    end;
end;

-- Library Initalation.
local Main = Library.New({
    Title = "Main";
}); do
    Main.Toggle({
        Text = "Auto Farm",
        Callback = function(v)
            shared._Flags.AutoFarm = v;
        end,
        
        Enabled = false;
    });
end;

pcall(function() if shared._loop then shared._loop:Disconnect() end end);

wait();
task.spawn(function()
    shared._loop = RenderStepped:Connect(function()
        local Root = (Character.HumanoidRootPart or Character:WaitForChild("HumanoidRootPart"));
        local Humanoid = (Character.Humanoid or Character:WaitForChild("Humanoid"));
        
        if shared._Flags.AutoFarm then
            if getANode() then
                Humanoid:ChangeState(11);
                task.spawn(Tween, Root, {CFrame = getANode().CFrame}, Player:DistanceFromCharacter(getANode().Position) / 2500, Enum.EasingStyle.Linear);
            end;
            --
            task.spawn(function()
                ReplicatedStorage.Aero.AeroRemoteServices.GameService.WeaponAttackStart:FireServer();
                wait(0.65);
                ReplicatedStorage.Aero.AeroRemoteServices.GameService.WeaponAnimComplete:FireServer();
            end);
        end;
    end);
end);
