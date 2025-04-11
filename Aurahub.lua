-- SETTINGS (สามารถปรับตามต้องการ)
getgenv().Shutdown = true
getgenv().Configs = {
    ["Team"] = "Marines",
    ["Gun Farm"] = false,
    ["FPS Boost"] = {
        ["Enable"] = true,
        ["FPS Cap"] = 30,
    },
    ["Farm Boss Drops"] = {
        ["Enable"] = false,
        ["When x2 Exp Expired"] = false
    },
    ["Hop"] = {
        ["Enable"] = true,
        ["Hop Find Tushita"] = true,
        ["Hop Find Valkyrie Helm"] = true,
        ["Hop Find Mirror Fractal"] = true
    },
    ["Farm Mastery"] = {
        ["Enable"] = true,
        ["Farm Mastery Weapons"] = {"Sword", "Gun", "Blox Fruit"},
        ["Swords To Farm"] = {"Cursed Dual Katana"},
        ["Guns To Farm"] = {"Skull Guitar"},
        ["Mastery Health (%)"] = 40
    },
    ["Auto Spawn rip_indra"] = true,
    ["Auto Spawn Dough King"] = true,
    ["Auto Pull Lever"] = true,
    ["Auto Collect Berry"] = false,
    ["Auto Evo Race"] = false,
    ["Awaken Fruit"] = false,
    ["Rainbow Haki"] = true,
    ["Hop Player Near"] = true,
    ["Skull Guitar"] = true,
    ["Find Fruit"] = true,
    ["Cursed Dual Katana"] = true,
    ["Switch Melee"] = true,
    ["Eat Fruit"] = "",
    ["Snipe Fruit"] = "",
    ["Lock Fragment"] = 0,
    ["Buy Stuffs"] = true
}

-- เริ่มระบบ GUI และฟาร์ม
repeat task.wait() until game:IsLoaded()
local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()

-- GUI
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "AuraHubUI"
gui.ResetOnSpawn = false

-- Main UI Frame
local mainFrame = Instance.new("Frame", gui)
mainFrame.Size = UDim2.new(0, 600, 0, 400)
mainFrame.Position = UDim2.new(0.5, -300, 0.5, -200)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Visible = true

-- Title
local title = Instance.new("TextLabel", mainFrame)
title.Size = UDim2.new(1, 0, 0, 30)
title.Position = UDim2.new(0, 0, 0, 0)
title.Text = "AURA HUB"
title.BackgroundTransparency = 1
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.GothamBold
title.TextSize = 20

-- Create button
local function createButton(text, posY, callback)
    local button = Instance.new("TextButton", mainFrame)
    button.Size = UDim2.new(0, 200, 0, 40)
    button.Position = UDim2.new(0, 20, 0, posY)
    button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    button.TextColor3 = Color3.new(1, 1, 1)
    button.Font = Enum.Font.Gotham
    button.TextSize = 16
    button.Text = text
    button.MouseButton1Click:Connect(callback)
end

-- AutoFarm Function
local function getNearestEnemy()
    local closest, dist = nil, math.huge
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            local mag = (char.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude
            if mag < dist then
                closest = v
                dist = mag
            end
        end
    end
    return closest
end

local autofarmRunning = false

local function startAutoFarm()
    if autofarmRunning then return end
    autofarmRunning = true
    task.spawn(function()
        while autofarmRunning and task.wait(0.2) do
            local target = getNearestEnemy()
            if target and char and char:FindFirstChild("HumanoidRootPart") then
                char.HumanoidRootPart.CFrame = target.HumanoidRootPart.CFrame * CFrame.new(0, 5, 2)
                mouse1click()
            end
        end
    end)
end

local function stopAutoFarm()
    autofarmRunning = false
end

-- UI Buttons
createButton("เริ่มฟาร์มเลเวล", 50, function()
    startAutoFarm()
end)

createButton("หยุดฟาร์ม", 100, function()
    stopAutoFarm()
end)

createButton("ปิด GUI", 150, function()
    mainFrame.Visible = false
end)

-- Toggle Button: AURA HUB
local toggleIcon = Instance.new("TextButton", gui)
toggleIcon.Size = UDim2.new(0, 120, 0, 40)
toggleIcon.Position = UDim2.new(0, 10, 0, 10)
toggleIcon.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
toggleIcon.Text = "AURA HUB"
toggleIcon.TextColor3 = Color3.new(1, 1, 1)
toggleIcon.Font = Enum.Font.GothamBold
toggleIcon.TextSize = 16
toggleIcon.AutoButtonColor = true
toggleIcon.Active = true
toggleIcon.Draggable = true

toggleIcon.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
end)
