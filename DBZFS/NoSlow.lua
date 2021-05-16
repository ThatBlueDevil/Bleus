function NoSlow()
    local Destroyables = { "Action", "Attacking", "Using", "heavy", "hyper", "Tele", "tele", "Slow", "Killed", "KiBlasted", "MoveStart", "SuperAction", "Hyper", "Dodging", "KiBlasting", "BStun", "FShake", "Activity" }
    
    for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if table.find(Destroyables, v.Name) then
            v:Destroy()
            
            if v.Name == "Justice Combination" then
                
                local f = game.Players.LocalPlayer.Character:WaitForChild("Action")
                
                if f then
                    f:Destroy()
                end
            end

            if v.Name == "Block" and v.Value then
                v.Value = false
            end
        end
    end
end

coroutine.wrap(function()game:GetService("RunService").Heartbeat:Connect(NoSlow)end)()
