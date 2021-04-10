function Credits()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/ThatBlueDevil/Bleus/main/MISC/UI.lua'))()
end
Credits()

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

local Earth = 536102540
local Queue = 3565304751
local Broly = 2050207304

function AuraDeleter()
    for i, v in pairs(game.Players.LocalPlayer.Character.HumanoidRootPart:GetChildren()) do
        if v.Name:find("Aura") or v.Name:find("Trail") or v.Name:find("SaiyanLoop") or v.Name:find("Lightning") then
            v:Destroy()
        end
    end
end

if game.PlaceId == Earth then
    AuraDeleter()
    game.Players.LocalPlayer.Character:WaitForChild("PowerOutput"):Destroy()
    tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(0.05, Enum.EasingStyle.Linear)
    tween =
        tweenService:Create(
        game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart,
        tweenInfo,
        {
            CFrame = CFrame.new(
                -7006.8042,
                20.9846458,
                303.434174,
                0.729539633,
                0,
                -0.683938563,
                -0,
                1,
                -0,
                0.683938563,
                0,
                0.729539633
            )
        }
    )
    tween:Play()
    wait(1.5)
    game.Players.LocalPlayer.Character.LowerTorso.Root:Destroy()
    wait(0.3)
    tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(0.05, Enum.EasingStyle.Linear)
    tween = tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(2750.51929, 3941.83496, -2273.66748, -1, 0, 0, 0, 1, 0, 0, 0, -1) + Vector3.new(0, 0, 2)})
    tween:Play()
    wait(90)
    s["TeleportService"]:Teleport(Earth, game.Players.LocalPlayer)
elseif game.PlaceId == Broly then
    local User = game.Players.LocalPlayer
    local UserCharacter = game.Workspace.Live:FindFirstChild(User.Name)
    local B = game.Workspace.Live["Broly BR"]

    if User.PlayerGui:WaitForChild("HUD").Bottom.Stats.Race.Val.Text == "Android" then
        game.Players.LocalPlayer.Backpack.ServerTraits.Transform:FireServer("g")
    else
        game.Players.LocalPlayer.Backpack.ServerTraits.Input:FireServer({[1] = "x"}, CFrame.new(0, 0, 0), InputObject)
        wait(4.3)
        game.Players.LocalPlayer.Backpack.ServerTraits.Transform:FireServer("h")
        wait(2.2)
        game.Players.LocalPlayer.Backpack.ServerTraits.Input:FireServer(
            {[1] = "xoff"},
            CFrame.new(0, 0, 0),
            InputObject
        )
    end
    wait(.9)
    coroutine.wrap(
        function()
            while wait() do
                tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(0.2, Enum.EasingStyle.Linear)
                tween = tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(-17.4921875, -126.50705, -16.6499023, 0.358377755, -0, -0.933576643, 0, 1, -0, 0.933576643, 0, 0.358377755) + Vector3.new(0, 0, 2)})
                tween:Play()
                for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if v.Name == "Justice Combination" then
                        local action = game.Players.LocalPlayer.Character:WaitForChild("Action")
                        if action then
                            wait()
                            action:Destroy()
                        end
                    end
                    if v.Name == "Attacking" then
                        v:Destroy()
                    end
                    if v.Name == "Using" then
                        v:Destroy()
                    end
                    if v.Name == "heavy" then
                        v:Destroy()
                    end
                    if v.Name == "hyper" then
                        v:Destroy()
                    end
                    if v.Name == "Tele" then
                        v:Destroy()
                    end
                    if v.Name == "Slow" then
                        v:Destroy()
                    end
                    if v.Name == "Action" then
                        v:Destroy()
                    end
                    if v.Name == "Killed" then
                        v:Destroy()
                    end
                    if v.Name == "Block" and v.Value == true then
                        v.Value = false
                    end
                end
            end
        end
    )()
    keypress(0x20)
    wait(1)
    keyrelease(0x20)
    wait(1)
    game.Players.LocalPlayer.Backpack["Dragon Crush"].Parent = UserCharacter
    UserCharacter["Dragon Crush"].Activator["Flip"]:Destroy()
    UserCharacter["Dragon Crush"].Activator["Throw"]:Destroy()
    UserCharacter["Dragon Crush"].Activator["Blocked"]:Destroy()
    UserCharacter["Dragon Crush"].Activator["HitDown"]:Destroy()
    UserCharacter["Dragon Crush"].Activator["BoneBreak"]:Destroy()
    wait(0.5)
    UserCharacter["Dragon Crush"]:Activate()
    wait(0.3)
    UserCharacter["Dragon Crush"]:Deactivate()
    UserCharacter["Dragon Crush"].Parent = game.Players.LocalPlayer.Backpack
    wait(0.3)
    game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
    _G.BeanSpamT = true
    if _G.BeanSpamT == true then
        BeanSpamR =
            s["RunService"].RenderStepped:connect(
            function()
                s["Players"].LocalPlayer.Backpack.ServerTraits.EatSenzu:FireServer(true)
            end
        )
    end
    wait(0.3)
    s["RunService"].Heartbeat:connect(
        function()
        wait()
        s["RunService"].RenderStepped:Wait()
        for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if
                v.Name == _G.Moves[1] or v.Name == _G.Moves[2] or v.Name == _G.Moves[3] or v.Name == _G.Moves[4] or
                    v.Name == _G.Moves[5] or
                    v.Name == _G.Moves[6] or
                    v.Name == _G.Moves[7] or
                    v.Name == _G.Moves[8] or
                    v.Name == _G.Moves[9] or
                    v.Name == _G.Moves[10]
             then
                v.Parent = s["Workspace"].Live[game.Players.LocalPlayer.Name]
                wait()
                v:Activate()
                v:Deactivate()
                v.Parent = game.Players.LocalPlayer.Backpack
            end
        end
        if game.Players.LocalPlayer.Character.Ki.Value < 32 then
            _G.Punching = true
            local value1 = {
                [1] = "m2"
            }
            local value2 =
                CFrame.new(
                -5885.95947,
                17.9874992,
                -4159.84717,
                -0.104352206,
                0.396405816,
                -0.912125587,
                -0,
                0.917132735,
                0.398581922,
                0.994540393,
                0.0415929034,
                -0.0957048237
            )
            local value3 = nil
            local value4 = false
            local Event = s["Players"].LocalPlayer.Backpack.ServerTraits.Input
            Event:FireServer(value1, value2, value3, value4)
            wait()
            _G.Punching = true
        end
        if B.Humanoid.Health < .1 or game.Players.LocalPlayer.Character.Humanoid.Health < 1.5 then
            s["TeleportService"]:Teleport(Earth, game.Players.LocalPlayer)
        end
        if game.Players.LocalPlayer.Character.Humanoid.Health < 50 then
            game.Players.LocalPlayer.Backpack.ServerTraits.Transform:FireServer("h")
        end
        if _G.AntiLeech == true then
        if #game.Players:GetPlayers() > 1 then
            s["TeleportService"]:Teleport(Earth, LocalPlayer)
        end
    end
    end)
end
