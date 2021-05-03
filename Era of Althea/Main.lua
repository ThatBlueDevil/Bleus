local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()

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

local SomeWhatSecretEventLol = User.Character.Client.Events["LightAttack"]

-- Functions --

function Nearest()
    d = math.huge
    e = nil
    
    for i, v in ipairs(s["Workspace"].NPCS:GetChildren()) do
        if (v:FindFirstChild("Hitbox") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0) then
            local Magnitude = (User.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude
                
            if (Magnitude < d) then
                d = Magnitude
                e = v
            end
        end
    end
    
    return e
end

-- Main Code --

local lol =
    Main.Toggle(
    {
        Text = "AutoFarm",
        Callback = function(Value)
            _G.AutoFarm = Value
            while _G.AutoFarm do

                local Entity = Nearest()

                if (Entity ~= nil) then
                    tweenService, tweenInfo = s["TweenService"], TweenInfo.new(.25, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
                    T = tweenService:Create(User.Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(Entity.HumanoidRootPart.Position)})
                    T:Play()
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
        Callback = function(Value)
            _G.KillAura = Value
            
            local Entity = Nearest()
            
            while _G.KillAura and wait() do
                if (Entity ~= nil) then
                    SomeWhatSecretEventLol:FireServer("SecretCode") -- why are game developers shit at hiding keys ;-;
                end
            end
        end,
        
        Enabled = false
    }
)

spawn(function()
    while true do
        if (User.Character ~= nil and _G.AutoFarm) then
            local function NoClipping()
                if User.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
                    for _, Parts in next, (User.Character:GetDescendants()) do
                        if (Parts:IsA("BasePart") and Parts.CanCollide == true) then
                            Parts.CanCollide = false
                        end
                    end
                else
                    User.Character.Humanoid:ChangeState(11)
                end
            end
            
            spawn(NoClipping)
        end
        wait()
    end
end)
