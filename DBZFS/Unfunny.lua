local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()

local UI =
    Material.Load(
    {
        Title = "DBZFS  ―  Bleus",
        Style = 2,
        SizeX = 400,
        SizeY = 400,
        Theme = "Dark"
    }
)

local Page =
    UI.New(
    {
        Title = "Main"
    }
)

-- SCRIPTS

Page.Button(
    {
        Text = "NoSlow",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ThatBlueDevil/Bleus/main/DBZFS/NoSlow.lua"))()
        end
    }
)

Page.Button(
    {
        Text = "Invisiblity",
        Callback = function()
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack["Flash Strike"])
            game.Players.LocalPlayer.Character["Flash Strike"].Activator.Animation:Destroy()
            game.Players.LocalPlayer.Character["Flash Strike"]:Activate()
            wait()
            local plr = game.Players.LocalPlayer
            for i, v in pairs(game.Workspace.Live[plr.Name]:GetChildren()) do
                if v.Name == "RebirthWings" then
                    v:Destroy()
                end
                if v.Name == "HumanoidRootPart" then
                    if v.Name == "PowerLevel" then
                        v:Destroy()
                    end
                end
            end
        end
    }
)

Page.Button(
    {
       Text = "BRWorld Damage Players",
       Callback = function()
        game:GetService("Workspace").Live:FindFirstChild(game.Players.LocalPlayer.Name)["team damage"]:Destroy()
    end
    }
)

-- TELEPORTATION

local Page =
    UI.New(
    {
        Title = "Teleportation"
    }
)

Page.Button(
    {
        Text = "Earth",
        Callback = function()
            game:GetService("TeleportService"):Teleport(536102540, game.Players.LocalPlayer)
        end
    }
)

Page.Button(
    {
        Text = "Namek",
        Callback = function()
            game:GetService("TeleportService"):Teleport(882399924, game.Players.LocalPlayer)
        end
    }
)

Page.Button(
    {
        Text = "Space",
        Callback = function()
            game:GetService("TeleportService"):Teleport(478132461, game.Players.LocalPlayer)
        end
    }
)

Page.Button(
    {
        Text = "Future",
        Callback = function()
            game:GetService("TeleportService"):Teleport(569994010, game.Players.LocalPlayer)
        end
    }
)

Page.Button(
    {
        Text = "Secret World",
        Callback = function()
            game:GetService("TeleportService"):Teleport(2046990924, game.Players.LocalPlayer)
        end
    }
)

Page.Button(
    {
        Text = "Queue",
        Callback = function()
            game:GetService("TeleportService"):Teleport(3565304751, game.Players.LocalPlayer)
        end
    }
)
