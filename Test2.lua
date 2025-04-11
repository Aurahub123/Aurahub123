local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local gui = Instance.new("ScreenGui")
gui.Name = "AuraHubUI"
gui.ResetOnSpawn = false
gui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")

-- Main Frame
local mainFrame = Instance.new("Frame", gui)
mainFrame.Size = UDim2.new(0, 600, 0, 400)
mainFrame.Position = UDim2.new(0.5, -300, 0.5, -200)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BorderSizePixel = 0

-- Title
local title = Instance.new("TextLabel", mainFrame)
title.Size = UDim2.new(0, 200, 0, 30)
title.Position = UDim2.new(1, -210, 0, 10)
title.Text = "AURA HUB"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1
title.TextXAlignment = Enum.TextXAlignment.Right
title.Font = Enum.Font.GothamBold
title.TextSize = 20

-- Dragging Function
local dragging, dragInput, dragStart, startPos

mainFrame.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPos = mainFrame.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

UIS.InputChanged:Connect(function(input)
	if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
		local delta = input.Position - dragStart
		mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
			startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
end)

-- Toggle Button
local toggleButton = Instance.new("TextButton", gui)
toggleButton.Size = UDim2.new(0, 40, 0, 40)
toggleButton.Position = UDim2.new(0, 10, 0.5, -20)
toggleButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.Font = Enum.Font.Gotham
toggleButton.TextSize = 14
toggleButton.Text = "Hide"

toggleButton.MouseButton1Click:Connect(function()
	mainFrame.Visible = not mainFrame.Visible
	toggleButton.Text = mainFrame.Visible and "Hide" or "Show"
end)

-- Create Category Function
local function createCategory(name, yPos)
	local categoryLabel = Instance.new("TextLabel", mainFrame)
	categoryLabel.Size = UDim2.new(0, 560, 0, 20)
	categoryLabel.Position = UDim2.new(0, 20, 0, yPos)
	categoryLabel.Text = name
	categoryLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
	categoryLabel.BackgroundTransparency = 1
	categoryLabel.Font = Enum.Font.GothamBold
	categoryLabel.TextSize = 16

	for i = 1, 5 do
		local button = Instance.new("TextButton", mainFrame)
		button.Size = UDim2.new(0, 130, 0, 30)
		button.Position = UDim2.new(0, 20 + ((i - 1) * 140), 0, yPos + 25)
		button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
		button.TextColor3 = Color3.fromRGB(255, 255, 255)
		button.Font = Enum.Font.Gotham
		button.TextSize = 14
		button.Text = name .. " ฟังก์ชัน " .. i
	end
end

-- Create 4 categories
createCategory("ทั่วไป", 50)
createCategory("ผู้เล่น", 120)
createCategory("ดันเจี้ยน", 190)
createCategory("วาร์ป", 260)
