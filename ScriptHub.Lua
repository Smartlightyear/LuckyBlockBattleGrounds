local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/Smartlightyear/GoogleUI/refs/heads/main/Orion.Lua')))()
local Window = OrionLib:MakeWindow({Name = "Lucky Blocks Battlegrounds", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

-- Anti-AFK
local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
    vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    wait(1)
    vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

-- Main Tab
local MainTab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Block Amount Input
local blockAmount = 1
MainTab:AddTextbox({
    Name = "Block Amount",
    Default = "1",
    TextDisappear = false,
    Callback = function(Value)
        blockAmount = tonumber(Value) or 1
    end
})

-- Block Spawn Buttons
MainTab:AddButton({
    Name = "Spawn Lucky Block",
    Callback = function()
        for i=1, blockAmount do
            game.ReplicatedStorage.SpawnLuckyBlock:FireServer()
        end
    end
})

MainTab:AddButton({
    Name = "Spawn Super Block",
    Callback = function()
        for i=1, blockAmount do
            game.ReplicatedStorage.SpawnSuperBlock:FireServer()
        end
    end
})

MainTab:AddButton({
    Name = "Spawn Diamond Block",
    Callback = function()
        for i=1, blockAmount do
            game.ReplicatedStorage.SpawnDiamondBlock:FireServer()
        end
    end
})

MainTab:AddButton({
    Name = "Spawn Rainbow Block",
    Callback = function()
        for i=1, blockAmount do
            game.ReplicatedStorage.SpawnRainbowBlock:FireServer()
        end
    end
})

MainTab:AddButton({
    Name = "Spawn Galaxy Block",
    Callback = function()
        for i=1, blockAmount do
            game.ReplicatedStorage.SpawnGalaxyBlock:FireServer()
        end
    end
})

-- Discord Section
local DiscordTab = Window:MakeTab({
    Name = "Discord",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

DiscordTab:AddLabel("Join our Discord for more scripts!")

DiscordTab:AddButton({
    Name = "Copy Discord Invite",
    Callback = function()
        setclipboard("https://discord.gg/v7PDxkhqWt")
        OrionLib:MakeNotification({
            Name = "Success!",
            Content = "Discord invite copied to clipboard!",
            Image = "rbxassetid://4483345998",
            Time = 5
        })
    end
})

OrionLib:Init()
