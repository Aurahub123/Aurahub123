-- สร้าง ScreenGui
local gui = Instance.new("ScreenGui", game.Players.LocalPlayer:WaitForChild("PlayerGui"))
gui.Name = "AuraHubUI"
gui.ResetOnSpawn = false

-- พื้นหลังหลักของ UI
local mainFrame = Instance.new("Frame", gui)
mainFrame.Size = UDim2.new(0, 600, 0, 400)
mainFrame.Position = UDim2.new(0.5, -300, 0.5, -200)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BorderSizePixel = 0
mainFrame.Visible = false

-- ชื่อ AURA HUB มุมขวาบน
local title = Instance.new("TextLabel", mainFrame)
title.Size = UDim2.new(0, 200, 0, 30)
title.Position = UDim2.new(1, -210, 0, 10)
title.Text = "AURA HUB"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1
title.TextXAlignment = Enum.TextXAlignment.Right
title.Font = Enum.Font.GothamBold
title.TextSize = 20

-- ฟังก์ชันสร้างหมวดหมู่
local function createCategory(name, yPos)
    local categoryLabel = Instance.new("TextLabel", mainFrame)
    categoryLabel.Size = UDim2.new(0, 560, 0, 20)
    categoryLabel.Position = UDim2.new(0, 20, 0, yPos)
    categoryLabel.Text = name
    categoryLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    categoryLabel.BackgroundTransparency = 1
    categoryLabel.Font = Enum.Font.GothamBold
    categoryLabel.TextSize = 16

    -- สร้าง 5 ปุ่มในแต่ละหมวดหมู่
    for i = 1, 5 do
        local button = Instance.new("TextButton", mainFrame)
        button.Size = UDim2.new(0, 130, 0, 30)
        button.Position = UDim2.new(0, 20 + ((i-1) * 140), 0, yPos + 25)
        button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        button.Font = Enum.Font.Gotham
        button.TextSize = 14
        button.Text = name .. " Function " .. i
    end
end

-- สร้าง 4 หมวดหมู่ (สามารถเปลี่ยนชื่อได้)
createCategory("ทั่วไป", 50)
createCategory("ผู้เล่น", 120)
createCategory("ดันเจี้ยน", 190)
createCategory("วาร์ป", 260)

-- ปุ่มเปิด/ปิด UI
local toggleButton = Instance.new("TextButton", gui)
toggleButton.Size = UDim2.new(0, 40, 0, 40)
toggleButton.Position = UDim2.new(0, 10, 0.5, -20)
toggleButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.Font = Enum.Font.Gotham
toggleButton.TextSize = 14
toggleButton.Text = "Open"
toggleButton.Visible = true

-- ฟังก์ชันเปิดปิด UI
toggleButton.MouseButton1Click:Connect(function()
    if mainFrame.Visible then
        mainFrame.Visible = false
        toggleButton.Text = "Open"
    else
        mainFrame.Visible = true
        toggleButton.Text = "Close"
    end
end)

-- ทำให้สามารถเลื่อน UI ได้
local dragging = false
local dragStart, startPos

mainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
    end
end)

mainFrame.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if dragging then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- โค้ดสำหรับฟังก์ชันของบล็อคฟุต (ฟาร์ม, สถานะต่างๆ)
getgenv().Configs = {
    ["Team"] = "Marines",
    ["Gun Farm"] = false, -- Fast farm level, but farming melee is slow
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
        ["Farm Mastery Weapons"] = {"Sword", "Gun", "Blox Fruit"}, -- Blox Fruit, Gun (left -> right: High -> Low Priority)
        ["Swords To Farm"] = {"Cursed Dual Katana"},
        ["Guns To Farm"] = {"Skull Guitar"},
        ["Mastery Health (%)"] = 40 -- For Blox Fruit, Gun
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
    ["Find Fruit"] = true, -- Will find 1m+ fruit to unlock swan door to access third sea
    ["Cursed Dual Katana"] = true,
    ["Switch Melee"] = true,
    ["Eat Fruit"] = "", -- leave blank for none, put the fruit name like this example: Smoke Fruit, T-Rex Fruit, ...
    ["Snipe Fruit"] = "", -- leave blank for none, put the fruit name like this example: Smoke Fruit, T-Rex Fruit, ...
    ["Lock Fragment"] = 0,
    ["Buy Stuffs"] = true -- buso, geppo, soru, ken haki, ...
}

repeat
    task.wait()
    pcall(function()
        -- (ใส่โค้ดที่ต้องการทำงานในที่นี้)
    end)
until not getgenv().Configs["Shutdown"] -- เช็คการหยุดการทำงาน
