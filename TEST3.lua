pcall(function()
    -- Anti Crack: ตรวจชื่อ Exploit ที่รู้จัก
    local exploit = identifyexecutor and identifyexecutor() or "Unknown"
    local badExecutors = { "Synapse", "KRNL", "Oxygen", "Electron", "Dansploit" }
    for _, v in pairs(badExecutors) do
        if string.find(string.lower(exploit), string.lower(v)) then
            while true do end -- Freeze ถ้าเจอ
        end
    end
end)

-- Obfuscated GUI Name
local _ENV = getfenv()
local g = game
local p = g.Players.LocalPlayer
local gui = Instance.new("ScreenGui", p:WaitForChild("PlayerGui"))
gui.Name = ("AUR" .. "A" .. "HUB" .. tostring(math.random(1000,9999)))
gui.ResetOnSpawn = false

-- Main Frame
local f = Instance.new("Frame", gui)
f.Size = UDim2.new(0, 600, 0, 400)
f.Position = UDim2.new(0.5, -300, 0.5, -200)
f.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
f.BorderSizePixel = 0

-- Title
local t = Instance.new("TextLabel", f)
t.Size = UDim2.new(0, 200, 0, 30)
t.Position = UDim2.new(1, -210, 0, 10)
t.Text = "AURA HUB"
t.TextColor3 = Color3.fromRGB(255, 255, 255)
t.BackgroundTransparency = 1
t.TextXAlignment = Enum.TextXAlignment.Right
t.Font = Enum.Font.GothamBold
t.TextSize = 20

-- ฟังก์ชันสร้างหมวดหมู่
local function c(n, y)
    local l = Instance.new("TextLabel", f)
    l.Size = UDim2.new(0, 560, 0, 20)
    l.Position = UDim2.new(0, 20, 0, y)
    l.Text = n
    l.TextColor3 = Color3.fromRGB(200, 200, 200)
    l.BackgroundTransparency = 1
    l.Font = Enum.Font.GothamBold
    l.TextSize = 16

    for i = 1, 5 do
        local b = Instance.new("TextButton", f)
        b.Size = UDim2.new(0, 130, 0, 30)
        b.Position = UDim2.new(0, 20 + ((i - 1) * 140), 0, y + 25)
        b.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        b.TextColor3 = Color3.fromRGB(255, 255, 255)
        b.Font = Enum.Font.Gotham
        b.TextSize = 14
        b.Text = n .. " Function " .. i
    end
end

-- หมวดหมู่
c("ทั่วไป 1", 50)
c("ผู้เล่น 2", 120)
c("ดันเจี้ยน 3", 190)
c("วาป 4", 260)
