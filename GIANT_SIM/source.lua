local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()

local XX =
    Material.Load(
    {
        Title = "Giant Simulator  ―  Bleus",
        Style = 1,
        SizeX = 400,
        SizeY = 400,
        Theme = "Aqua",
        ColorOverrides = {
            MainFrame = Color3.fromRGB(35,35,35)
        }
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

local User = s["Players"].LocalPlayer
local ReplicatedStorage = s["ReplicatedStorage"]

local GoogleRemote = ReplicatedStorage.ReportGoogleAnalyticsEvent

hookfunction(GoogleRemote.FireServer, function()
   return nil 
end)

function FindFolder(name)
    for _,f in next, s["Workspace"].Scene:GetChildren() do
        if string.find(f.Name, name) then
           return f
        end
    end
end

function Eggs()
    d = math.huge
    e = nil
    
    local Egg = {}
    
    for i, v in ipairs(FindFolder("147"):GetChildren()) do
        if (v:FindFirstChild("Prefab") and v["Prefab"].Position ~= nil) then
            local Magnitude = (User.Character.HumanoidRootPart.Position - v.Position).Magnitude
            
            if (Magnitude < d) then
                d = Magnitude
                e = v
            end
        end
    end
    
    return e
end

-- GUI

local Main =
    XX.New(
    {
        Title = "Main"
    }
)

local lols =
    Main.Toggle(
    {
        Text = "Auto Farm",
        Callback = function(Value)
            _G.AutoFarm = Value
            while _G.AutoFarm do
                
            local Egg = Eggs()
                
            if (Egg) then
                User.Character.Humanoid:ChangeState(11)
                
                if (User.Character.HumanoidRootPart.Position - Egg.Position).Magnitude > math.huge then L = 1 else L = .1 end
                
                tweenService, tweenInfo = s["TweenService"], TweenInfo.new(L, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
                T = tweenService:Create(User.Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(Egg.Position)})
                T:Play()
                end
                wait()
            end
        end,
        Enabled = false
    }
)

local lols =
    Main.Toggle(
    {
        Text = "Auto Attack",
        Callback = function(Value)
            _G.AutoAttack = Value
            while _G.AutoAttack do
                s["ReplicatedStorage"].Aero.AeroRemoteServices.GameService.WeaponAttackStart:FireServer()
                wait(.65)
                s["ReplicatedStorage"].Aero.AeroRemoteServices.GameService.WeaponAnimComplete:FireServer()
                
                wait()
            end
        end,
        Enabled = false
    }
)

spawn(function()
    while true do
        if (User.Character ~= nil and _G.AutoFarm) then
            local function NoClipping()
                for _, Parts in next, (User.Character:GetDescendants()) do
                    if (Parts:IsA("BasePart") and Parts.CanCollide == true) then
                        Parts.CanCollide = false
                    end
                end
            end
            
            spawn(NoClipping)
        end
        wait()
    end
end)
