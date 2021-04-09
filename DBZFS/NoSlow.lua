coroutine.wrap(
    function()
        while wait() do
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
)
