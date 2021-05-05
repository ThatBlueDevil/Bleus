local Material = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()

local Library =
    Material.Load(
    {
        Title = "Era of Althea  ―  Bleus",
        Style = 1,
        SizeX = 400,
        SizeY = 400,
        Theme = "Aqua",
        ColorOverrides = {
            MainFrame = Color3.fromRGB(35,35,35)
        }
    }
)

local Main =
    Library.New(
    {
        Title = "Main"
    }
)

local Settings =
    Library.New(
    {
        Title = "Settings"
    }
)

local s =
    setmetatable(
    {},
    {
        __index = function(self, service)
            return game:GetService(service)
        end,
        __newindex = function(self, key)
            self[key] = nil
        end
    }
)

local EntityList = {
    "Wolf",
    "Dire Wolf",
    "Orc",
    "Golem",
    "Abu",
    "Stork",
    "G-Knights"
}

getgenv().Studs = 5000
getgenv().TweenSpeed = 125

local User = s["Players"].LocalPlayer
local WorkSpace = s["Workspace"]
local UserCharacter = User.Character or User.CharacterAdded:Wait()

local SomeWhatSecretEventLol = UserCharacter.Client.Events["LightAttack"]

--

local setreadonly = make_writeable or setreadonly or changereadonly or change_writeable

local metatable = getrawmetatable(game) or debug.getmetatable(game)
local oldmetatable = metatable.__namecall

local check = checkcaller()

setreadonly(metatable, false)

if not newcclosure then
    newcclosure = function(cclosure)
        return cclosure
    end
end

metatable.__namecall =
    newcclosure(function(self, ...)
        local Arguments = {...}
        
        local Method = getnamecallmethod()
        
        if not check then
            if Method == "Kick" or Method == "kick" then
                return wait(9e9)
            end
        end
        
        return oldmetatable(self, ...)
    end
)

-- Functions --

function Nearest()
    d = getgenv().Studs
    e = nil
    
    for i, v in ipairs(WorkSpace.NPCS:GetChildren()) do
        if (v:FindFirstChild("Hitbox") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Tail4") and v.Humanoid.Health > 0) then
            local Magnitude = (UserCharacter.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude
                
            if (Magnitude < d and Magnitude > 1) then
                d = Magnitude
                e = v
            end
        end
    end
    
    return e
end

--[[
disabled till fixed

if (getgenv().PEEnabled == true and getgenv().PrioritizedEntitys and getgenv().PrioritizedEntitys ~= 'None' and v.Name == getgenv().PrioritizedEntitys) then
    d = Magnitude
    e = v
else
    d = Magnitude
    e = v
end
--]]

--[[

disabled till fixed

local lols = Main.Dropdown({
    Text = "Prioritize Entity's",
    Callback = function(v)
        getgenv().PrioritizedEntitys = v
    end,
    Options = {
        "None",
        table.unpack(EntityList)
    }
})

local lol =
    Main.Toggle(
    {
        Text = "Prioritize",
        Callback = function(v)
            getgenv().PEEnabled = v
        end,
        
        Enabled = false
    }
)
--]]

-- Main Code --

local lol =
    Main.Toggle(
    {
        Text = "AutoFarm",
        Callback = function(v)
            getgenv().AutoFarm = v
            
            while getgenv().AutoFarm do
                local Entity = Nearest()
                i = 90

                if (Entity ~= nil and Workspace:FindFirstChild(User.Name).Health.Value ~= 0 and User.Character.Humanoid.Health ~= 0) then
                    pcall(function()
                        if (User.Character.HumanoidRootPart.Position - Entity.HumanoidRootPart.Position).Magnitude > getgenv().Studs then TweenSpeed = 3 else TweenSpeed = 2.5 end
                        
                        tweenService, tweenInfo = s["TweenService"], TweenInfo.new((User.Character.HumanoidRootPart.Position - Entity["Tail4"].Position).Magnitude / getgenv().TweenSpeed, Enum.EasingStyle.Quad)
                        T = tweenService:Create(User.Character.HumanoidRootPart, tweenInfo, {CFrame = Entity["Tail4"].CFrame * CFrame.Angles(0, math.rad(i), 0)})
                        T:Play()
                    end)
                end
                
                wait()
            end
        end,
        Enabled = false
    }
)

local lol =
    Main.Toggle(
    {
        Text = "Entity Killaura",
        Callback = function(v)
            getgenv().KillAura = v
            
            local Entity = Nearest()
            
            while getgenv().KillAura and wait(.05) do
                if (Entity ~= nil and WorkSpace:FindFirstChild(User.Name).Health.Value ~= 0 and UserCharacter.Humanoid.Health ~= 0) then
                    SomeWhatSecretEventLol:FireServer("SecretCode") -- why are game developers shit at hiding keys ;-;
                end
            end
        end,
        
        Enabled = false
    }
)

local EntityDistance =
    Settings.Slider(
    {
        Text = "Max Entity Distance",
        Callback = function(v)
            getgenv().Studs = v
        end,
        Min = 150,
        Max = 10000,
        Def = 5000
    }
)

local TweenSpeed =
    Settings.Slider(
    {
        Text = "Tweening Speed",
        Callback = function(v)
            getgenv().TweenSpeed = v
        end,
        Min = 10,
        Max = 250,
        Def = 50
    }
)

spawn(function()
    while true do
        if (UserCharacter and getgenv().AutoFarm) then
            User.DevCameraOcclusionMode = 1
            
            if UserCharacter.Humanoid.RigType == Enum.HumanoidRigType.R6 then
                for _, i in next, (UserCharacter:GetDescendants()) do
                    if (i:IsA("BasePart") and i.CanCollide == true) then
                        i.CanCollide = false
                    end
                end
            else
                UserCharacter.Humanoid:ChangeState(11)
            end
            
            for _, v in pairs, (WorkSpace:GetDescendants()) do
                if (v:IsA("BasePart") and v.CanCollide == true) then
                    v.CanCollide = false
                end  
            end
            
            WorkSpace.DescendantAdded:Connect(function(i)
                if i:IsA("BasePart") and i.CanCollide == true then
                    i.CanCollide = false
                end
            end)
        end
        
        wait()
    end
end)
