local ScreenGui = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Border = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local text = Instance.new("TextLabel")

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

Main.Name = "Main"
Main.Parent = ScreenGui
Main.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.352727264, 0, 0.0431119464, 0)
Main.Size = UDim2.new(0, 485, 0, 63)

UICorner.Parent = Main

Border.Name = "Border"
Border.Parent = Main
Border.BackgroundColor3 = Color3.fromRGB(170, 85, 255)
Border.BorderSizePixel = 0
Border.Position = UDim2.new(-0.0184068196, 0, -0.134517118, 0)
Border.Size = UDim2.new(0, 502, 0, 80)
Border.ZIndex = 0

UICorner_2.Parent = Border

text.Name = "text"
text.Parent = Main
text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
text.BackgroundTransparency = 1.000
text.BorderSizePixel = 0
text.Size = UDim2.new(0, 485, 0, 63)
text.ZIndex = 2
text.Font = Enum.Font.Gotham
text.Text = "Made by ThatBlueDevil#4480 and friends"
text.TextColor3 = Color3.fromRGB(170, 85, 255)
text.TextSize = 16.000
