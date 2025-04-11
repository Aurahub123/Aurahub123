local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

-- UI Setup
local ScreenGui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
ScreenGui.Name = "AuraHubUtilityUI"

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 300, 0, 270)
Frame.Position = UDim2.new(0, 20, 0.5, -135)
Frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Instance.new("UICorner", Frame).CornerRadius = UDim.new(0.05, 0)

local function createButton(name, posY, callback)
	local btn = Instance.new("TextButton", Frame)
	btn.Size = UDim2.new(0, 260, 0, 30)
	btn.Position = UDim2.new(0, 20, 0, posY)
	btn.BackgroundColor3 = Color3.fromRGB(50,
