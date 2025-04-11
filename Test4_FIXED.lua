-- AuraHubUI - เวอร์ชันทดสอบพร้อมปุ่มทำงานจริง

local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "AuraHubUI"
gui.ResetOnSpawn = false

local mainFrame = Instance.new("Frame", gui)
mainFrame.Size = UDim2.new(0, 600, 0, 400)
mainFrame.Position = UDim2.new(0.5, -300, 0.5, -200)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.Active = true
mainFrame.Draggable = true

local title = Instance.new("TextLabel", mainFrame)
title.Size = UDim2.new(1, 0, 0, 30)
title.Position = UDim2.new(0, 0, 0, 0)
title.Text = "AURA HUB"
title.BackgroundTransparency = 1
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.GothamBold
title.TextSize = 20

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

-- ปุ่มทดสอบแต่ละหมวด
createButton("ฟาร์มเลเวล", 50, function()
    print("เริ่มฟาร์มเลเวลแล้ว...")
end)

createButton("หาบอส", 100, function()
    print("กำลังค้นหาบอสในแผนที่...")
end)

createButton("เก็บผลไม้", 150, function()
    print("กำลังเก็บผลไม้หายาก...")
end)

createButton("วาร์ปไปเกาะต่อไป", 200, function()
    print("วาร์ปแล้ว!")
end)

createButton("ปิด GUI", 250, function()
    gui:Destroy()
end)

-- ปุ่ม Toggle ซ้ายล่างหน้าจอ
local toggle = Instance.new("TextButton", gui)
toggle.Size = UDim2.new(0, 80, 0, 30)
toggle.Position = UDim2.new(0, 10, 1, -40)
toggle.Text = "Close"
toggle.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
toggle.TextColor3 = Color3.new(1, 1, 1)
toggle.Font = Enum.Font.GothamBold
toggle.TextSize = 14

toggle.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
    toggle.Text = mainFrame.Visible and "Close" or "Open"
end)
