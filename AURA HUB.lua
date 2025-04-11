
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

local function TweenToPosition(targetPos, speed)
	local char = LocalPlayer.Character
	if not char or not char:FindFirstChild("HumanoidRootPart") then return end
	local distance = (char.HumanoidRootPart.Position - targetPos).Magnitude
	local time = distance / speed
	local tween = TweenService:Create(char.HumanoidRootPart, TweenInfo.new(time, Enum.EasingStyle.Linear), {CFrame = CFrame.new(targetPos)})
	tween:Play()
	tween.Completed:Wait()
end

-- UI
local ScreenGui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
ScreenGui.Name = "AuraHub_UI"

local ToggleButton = Instance.new("TextButton")
ToggleButton.Size = UDim2.new(0, 50, 0, 50)
ToggleButton.Position = UDim2.new(0, 20, 0.5, -25)
ToggleButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.TextScaled = true
ToggleButton.Text = "AURA\nHUB"
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.Draggable = true
ToggleButton.Active = true
ToggleButton.Parent = ScreenGui

local UICorner = Instance.new("UICorner", ToggleButton)
UICorner.CornerRadius = UDim.new(1, 0)

local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 320, 0, 450)
MainFrame.Position = UDim2.new(0.5, -160, 0.5, -225)
MainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
MainFrame.Visible = false
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0.05, 0)

ToggleButton.MouseButton1Click:Connect(function()
	MainFrame.Visible = not MainFrame.Visible
end)

local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, 0, 0, 50)
Title.BackgroundTransparency = 1
Title.Text = "AuraHub - Arise Crossover"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextScaled = true

local AutoFarmToggle = Instance.new("TextButton", MainFrame)
AutoFarmToggle.Size = UDim2.new(0, 200, 0, 50)
AutoFarmToggle.Position = UDim2.new(0.5, -100, 0, 70)
AutoFarmToggle.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
AutoFarmToggle.Text = "Start Auto Farm"
AutoFarmToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoFarmToggle.Font = Enum.Font.Gotham
AutoFarmToggle.TextScaled = true

local movementMode = "Teleport"

local ModeLabel = Instance.new("TextLabel", MainFrame)
ModeLabel.Size = UDim2.new(0, 200, 0, 30)
ModeLabel.Position = UDim2.new(0.5, -100, 0, 140)
ModeLabel.BackgroundTransparency = 1
ModeLabel.Text = "Move Mode: Teleport"
ModeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
ModeLabel.Font = Enum.Font.Gotham
ModeLabel.TextScaled = true

local ModeButton = Instance.new("TextButton", MainFrame)
ModeButton.Size = UDim2.new(0, 200, 0, 40)
ModeButton.Position = UDim2.new(0.5, -100, 0, 175)
ModeButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
ModeButton.Text = "Change Mode"
ModeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ModeButton.Font = Enum.Font.Gotham
ModeButton.TextScaled = true

ModeButton.MouseButton1Click:Connect(function()
	if movementMode == "Teleport" then
		movementMode = "Walk"
	elseif movementMode == "Walk" then
		movementMode = "Run"
	else
		movementMode = "Teleport"
	end
	ModeLabel.Text = "Move Mode: " .. movementMode
end)

local farmEnabled = false
AutoFarmToggle.MouseButton1Click:Connect(function()
	farmEnabled = not farmEnabled
	AutoFarmToggle.Text = farmEnabled and "Stop Auto Farm" or "Start Auto Farm"
end)

spawn(function()
	while task.wait(0.1) do
		if farmEnabled then
			pcall(function()
				local enemies = workspace:FindFirstChild("Enemies") or workspace:FindFirstChild("Mobs")
				if enemies then
					local nearest
					local shortest = math.huge
					for _, mob in pairs(enemies:GetChildren()) do
						if mob:FindFirstChild("HumanoidRootPart") and mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 then
							local dist = (mob.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
							if dist < shortest then
								shortest = dist
								nearest = mob
							end
						end
					end
					if nearest then
						local pos = nearest.HumanoidRootPart.Position + Vector3.new(0, 5, 0)
						if movementMode == "Teleport" then
							LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(pos)
						elseif movementMode == "Walk" then
							TweenToPosition(pos, 75)
						elseif movementMode == "Run" then
							TweenToPosition(pos, 150)
						end
						wait(0.2)
						mouse1click()
					end
				end
			end)
		end
	end
end)
