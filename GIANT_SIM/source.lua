local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()

local XX =
    Material.Load(
    {
        Title = "Giant Simulator  ―  Bleus",
        Style = 1,
        SizeX = 400,
        SizeY = 400,
        Theme = "Dark"
    }
)

local GoogleRemote = game:GetService("ReplicatedStorage").ReportGoogleAnalyticsEvent

-- Functions

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

hookfunction(GoogleRemote.FireServer, function()
   return nil 
end)

function FindFolder(name)
    for _,f in next, game:GetService("Workspace").Scene:GetChildren() do
        if string.find(f.Name, name) then
           return f
        end
    end
end

-- GUI

local Main =
    XX.New(
    {
        Title = "Main"
    }
)

local Misc =
    XX.New(
    {
        Title = "Misc"
    }
)

local D =
    Main.Toggle(
    {
        Text = "Auto Farm",
        Callback = function(Value)
            _G.AutoFarm = Value
            while _G.AutoFarm do
                wait(0.3)
                local Noders = FindFolder("147"):GetChildren()
                local s = math.random(1, #Noders)
                game:GetService("RunService").RenderStepped:Wait()
                tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(0, Enum.EasingStyle.Linear)
                tween =
                    tweenService:Create(
                    game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart,
                    tweenInfo,
                    {CFrame = CFrame.new(Noders[s].Position)}
                )
                tween:Play()
            end
        end,
        Enabled = false
    }
)

local blah =
    Main.Toggle(
    {
        Text = "Auto Jump",
        Callback = function(Value)
            _G.AutoJump = Value
            while _G.AutoJump do
                wait(0.60)
                local User = User.Players.LocalPlayer
                local UserCharacter = User.Character
                local Humanoid = UserCharacter.Humanoid
                Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end,
        Enabled = false
    }
)

local blah =
    Main.Toggle(
    {
        Text = "Auto Attack",
        Callback = function(Value)
            _G.AutoAttack = Value
            while _G.AutoAttack do
                wait()
                game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.GameService.WeaponAttackStart:FireServer()
                wait(.10)
                game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.GameService.WeaponAnimComplete:FireServer()
            end
        end,
        Enabled = false
    }
)
