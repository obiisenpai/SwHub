-- [[ THIẾT LẬP CƠ BẢN ]]
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

-- Xóa UI cũ nếu đã tồn tại
for _, v in pairs(CoreGui:GetChildren()) do
    if v.Name == "SwitchHubPro" then v:Destroy() end
end

-- [[ TẠO MÀN HÌNH CHÍNH ]]
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SwitchHubPro"
ScreenGui.Parent = CoreGui

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(22, 22, 24) -- Màu nền tối
MainFrame.Position = UDim2.new(0.5, -300, 0.5, -175)
MainFrame.Size = UDim2.new(0, 600, 0, 350)
MainFrame.Active = true
MainFrame.Draggable = true

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 6)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(50, 50, 50)
MainStroke.Thickness = 1
MainStroke.Parent = MainFrame

-- Ảnh nền mờ (Trái ác quỷ, kiếm...) - Nếu có ID ảnh thì thay vào rbxassetid://...
local BgImage = Instance.new("ImageLabel")
BgImage.Parent = MainFrame
BgImage.BackgroundTransparency = 1
BgImage.Size = UDim2.new(1, 0, 1, 0)
BgImage.ImageTransparency = 0.9
-- BgImage.Image = "rbxassetid://YOUR_IMAGE_ID" 

-- [[ TOP BAR (HEADER) ]]
local TopBar = Instance.new("Frame")
TopBar.Parent = MainFrame
TopBar.BackgroundColor3 = Color3.fromRGB(15, 15, 17)
TopBar.BackgroundTransparency = 0.5
TopBar.Size = UDim2.new(1, 0, 0, 40)
TopBar.BorderSizePixel = 0
Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0, 6)

local Title = Instance.new("TextLabel")
Title.Parent = TopBar
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 15, 0, 0)
Title.Size = UDim2.new(0, 200, 1, 0)
Title.Font = Enum.Font.GothamBold
Title.Text = "Switch Hub | Premium"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 16
Title.TextXAlignment = Enum.TextXAlignment.Left

local Version = Instance.new("TextLabel")
Version.Parent = TopBar
Version.BackgroundTransparency = 1
Version.Position = UDim2.new(1, -120, 0, 0)
Version.Size = UDim2.new(0, 60, 1, 0)
Version.Font = Enum.Font.GothamBold
Version.Text = "Ver : Pro"
Version.TextColor3 = Color3.fromRGB(255, 255, 255)
Version.TextSize = 12
Version.TextXAlignment = Enum.TextXAlignment.Right

-- Nút Thu nhỏ (-) và Tắt (X)
local MinimizeBtn = Instance.new("TextButton")
MinimizeBtn.Parent = TopBar
MinimizeBtn.BackgroundTransparency = 1
MinimizeBtn.Position = UDim2.new(1, -50, 0, 10)
MinimizeBtn.Size = UDim2.new(0, 20, 0, 20)
MinimizeBtn.Text = "—"
MinimizeBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
MinimizeBtn.TextSize = 14

local CloseBtn = Instance.new("TextButton")
CloseBtn.Parent = TopBar
CloseBtn.BackgroundTransparency = 1
CloseBtn.Position = UDim2.new(1, -25, 0, 10)
CloseBtn.Size = UDim2.new(0, 20, 0, 20)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
CloseBtn.TextSize = 14

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- [[ PHÂN CHIA LAYOUT LÀM 3 CỘT ]]
-- Cột Trái (Tabs)
local LeftContainer = Instance.new("Frame")
LeftContainer.Parent = MainFrame
LeftContainer.BackgroundTransparency = 1
LeftContainer.Position = UDim2.new(0, 0, 0, 45)
LeftContainer.Size = UDim2.new(0, 140, 1, -50)

-- Cột Giữa (Toggles/Nội dung)
local MidContainer = Instance.new("Frame")
MidContainer.Parent = MainFrame
MidContainer.BackgroundColor3 = Color3.fromRGB(18, 18, 20)
MidContainer.Position = UDim2.new(0, 145, 0, 45)
MidContainer.Size = UDim2.new(1, -290, 1, -50)
Instance.new("UICorner", MidContainer).CornerRadius = UDim.new(0, 4)
Instance.new("UIStroke", MidContainer).Color = Color3.fromRGB(40, 40, 40)

-- Cột Phải (Buttons)
local RightContainer = Instance.new("Frame")
RightContainer.Parent = MainFrame
RightContainer.BackgroundTransparency = 1
RightContainer.Position = UDim2.new(1, -140, 0, 45)
RightContainer.Size = UDim2.new(0, 135, 1, -50)

local RightLayout = Instance.new("UIListLayout")
RightLayout.Parent = RightContainer
RightLayout.SortOrder = Enum.SortOrder.LayoutOrder
RightLayout.Padding = UDim.new(0, 6)

-- [[ TẠO TAB BÊN TRÁI ]]
local TabAutoFarm = Instance.new("TextButton")
TabAutoFarm.Parent = LeftContainer
TabAutoFarm.BackgroundColor3 = Color3.fromRGB(25, 35, 45) -- Nền hơi xanh
TabAutoFarm.BackgroundTransparency = 0.5
TabAutoFarm.Size = UDim2.new(1, 0, 0, 40)
TabAutoFarm.Text = "      AUTOFARM"
TabAutoFarm.Font = Enum.Font.GothamBold
TabAutoFarm.TextColor3 = Color3.fromRGB(135, 206, 250) -- Chữ màu xanh sáng
TabAutoFarm.TextSize = 12
TabAutoFarm.TextXAlignment = Enum.TextXAlignment.Left

-- Vạch sáng màu xanh bên trái Tab
local TabHighlight = Instance.new("Frame")
TabHighlight.Parent = TabAutoFarm
TabHighlight.BackgroundColor3 = Color3.fromRGB(50, 150, 255)
TabHighlight.Size = UDim2.new(0, 3, 1, 0)
TabHighlight.BorderSizePixel = 0

-- Icon hộp (Sử dụng Image thay cho Unicode để chuẩn đẹp nhất)
local TabIcon = Instance.new("ImageLabel")
TabIcon.Parent = TabAutoFarm
TabIcon.BackgroundTransparency = 1
TabIcon.Position = UDim2.new(0, 15, 0.5, -10)
TabIcon.Size = UDim2.new(0, 20, 0, 20)
TabIcon.Image = "rbxassetid://6022668888" -- Icon Box mẫu
TabIcon.ImageColor3 = Color3.fromRGB(135, 206, 250)

-- [[ TẠO CHỨC NĂNG CỘT GIỮA (TOGGLES & ĐƯỜNG KẺ) ]]
local MidLayout = Instance.new("UIListLayout")
MidLayout.Parent = MidContainer
MidLayout.SortOrder = Enum.SortOrder.LayoutOrder
MidLayout.Padding = UDim.new(0, 15)
MidLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

-- Thêm khoảng trống padding trên cùng
local Spacer = Instance.new("Frame", MidContainer)
Spacer.BackgroundTransparency = 1
Spacer.Size = UDim2.new(1, 0, 0, 5)

local function CreateLine()
    local Line = Instance.new("Frame")
    Line.Parent = MidContainer
    Line.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Line.Size = UDim2.new(0.9, 0, 0, 1)
    Line.BorderSizePixel = 0
end

local function CreateToggle(defaultState)
    local ToggleContainer = Instance.new("Frame")
    ToggleContainer.Parent = MidContainer
    ToggleContainer.BackgroundTransparency = 1
    ToggleContainer.Size = UDim2.new(0.9, 0, 0, 24)

    local SwitchBg = Instance.new("TextButton")
    SwitchBg.Parent = ToggleContainer
    SwitchBg.BackgroundColor3 = defaultState and Color3.fromRGB(45, 148, 255) or Color3.fromRGB(50, 50, 50)
    SwitchBg.Position = UDim2.new(1, -45, 0, 0)
    SwitchBg.Size = UDim2.new(0, 45, 0, 24)
    SwitchBg.Text = ""
    Instance.new("UICorner", SwitchBg).CornerRadius = UDim.new(1, 0)
    
    local Circle = Instance.new("Frame")
    Circle.Parent = SwitchBg
    Circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Circle.Position = defaultState and UDim2.new(1, -20, 0.5, -8) or UDim2.new(0, 4, 0.5, -8)
    Circle.Size = UDim2.new(0, 16, 0, 16)
    Instance.new("UICorner", Circle).CornerRadius = UDim.new(1, 0)
    
    local state = defaultState
    SwitchBg.MouseButton1Click:Connect(function()
        state = not state
        TweenService:Create(SwitchBg, TweenInfo.new(0.2), {BackgroundColor3 = state and Color3.fromRGB(45, 148, 255) or Color3.fromRGB(50, 50, 50)}):Play()
        TweenService:Create(Circle, TweenInfo.new(0.2), {Position = state and UDim2.new(1, -20, 0.5, -8) or UDim2.new(0, 4, 0.5, -8)}):Play()
    end)
end

-- Re-create layout giống hệt trong ảnh cột giữa
CreateLine()
CreateToggle(true)
CreateLine()
-- Khoảng trống giả lập
local Spacer2 = Instance.new("Frame", MidContainer)
Spacer2.BackgroundTransparency = 1
Spacer2.Size = UDim2.new(1, 0, 0, 60)
CreateToggle(true)
CreateToggle(false)
CreateLine()
CreateToggle(true)
CreateToggle(true)

-- [[ TẠO CÁC NÚT BÊN PHẢI ]]
local function CreateRightBox(isButton, text, color, textColor)
    local Box = Instance.new(isButton and "TextButton" or "Frame")
    Box.Parent = RightContainer
    Box.BackgroundColor3 = color or Color3.fromRGB(25, 25, 28)
    Box.Size = UDim2.new(1, 0, 0, 35)
    
    Instance.new("UICorner", Box).CornerRadius = UDim.new(0, 4)
    Instance.new("UIStroke", Box).Color = Color3.fromRGB(50, 50, 50)
    
    if isButton then
        Box.Font = Enum.Font.GothamBold
        Box.Text = text
        Box.TextColor3 = textColor or Color3.fromRGB(255, 255, 255)
        Box.TextSize = 13
    end
end

-- 3 Ô trống (Placeholders cho stats hoặc info)
CreateRightBox(false)
CreateRightBox(false)
CreateRightBox(false)

-- 4 Nút chức năng
CreateRightBox(true, "Execute Script", Color3.fromRGB(45, 148, 255)) -- Nút Xanh
CreateRightBox(true, "Stop Tween", Color3.fromRGB(210, 45, 45))     -- Nút Đỏ
CreateRightBox(true, "Load Config", Color3.fromRGB(30, 30, 35))
CreateRightBox(true, "Save Config", Color3.fromRGB(30, 30, 35))
