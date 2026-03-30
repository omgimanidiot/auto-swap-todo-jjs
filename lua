-- ================================================
--   JJS | Todo Perfect Swap (Mobile) + Key System
--   Fixed: Key correct → Main script appears
-- ================================================

local Players    = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer

local correctKey = "ppocoxmsmakiwoqsksms"
local keyLink    = "https://link-hub.net/4473711/MTfE77G0aL7n"

local function notify(title, text)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = title,
            Text = text,
            Duration = 4
        })
    end)
end

-- ================== KEY SYSTEM GUI ==================
local keyGui = Instance.new("ScreenGui")
keyGui.Name = "KeySystem"
keyGui.ResetOnSpawn = false
keyGui.Parent = LocalPlayer.PlayerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 290, 0, 240)
frame.Position = UDim2.new(0.5, -145, 0.5, -120)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 35)
frame.BorderSizePixel = 0
frame.Parent = keyGui

local corner = Instance.new("UICorner", frame)
corner.CornerRadius = UDim.new(0, 14)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 50)
title.BackgroundTransparency = 1
title.Text = "TODO PERFECT SWAP"
title.TextColor3 = Color3.fromRGB(255, 200, 200)
title.Font = Enum.Font.GothamBlack
title.TextSize = 24
title.Parent = frame

local keyLabel = Instance.new("TextLabel")
keyLabel.Size = UDim2.new(1, -20, 0, 30)
keyLabel.Position = UDim2.new(0, 10, 0, 65)
keyLabel.BackgroundTransparency = 1
keyLabel.Text = "Enter Lifetime Key"
keyLabel.TextColor3 = Color3.fromRGB(180, 180, 255)
keyLabel.Font = Enum.Font.Gotham
keyLabel.TextSize = 16
keyLabel.Parent = frame

local keyBox = Instance.new("TextBox")
keyBox.Size = UDim2.new(1, -20, 0, 45)
keyBox.Position = UDim2.new(0, 10, 0, 100)
keyBox.BackgroundColor3 = Color3.fromRGB(35, 35, 55)
keyBox.PlaceholderText = "Paste key here..."
keyBox.Text = ""
keyBox.TextColor3 = Color3.new(1,1,1)
keyBox.Font = Enum.Font.Gotham
keyBox.TextSize = 17
keyBox.Parent = frame
Instance.new("UICorner", keyBox).CornerRadius = UDim.new(0, 8)

local submitBtn = Instance.new("TextButton")
submitBtn.Size = UDim2.new(0.48, 0, 0, 45)
submitBtn.Position = UDim2.new(0.02, 0, 0, 155)
submitBtn.BackgroundColor3 = Color3.fromRGB(40, 160, 40)
submitBtn.Text = "SUBMIT KEY"
submitBtn.TextColor3 = Color3.new(1,1,1)
submitBtn.Font = Enum.Font.GothamBold
submitBtn.TextSize = 16
submitBtn.Parent = frame
Instance.new("UICorner", submitBtn).CornerRadius = UDim.new(0, 8)

local getKeyBtn = Instance.new("TextButton")
getKeyBtn.Size = UDim2.new(0.48, 0, 0, 45)
getKeyBtn.Position = UDim2.new(0.5, 0, 0, 155)
getKeyBtn.BackgroundColor3 = Color3.fromRGB(60, 100, 200)
getKeyBtn.Text = "GET KEY"
getKeyBtn.TextColor3 = Color3.new(1,1,1)
getKeyBtn.Font = Enum.Font.GothamBold
getKeyBtn.TextSize = 16
getKeyBtn.Parent = frame
Instance.new("UICorner", getKeyBtn).CornerRadius = UDim.new(0, 8)

-- Submit Key Function
submitBtn.MouseButton1Click:Connect(function()
    if keyBox.Text == correctKey then
        notify("✅ Success!", "Key is correct! Loading Perfect Swap...")
        keyGui:Destroy()
        task.wait(0.5)
        loadMainScript()   -- Load main script after correct key
    else
        notify("❌ Wrong Key!", "Please get the correct key")
    end
end)

-- Get Key Button
getKeyBtn.MouseButton1Click:Connect(function()
    setclipboard(keyLink)
    notify("🔗 Link Copied!", "Open your browser and paste the link.\nIt may take 5-10 seconds.")
end)

print("Key System Loaded - Enter the key to continue")

-- ================== MAIN PERFECT SWAP SCRIPT ==================
function loadMainScript()
    local enabled = false
    local canFire = true

    local RE = game:GetService("ReplicatedStorage")
        :WaitForChild("Knit")
        :WaitForChild("Knit")
        :WaitForChild("Services")
        :WaitForChild("TodoService")
        :WaitForChild("RE")

    local RightActivated = RE:WaitForChild("RightActivated")
    local Activated      = RE:WaitForChild("Activated")

    local mt = getrawmetatable(game)
    local old_nc = mt.__namecall
    setreadonly(mt, false)

    mt.__namecall = newcclosure(function(self, ...)
        local method = getnamecallmethod()

        if enabled and method == "FireServer" and self == RightActivated then
            local result = old_nc(self, ...)

            if canFire then
                canFire = false
                task.spawn(function()
                    task.wait(0.52)
                    Activated:FireServer(false)
                    print("[Todo] Perfect Swap M1 fired after 0.52s!")
                    task.wait(0.15)
                    canFire = true
                end)
            end
            return result
        end

        return old_nc(self, ...)
    end)

    setreadonly(mt, true)

    -- Main GUI
    local sg = Instance.new("ScreenGui")
    sg.Name = "TodoGui"
    sg.ResetOnSpawn = false
    sg.Parent = LocalPlayer.PlayerGui

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 220, 0, 90)
    frame.Position = UDim2.new(0.5, -110, 1, -170)
    frame.BackgroundColor3 = Color3.fromRGB(8, 8, 14)
    frame.Active = true
    frame.Draggable = true
    frame.Parent = sg
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 14)

    local bdr = Instance.new("UIStroke")
    bdr.Thickness = 2
    bdr.Color = Color3.fromRGB(80, 50, 200)
    bdr.Parent = frame

    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1, 0, 0, 26)
    lbl.Position = UDim2.new(0, 0, 0, 5)
    lbl.BackgroundTransparency = 1
    lbl.Text = "⚡ Todo Perfect Swap"
    lbl.TextColor3 = Color3.fromRGB(200, 180, 255)
    lbl.Font = Enum.Font.GothamBold
    lbl.TextSize = 13
    lbl.Parent = frame

    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -16, 0, 50)
    btn.Position = UDim2.new(0, 8, 0, 32)
    btn.BackgroundColor3 = Color3.fromRGB(55, 30, 150)
    btn.Text = "TAP TO ENABLE ❌"
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 16
    btn.Parent = frame
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 10)

    local function refresh()
        if enabled then
            btn.BackgroundColor3 = Color3.fromRGB(18, 145, 45)
            btn.Text = "PERFECT SWAP: ON ✅"
        else
            btn.BackgroundColor3 = Color3.fromRGB(55, 30, 150)
            btn.Text = "TAP TO ENABLE ❌"
        end
    end

    btn.MouseButton1Click:Connect(function()
        enabled = not enabled
        refresh()
    end)

    refresh()
    notify("✅ Perfect Swap Activated", "Delay 0.52s - Swap normally!")
end
