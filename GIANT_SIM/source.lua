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

s = {}
setmetatable(
    s,
    {
        __index = function(_, service)
            return game:GetService(service)
        end,
        __newindex = function(t, i)
            t[i] = nil
            return
        end
    }
)

local Main =
    XX.New(
    {
        Title = "Main"
    }
)

local D =
    Main.Toggle(
    {
        Text = "Auto Farm",
        Callback = function(Value)
            getgenv().AutoFarm = Value
            while getgenv().AutoFarm do
                wait(2.5)
                local Noders = workspace.Scene["147082940"]:GetChildren()
                local s = math.random(1, #Noders)
                game:GetService("RunService").RenderStepped:Wait()
                tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(1, Enum.EasingStyle.Linear)
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
            getgenv().AutoJump = Value
            while getgenv().AutoJump do
                wait(0.67)
                local player = game.Players.LocalPlayer
                local char = player.Character
                local humanoid = char.Humanoid
                humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
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
            getgenv().AutoAttack = Value
            while getgenv().AutoAttack do
                game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.GameService.WeaponAttackStart:FireServer()
                wait(.10)
                game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.GameService.WeaponAnimComplete:FireServer()
            end
        end,
        Enabled = false
    }
)
