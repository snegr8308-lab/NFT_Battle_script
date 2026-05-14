local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "NFT battle script",
   LoadingTitle = "Loading...",
   LoadingSubtitle = "by bELKAopex",
   ConfigurationSaving = { Enabled = false },
   KeySystem = false
})

local autoSellEnabled = false
local sellInterval = 5

-- Tabs
local MainTab = Window:CreateTab("Main Settings", "settings")
local TrashTab = Window:CreateTab("Trash Case", "package")
local BeggarTab = Window:CreateTab("Beggar Case", "package")
local PlodderTab = Window:CreateTab("Plodder Case", "package")
local OfficeTab = Window:CreateTab("Office Clerk", "package")
local ManagerTab = Window:CreateTab("Manager", "package")
local GoldTab = Window:CreateTab("Gold", "star")
local FrozenTab = Window:CreateTab("Frozen Heart", "star")
local BubbleTab = Window:CreateTab("Bubble Gum", "star")
local CatsTab = Window:CreateTab("Cats", "star")
local GlitchTab = Window:CreateTab("Glitch", "star")
local DreamTab = Window:CreateTab("Dream", "star")
local BloodyTab = Window:CreateTab("Bloody Night", "star")
local NinjaTab = Window:CreateTab("Ninja Turtles", "star")
local DeskTab = Window:CreateTab("Desk Calendars", "star")
local M5Tab = Window:CreateTab("M5 F90", "car")
local G63Tab = Window:CreateTab("G63", "car")
local PorscheTab = Window:CreateTab("Porsche 911", "car")
local UrusTab = Window:CreateTab("URUS", "car")
local CyberTab = Window:CreateTab("Cyber", "car")

local CreditsTab = Window:CreateTab("Credits", "info")

local function ServerSell()
    local args = {
        "Sell",
        "ALL",
        false
    }
    pcall(function()
        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Inventory"):FireServer(unpack(args))
    end)
end

-- Функция открытия кейсов
local function StartFarm(caseName, iterations)
    local count = 0
    while count < iterations do
        local openArgs = { caseName, 10 }
        
        pcall(function()
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("OpenCase"):InvokeServer(unpack(openArgs))
        end)
        
        if not autoSellEnabled then
            ServerSell()
        end
        
        task.wait(1)
        count = count + 1
    end
end

task.spawn(function()
    while true do
        if autoSellEnabled then
            ServerSell()
        end
        task.wait(sellInterval)
    end
end)

-- Auto Sell
MainTab:CreateToggle({
   Name = "Auto Sell",
   CurrentValue = false,
   Callback = function(Value)
      autoSellEnabled = Value
   end,
})

MainTab:CreateSlider({
   Name = "Sell Interval",
   Range = {1, 30},
   Increment = 1,
   Suffix = "s",
   CurrentValue = 5,
   Callback = function(Value) sellInterval = Value end,
})

MainTab:CreateButton({
   Name = "Destroy GUI",
   Callback = function() Rayfield:Destroy() end,
})

-- Open cases settings
local function AddFarmButtons(tab, caseInternalName)
    local amounts = {
        {Name = "Farm 10B Cases", Val = 1000000000},
        {Name = "Farm 100K Cases", Val = 10000},
        {Name = "Farm 10K Cases", Val = 1000},
        {Name = "Farm 1K Cases", Val = 100},
        {Name = "Farm 100 Cases", Val = 10},
        {Name = "Farm 10 Cases", Val = 1}
    }
    for _, data in ipairs(amounts) do
        tab:CreateButton({
            Name = data.Name,
            Callback = function()
                task.spawn(function() StartFarm(caseInternalName, data.Val) end)
            end,
        })
    end
end

-- Buttons
AddFarmButtons(TrashTab, "Trash")
AddFarmButtons(BeggarTab, "Beggar")
AddFarmButtons(PlodderTab, "Plodder")
AddFarmButtons(OfficeTab, "Office Clerk")
AddFarmButtons(ManagerTab, "Manager")
AddFarmButtons(GoldTab, "Gold") -- Кнопки для кейса Gold
AddFarmButtons(FrozenTab, "Frozen Heart")
AddFarmButtons(BubbleTab, "Bubble Gum")
AddFarmButtons(CatsTab, "Cats")
AddFarmButtons(GlitchTab, "Glitch")
AddFarmButtons(DreamTab, "Dream")
AddFarmButtons(BloodyTab, "Bloody Night")
AddFarmButtons(NinjaTab, "Ninja Turtles")
AddFarmButtons(DeskTab, "Desk Calendars")
AddFarmButtons(M5Tab, "M5 F90")
AddFarmButtons(G63Tab, "G63")
AddFarmButtons(PorscheTab, "Porsche 911")
AddFarmButtons(UrusTab, "URUS")
AddFarmButtons(CyberTab, "Cyber")

CreditsTab:CreateButton({
   Name = "Git Hub",
   Callback = function()
       setclipboard("https://github.com/snegr8308-lab/NFT_Battle_script/tree/main")
       Rayfield:Notify({Title = "Copied", Content = "GitHub link copied to clipboard!", Duration = 5})
   end,
})

Rayfield:Notify({Title = "Success", Content = "Thanks for using♥️", Duration = 3})
-- YOU CAN GET BAN FOR THIS SCRIPT 
-- USE THIS ON YOUR OWN RISK
