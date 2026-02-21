wait(1.2)
game.StarterGui:SetCore("SendNotification", {
Title = "Char's GoBack TP Menu"; -- 
Text = "Love lots ur baybay"; -- 
Icon = ""; --  
Duration = 5; -- 
})

-- 
local gui = Instance.new("ScreenGui")
gui.Parent = game.Players.LocalPlayer.PlayerGui

-- 
local frame = Instance.new("Frame")
frame.Parent = gui
frame.Size = UDim2.new(0, 200, 0, 150)
frame.Position = UDim2.new(0, 50, 0, 50)
frame.BackgroundTransparency = 0.9
frame.BackgroundColor3 = Color3.new(146, 0, 142)
frame.Active = true
frame.Draggable = true -- 

-- 
local saveButton = Instance.new("TextButton")
saveButton.Parent = frame
saveButton.Size = UDim2.new(0, 150, 0, 30)
saveButton.Position = UDim2.new(0, 25, 0, 20)
saveButton.Text = "Save CharSpot"

local teleportButton = Instance.new("TextButton")
teleportButton.Parent = frame
teleportButton.Size = UDim2.new(0, 150, 0, 30)
teleportButton.Position = UDim2.new(0, 25, 0, 60)
teleportButton.Text = "Teleport to CharsSpot"

local pauseButton = Instance.new("TextButton")
pauseButton.Parent = frame
pauseButton.Size = UDim2.new(0, 150, 0, 30)
pauseButton.Position = UDim2.new(0, 25, 0, 100)
pauseButton.Text = "Pause Loop"

local hideButton = Instance.new("TextButton")
hideButton.Parent = frame
hideButton.Size = UDim2.new(0, 25, 0, 25)
hideButton.Position = UDim2.new(1, -30, 0, 5)
hideButton.Text = "-"

-- 
local savedPosition = nil
local loopPaused = false

-- 
local function saveCoordinates()
    local player = game.Players.LocalPlayer
    local character = player.Character
    local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
    if humanoidRootPart then
        savedPosition = humanoidRootPart.Position
        print("Coordinates saved:", savedPosition)
    end
end

-- 
local function teleportToCoordinates()
    if savedPosition then
        local player = game.Players.LocalPlayer
        local character = player.Character
        local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
        if humanoidRootPart then
            humanoidRootPart.CFrame = CFrame.new(savedPosition)
        end
    end
end

-- 
local function toggleLoop()
    loopPaused = not loopPaused
    if loopPaused then
        pauseButton.Text = "Resume Loop"
    else
        pauseButton.Text = "Pause Loop"
    end
end

-- 
local function toggleGuiVisibility()
    frame.Visible = not frame.Visible
    if frame.Visible then
        hideButton.Text = "-"
    else
        hideButton.Text = "+"
    end
end

-- 
saveButton.MouseButton1Click:Connect(saveCoordinates)
teleportButton.MouseButton1Click:Connect(teleportToCoordinates)
pauseButton.MouseButton1Click:Connect(toggleLoop)
hideButton.MouseButton1Click:Connect(toggleGuiVisibility)

-- 
while true do
	wait(3.2)
	if not loopPaused and savedPosition then
		teleportToCoordinates()
	end
end