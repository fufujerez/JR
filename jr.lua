local Player = game.Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")
local UserInputService = game:GetService("UserInputService")

-- 1. Create the UI Elements
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")
local Title = Instance.new("TextLabel")

ScreenGui.Name = "XenoWaypointMenu"
ScreenGui.Parent = PlayerGui
ScreenGui.ResetOnSpawn = false

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
MainFrame.Position = UDim2.new(0.1, 0, 0.4, 0)
MainFrame.Size = UDim2.new(0, 150, 0, 250)
MainFrame.Active = true
MainFrame.Draggable = true -- Simple dragging for executors

Title.Parent = MainFrame
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Title.Text = "XENO MENU"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.TextSize = 14

UIListLayout.Parent = MainFrame
UIListLayout.Padding = UDim.new(0, 5)
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

-- 2. Variables for Waypoint
local savedWaypoint = nil

-- 3. Function to create buttons easily
local function createButton(name, text, color, callback)
    local btn = Instance.new("TextButton")
    btn.Name = name
    btn.Parent = MainFrame
    btn.Size = UDim2.new(0.9, 0, 0, 35)
    btn.BackgroundColor3 = color
    btn.Text = text
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.BorderSizePixel = 0
    
    btn.MouseButton1Click:Connect(callback)
    return btn
end

-- 4. Adding the 5 Buttons
createButton("SetBtn", "Set Waypoint", Color3.fromRGB(46, 204, 113), function()
    local char = Player.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        savedWaypoint = char.HumanoidRootPart.Position
        print("Waypoint Saved!")
    end
end)

createButton("TpBtn", "Teleport", Color3.fromRGB(52, 152, 219), function()
    local char = Player.Character
    if char and char:FindFirstChild("HumanoidRootPart") and savedWaypoint then
        char.HumanoidRootPart.CFrame = CFrame.new(savedWaypoint + Vector3.new(0, 3, 0))
    else
        warn("No waypoint set!")
    end
end)

createButton("Btn3", "Custom Action 1", Color3.fromRGB(149, 165, 166), function()
    print("Slot 3 clicked")
end)

createButton("Btn4", "Custom Action 2", Color3.fromRGB(149, 165, 166), function()
    print("Slot 4 clicked")
end)

createButton("Btn5", "Close UI", Color3.fromRGB(231, 76, 60), function()
    ScreenGui:Destroy()
end)
