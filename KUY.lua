-- ตั้งค่าก่อนโหลด RoHub
_G.settings = {
    autoLoadConfig = false, -- โหลดค่าต่าง ๆ อัตโนมัติ
    joinTeam = "Pirates" -- เลือกทีม: "Pirates" หรือ "Marines"
}

-- เปิดหรือปิดระบบแปลภาษาไทย
_G.AutoTranslateUI = true

-- ตารางคำศัพท์ที่จะแปล
local TranslateTable = {
    ["Start"] = "เริ่ม",
    ["Stop"] = "หยุด",
    ["Auto Farm"] = "ฟาร์มอัตโนมัติ",
    ["Auto Quest"] = "รับภารกิจอัตโนมัติ",
    ["Fast Attack"] = "โจมตีเร็ว",
    ["Level"] = "เลเวล",
    ["Health"] = "พลังชีวิต",
    ["Defense"] = "ป้องกัน",
    ["Melee"] = "หมัด",
    ["Sword"] = "ดาบ",
    ["Gun"] = "ปืน",
    ["Blox Fruit"] = "ผลปีศาจ",
    ["Teleport"] = "วาร์ป",
    ["Island"] = "เกาะ",
    ["Weapon"] = "อาวุธ",
    ["Boss"] = "บอส",
    ["Enable"] = "เปิด",
    ["Disable"] = "ปิด",
    ["Select"] = "เลือก",
    ["Settings"] = "ตั้งค่า",
    ["Close"] = "ปิด",
    ["Open"] = "เปิด",
    ["Quest"] = "ภารกิจ",
    ["Safe Mode"] = "โหมดปลอดภัย",
    ["Stats"] = "ค่าสเตตัส",
    ["Farm"] = "ฟาร์ม",
    ["Auto"] = "อัตโนมัติ",
    ["Kill"] = "สังหาร"
}

-- ฟังก์ชันแปล UI เป็นภาษาไทย
local function TranslateToThai()
    if not _G.AutoTranslateUI then return end
    for _, gui in ipairs(game:GetDescendants()) do
        if gui:IsA("TextLabel") or gui:IsA("TextButton") or gui:IsA("TextBox") then
            local originalText = gui.Text
            if TranslateTable[originalText] then
                gui.Text = TranslateTable[originalText]
            end
        end
    end
end

-- แปลอัตโนมัติทุก 1 วินาที
task.spawn(function()
    while true do
        pcall(TranslateToThai)
        wait(1)
    end
end)

-- โหลดสคริปต์หลักของ RoHub
loadstring(game:HttpGet("https://raw.githubusercontent.com/RO-HUB-CODEX/RO-HUB/refs/heads/main/bloxfruits.lua"))()
