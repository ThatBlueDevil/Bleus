game:GetService('Players').LocalPlayer.CameraMode = 'Classic'

local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()

local XX =
    Material.Load(
    {
        Title = "Facility  ―  Bleus",
        Style = 2,
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

local Misc =
    XX.New(
    {
        Title = "Misc"
    }
)

local A = Main.Button(
    {
        Text = "Resurrect",
        Callback = function()
            game:GetService("ReplicatedStorage").Ressurect:FireServer()
            wait(1)
            game:GetService('Players').LocalPlayer.CameraMode = 'Classic'
        end,
        Menu = {
            Information = function(self)
                XX.Banner(
                    {
                        Text = "Revive's all dead players or teleports you to the start."
                    }
                )
            end
        }
    }
)

local B = Main.Button(
    {
        Text = "Spawn Healing",
        Callback = function()
            game:GetService("ReplicatedStorage").UseHeal:FireServer()
        end,
        Menu = {
            Information = function(self)
                XX.Banner(
                    {
                        Text = "Spawns healing pads."
                    }
                )
            end
        }
    }
)

local C = Main.Button(
    {
        Text = "Enable Tracking",
        Callback = function()
           game:GetService("ReplicatedStorage").UseTrack:FireServer()
        end,
        Menu = {
            Information = function(self)
                XX.Banner(
                    {
                        Text = "Enables tracking, after enabling you cannot disable it."
                    }
                )
            end
        }
    }
)

local D = Misc.Toggle({
    Text = "Coin Farm",
    Callback = function(Value)
        getgenv().coins = Value
        while getgenv().coins do
            s["ReplicatedStorage"].GiveCoins:FireServer()
            s["RunService"].RenderStepped:Wait()
        end
    end,
    Enabled = false
})

local E = Main.Toggle({
    Text = "Lag Server",
    Callback = function(Value)
        getgenv().traps = Value
        while getgenv().traps do
            s["ReplicatedStorage"].UseTrap:FireServer()
            s["RunService"].RenderStepped:Wait()
        end
    end,
    Enabled = false
})
