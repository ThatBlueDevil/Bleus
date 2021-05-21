-- LockOn Script Originally made by yakman on v3rmillion. Recreated by ThatBlueDevil

local Client = {}; do
    Client.User = game:GetService("Players").LocalPlayer
    Client.Character = game:GetService("Players").LocalPlayer.Character
end

local function NearestPlayer()
    local c = Client.User and Client.User:FindFirstChild("HumanoidRootPart")
    if not (Client.User or c) then return end
    
    local data = {nil, 10000} 

    for i, v in pairs(game.Players:GetPlayers()) do
        if (v ~= Client.User and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character:FindFirstChild("HumanoidRootPart") and v.Character.Humanoid.Health > 0) then
            local Magnitude = Client.User:DistanceFromCharacter(v.Character.HumanoidRootPart.Position)
            
            if (Magnitude < data[2] and Magnitude > 0) then
                data = {v, Magnitude}
            end
        end
    end
    
    return (data[1] and data)
end

local n = NearestPlayer()

print(n[1])
