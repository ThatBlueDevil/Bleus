local pad = math.random(1, 7)
if pad == 1 then
    tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(0.1, Enum.EasingStyle.Linear)
    tween =
        tweenService:Create(
        game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart,
        tweenInfo,
        {CFrame = CFrame.new(-26.1189117, 238.054794, -147.576416)}
    )
    tween:Play()
elseif pad == 2 then
    tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(0.1, Enum.EasingStyle.Linear)
    tween =
        tweenService:Create(
        game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart,
        tweenInfo,
        {CFrame = CFrame.new(-24.060957, 238.054794, -291.920319)}
    )
    tween:Play()
elseif pad == 3 then
    tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(0.1, Enum.EasingStyle.Linear)
    tween =
        tweenService:Create(
        game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart,
        tweenInfo,
        {CFrame = CFrame.new(-26.8643761, 238.054794, -423.684021)}
    )
    tween:Play()
elseif pad == 4 then
    tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(0.1, Enum.EasingStyle.Linear)
    tween =
        tweenService:Create(
        game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart,
        tweenInfo,
        {CFrame = CFrame.new(-27.0333195, 238.054794, -591.398315)}
    )
    tween:Play()
elseif pad == 5 then
    tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(0.1, Enum.EasingStyle.Linear)
    tween =
        tweenService:Create(
        game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart,
        tweenInfo,
        {CFrame = CFrame.new(-25.6867237, 238.054794, -731.384155)}
    )
    tween:Play()
elseif pad == 6 then
    tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(0.1, Enum.EasingStyle.Linear)
    tween =
        tweenService:Create(
        game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart,
        tweenInfo,
        {CFrame = CFrame.new(-29.5732059, 238.054794, -883.950989)}
    )
    tween:Play()
elseif pad == 7 then
    tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(0.1, Enum.EasingStyle.Linear)
    tween =
        tweenService:Create(
        game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart,
        tweenInfo,
        {CFrame = CFrame.new(-28.3717651, 238.054794, -1049.88049)}
    )
    tween:Play()
end
