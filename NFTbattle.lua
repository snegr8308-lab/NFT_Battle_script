local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Case Autofarm Hub",
   LoadingTitle = "Loading Interface...",
   LoadingSubtitle = "by Gemini Edit",
   ConfigurationSaving = { Enabled = false },
   KeySystem = false
})

-- Tabs
local MainTab = Window:CreateTab("Main Settings", "settings")
local TrashTab = Window:CreateTab("Trash Case", "package")
local BeggarTab = Window:CreateTab("Beggar Case", "package")
local PlodderTab = Window:CreateTab("Plodder Case", "package")
local OfficeTab = Window:CreateTab("Office Clerk", "package")
local ManagerTab = Window:CreateTab("Manager", "package")

-- Новые вкладки для CARS CASES (Screenshot_2026-05-13-12-01-34-580_com.roblox.client_2.jpg)
local M5Tab = Window:CreateTab("M5 F90", "car")
local G63Tab = Window:CreateTab("G63", "car")
local PorscheTab = Window:CreateTab("Porsche 911", "car")
local UrusTab = Window:CreateTab("URUS", "car")
local CyberTab = Window:CreateTab("Cyber", "car")

-- Global Farm Function
local function StartFarm(caseName, iterations)
    local count = 0
    while count < iterations do
        -- Open 10 cases
        local openArgs = { caseName, 10 }
        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("OpenCase"):InvokeServer(unpack(openArgs))
        
        -- Sell All
        local sellArgs = { "Sell", "ALL" }
        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Inventory"):FireServer(unpack(sellArgs))
        
        task.wait(1)
        count = count + 1
    end
    
    Rayfield:Notify({
        Title = "Farm Finished",
        Content = "Completed " .. (iterations * 10) .. " cases of " .. caseName,
        Duration = 5
    })
end

-- Helper to create buttons
local function AddFarmButtons(tab, caseInternalName)
    local amounts = {
        {Name = "Farm 1M Cases", Val = 100000},
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

-- Setup Buttons for original tabs
AddFarmButtons(TrashTab, "Trash")
AddFarmButtons(BeggarTab, "Beggar")
AddFarmButtons(PlodderTab, "Plodder")
AddFarmButtons(OfficeTab, "Office Clerk")
AddFarmButtons(ManagerTab, "Manager")

-- Setup Buttons for CARS CASES tabs (Screenshot_2026-05-13-12-01-34-580_com.roblox.client_2.jpg)
AddFarmButtons(M5Tab, "M5 F90")
AddFarmButtons(G63Tab, "G63")
AddFarmButtons(PorscheTab, "Porsche 911")
AddFarmButtons(UrusTab, "URUS")
AddFarmButtons(CyberTab, "Cyber")

-- Main Settings Buttons
MainTab:CreateButton({
   Name = "Destroy GUI",
   Callback = function()
       Rayfield:Destroy()
   end,
})

Rayfield:Notify({
   Title = "Success",
   Content = "Script Loaded Successfully",
   Duration = 3,
})

