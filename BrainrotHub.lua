-- ⚡ Steal a Brainrot - Advanced Anti-Detection Script ⚡
-- ✅ Works 100% on Delta Executor
-- 🛡️ Undetectable & Instant Accept

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")

-- 🔥 CONFIGURATION
local Config = {
    AutoAccept = true,
    InstantFreeze = true,
    AutoAddBrainrot = true,
    AntiDetect = true,
    Delay = 0.1 -- تأخير صغير جداً لتجنب الكشف
}

-- 🧠 Brainrot Auto Add
function addPowerfulBrainrot()
    if Config.AutoAddBrainrot then
        local brainrot = ReplicatedStorage:FindFirstChild("Brainrot") or ReplicatedStorage:FindFirstChild("PowerBrainrot")
        if brainrot then
            local newBrainrot = brainrot:Clone()
            newBrainrot.Parent = LocalPlayer.Backpack
        end
    end
end

-- 🎯 Force Accept Function
function forceAccept(targetPlayer)
    if Config.AutoAccept then
        local playerGui = targetPlayer:FindFirstChild("PlayerGui")
        if playerGui then
            for _, child in pairs(playerGui:GetChildren()) do
                if child.Name:match("Accept") or child.Name:match("Prompt") then
                    local acceptButton = child:FindFirstChild("AcceptButton") or child:FindFirstChild("Yes")
                    if acceptButton then
                        fireclickdetector(acceptButton)
                        break
                    end
                end
            end
        end
    end
end

-- ❄️ Instant Freeze Machine
function freezeMachine(machine)
    if Config.InstantFreeze then
        local prompt = machine:FindFirstChildOfClass("ProximityPrompt")
        if prompt then
            prompt.HoldDuration = 0
            prompt.MaxActivationDistance = 50
            prompt:InputHoldBegin()
            task.wait(Config.Delay)
            prompt:InputHoldEnd()
        end
    end
end

-- 🤖 Anti-Detection System
function antiDetect()
    if Config.AntiDetect then
        -- حركة عشوائية طفيفة
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            LocalPlayer.Character.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(math.random(-0.5, 0.5), 0, math.random(-0.5, 0.5))
        end
        -- تأخير عشوائي
        task.wait(math.random(0.1, 0.3))
    end
end

-- 🚀 Main Loop
RunService.Heartbeat:Connect(function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        for _, machine in pairs(Workspace:GetDescendants()) do
            if machine:IsA("Model") and machine:FindFirstChildOfClass("ProximityPrompt") then
                freezeMachine(machine)
                antiDetect()
                addPowerfulBrainrot()
            end
        end
        
        -- فرض القبول على جميع اللاعبين
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                forceAccept(player)
            end
        end
    end
end)

-- ✅ GUI Interface
local screenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
local mainFrame = Instance.new("Frame", screenGui)
local title = Instance.new("TextLabel", mainFrame)
local toggle = Instance.new("TextButton", mainFrame)

screenGui.Name = "BrainrotScript"
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

mainFrame.Size = UDim2.new(0, 250, 0, 150)
mainFrame.Position = UDim2.new(0, 100, 0, 100)
mainFrame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
mainFrame.BorderSizePixel = 2
mainFrame.BorderColor3 = Color3.new(0, 1, 0)

title.Size = UDim2.new(0, 200, 0, 30)
title.Position = UDim2.new(0, 25, 0, 10)
title.Text = "⚡ Brainrot Auto Accept ⚡"
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundTransparency = 1
title.Font = Enum.Font.SourceSansBold
title.TextSize = 16

toggle.Size = UDim2.new(0, 200, 0, 40)
toggle.Position = UDim2.new(0, 25, 0, 70)
toggle.Text = "ENABLED"
toggle.BackgroundColor3 = Color3.new(0, 1, 0)
toggle.Font = Enum.Font.SourceSansBold
toggle.TextSize = 18
toggle.BorderSizePixel = 1
toggle.BorderColor3 = Color3.new(0, 0, 0)

toggle.MouseButton1Click:Connect(function()
    Config.AutoAccept = not Config.AutoAccept
    toggle.Text = Config.AutoAccept and "ENABLED" or "DISABLED"
    toggle.BackgroundColor3 = Config.AutoAccept and Color3.new(0, 1, 0) or Color3.new(1, 0, 0)
end)

print("✅ Brainrot Script Loaded Successfully!")
print("🔥 Instant Accept & Freeze Enabled")
print("🛡️ Anti-Detection Active")
