-- สร้าง ScreenGui
local gui = Instance.new("ScreenGui", game.Players.LocalPlayer:WaitForChild("PlayerGui"))
gui.Name = "AuraHubUI"
gui.ResetOnSpawn = false

-- พื้นหลัง
local mainFrame = Instance.new("Frame", gui)
mainFrame.Size = UDim2.new(0, 600, 0, 400)
mainFrame.Position = UDim2.new(0.5, -300, 0.5, -200)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BorderSizePixel = 0

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
		local button = Instance.new("textbutton ", mainFrame)
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
createCategory("ทั่วไป 1", 50)
createCategory("ผู้เล่น 2", 120)
createCategory("ดันเจี้ยน 3", 190)
createCategory("วาป 4", 260)
