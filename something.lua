local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local Workspace = game:GetService("Workspace")

local localPlayer = Players.LocalPlayer
local targetParent = nil
if CoreGui then
    pcall(function() targetParent = CoreGui end)
end
if not targetParent then
    targetParent = localPlayer:WaitForChild("PlayerGui", 5) or localPlayer:FindFirstChildOfClass("PlayerGui")
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name, ScreenGui.ResetOnSpawn = "KirmicDevGui", false
ScreenGui.ZIndexBehavior, ScreenGui.Parent = Enum.ZIndexBehavior.Sibling, targetParent

local MainFrame = Instance.new("Frame")
MainFrame.Name, MainFrame.Size = "MainFrame", UDim2.new(0, 540, 0, 0)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3, MainFrame.BorderColor3 = Color3.fromRGB(15, 15, 15), Color3.fromRGB(40, 40, 40)
MainFrame.BorderSizePixel, MainFrame.Active, MainFrame.Draggable = 1, true, true
MainFrame.ClipsDescendants, MainFrame.Parent = true, ScreenGui
MainFrame.Visible = true

local InnerFrame = Instance.new("Frame")
InnerFrame.Size = UDim2.new(1, -16, 1, -16)
InnerFrame.Position = UDim2.new(0, 8, 0, 8)
InnerFrame.BackgroundColor3, InnerFrame.BorderColor3 = Color3.fromRGB(22, 22, 22), Color3.fromRGB(10, 10, 10)
InnerFrame.BorderSizePixel, InnerFrame.Parent = 1, MainFrame

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Name, TitleLabel.Size = "TitleLabel", UDim2.new(1, 0, 0, 32)
TitleLabel.Position, TitleLabel.BackgroundTransparency = UDim2.new(0, 0, 0, 0), 1
TitleLabel.Text, TitleLabel.TextColor3 = "kirmic.dev", Color3.fromRGB(240, 240, 240)
TitleLabel.TextSize, TitleLabel.Font, TitleLabel.TextXAlignment = 14, Enum.Font.Code, Enum.TextXAlignment.Center
TitleLabel.Parent = InnerFrame

local TitleLine = Instance.new("Frame")
TitleLine.Name, TitleLine.Size = "TitleLine", UDim2.new(1, -16, 0, 1)
TitleLine.Position = UDim2.new(0, 8, 0, 33)
TitleLine.BackgroundColor3, TitleLine.BorderSizePixel = Color3.fromRGB(100, 100, 100), 0
TitleLine.Parent = InnerFrame

local LoadBarBg = Instance.new("Frame")
LoadBarBg.Size = UDim2.new(0.5, 0, 0, 6)
LoadBarBg.Position = UDim2.new(0.25, 0, 0.55, 0)
LoadBarBg.BackgroundColor3, LoadBarBg.BorderSizePixel = Color3.fromRGB(30, 30, 30), 0
LoadBarBg.Parent = InnerFrame

local LoadBar = Instance.new("Frame")
LoadBar.Size = UDim2.new(0, 0, 1, 0)
LoadBar.BackgroundColor3, LoadBar.BorderSizePixel = Color3.fromRGB(240, 240, 240), 0
LoadBar.Parent = LoadBarBg

local TabContainer = Instance.new("Frame")
TabContainer.Name, TabContainer.Size = "TabContainer", UDim2.new(1, -16, 0, 32)
TabContainer.Position = UDim2.new(0, 8, 0, 40)
TabContainer.BackgroundColor3, TabContainer.BorderColor3 = Color3.fromRGB(18, 18, 18), Color3.fromRGB(32, 32, 32)
TabContainer.BorderSizePixel, TabContainer.Visible, TabContainer.Parent = 1, false, InnerFrame

local TabGrid = Instance.new("UIGridLayout")
TabGrid.CellSize, TabGrid.CellPadding = UDim2.new(0.1666, -1, 1, 0), UDim2.new(0, 1, 0, 0)
TabGrid.SortOrder, TabGrid.Parent = Enum.SortOrder.LayoutOrder, TabContainer

local ContentArea = Instance.new("Frame")
ContentArea.Name, ContentArea.Size = "ContentArea", UDim2.new(1, -16, 1, -84)
ContentArea.Position, ContentArea.BackgroundTransparency = UDim2.new(0, 8, 0, 76), 1
ContentArea.Visible, ContentArea.Parent = false, InnerFrame

-- ================================
--  TEAM CHECK & WALL CHECK
-- ================================
local Settings = { TeamCheck = true }

local function IsTeammate(chassis)
    if not Settings.TeamCheck then return false end
    local targetPlayer = Players:FindFirstChild(chassis.Name:sub(8))
    if targetPlayer and targetPlayer.Team and localPlayer.Team then
        return targetPlayer.Team == localPlayer.Team
    end
    return false
end

local function IsEnemy(chassis)
    if not Settings.TeamCheck then return true end
    local targetPlayer = Players:FindFirstChild(chassis.Name:sub(8))
    if targetPlayer and targetPlayer.Team and localPlayer.Team then
        return targetPlayer.Team ~= localPlayer.Team
    end
    return true
end

local function IsVisible(position)
    local camera = Workspace.CurrentCamera
    if not camera then return true end
    local ray = Ray.new(camera.CFrame.Position, (position - camera.CFrame.Position).Unit * 3000)
    local hit = Workspace:FindPartOnRayWithIgnoreList(ray, {localPlayer.Character, Workspace.Vehicles:FindFirstChild("Chassis" .. localPlayer.Name)}, false, true)
    return not hit
end

-- ================================
--  ESP COLORS
-- ================================
local ESPColors = {
    EnemyHull = Color3.fromRGB(255, 50, 50),
    EnemyTurret = Color3.fromRGB(255, 50, 50),
    EnemyBox = Color3.fromRGB(255, 50, 50),
    EnemyName = Color3.fromRGB(255, 50, 50),
    EnemyDistance = Color3.fromRGB(255, 50, 50),
    EnemyModule = Color3.fromRGB(255, 255, 0),
    EnemyTracers = Color3.fromRGB(255, 50, 50),
    TeammateHull = Color3.fromRGB(50, 150, 255),
    TeammateTurret = Color3.fromRGB(50, 150, 255),
    TeammateBox = Color3.fromRGB(50, 150, 255),
    TeammateName = Color3.fromRGB(50, 150, 255),
    TeammateDistance = Color3.fromRGB(50, 150, 255),
    TeammateModule = Color3.fromRGB(255, 255, 0),
    TeammateTracers = Color3.fromRGB(50, 150, 255)
}

-- ================================
--  ESP STRUCTURE
-- ================================
local ESP = {
    Enemy = {
        Enabled = false,
        WallCheck = false,
        Box = { Enabled = false },
        Name = { Enabled = false, Offset = 0 },
        Distance = { Enabled = false, Offset = 0 },
        Hull = { Enabled = false, Outline = false, Filled = false },
        Turret = { Enabled = false, Outline = false, Filled = false },
        Module = { Enabled = false, List = {} },
        Tracers = { Enabled = false }
    },
    Teammate = {
        Enabled = false,
        WallCheck = false,
        Box = { Enabled = false },
        Name = { Enabled = false, Offset = 0 },
        Distance = { Enabled = false, Offset = 0 },
        Hull = { Enabled = false, Outline = false, Filled = false },
        Turret = { Enabled = false, Outline = false, Filled = false },
        Module = { Enabled = false, List = {} },
        Tracers = { Enabled = false }
    },
    Instances = {},
    TrackedObjects = {}
}

local ModulePatterns = {
    "Ammunition", "Radiator", "Transmission", "Engine", "Drive",
    "Fuel Tank", "Right Track", "Left Track",
    "Commander", "Radio", "Gunner", "Horizontal Drive", "Vertical Drive",
    "Driver"
}

-- ================================
--  HELPERS
-- ================================
local function matchesPattern(name, pattern)
    if pattern == "Driver" then
        return string.match(name, "^Driver%d*$") ~= nil
    elseif pattern == "Commander" then
        return string.match(name, "^Commander%d*$") ~= nil
    elseif pattern == "Gunner" then
        return string.match(name, "^Gunner%d*$") ~= nil
    end
    return name == pattern
end

local function GetModuleParts(model, patterns)
    local parts = {}
    if not model then return parts end
    for _, pattern in ipairs(patterns) do
        for _, child in ipairs(model:GetDescendants()) do
            if child:IsA("BasePart") and matchesPattern(child.Name, pattern) then
                table.insert(parts, child)
            end
        end
    end
    return parts
end

local function FindHull(chassis)
    local hullFolder = chassis:FindFirstChild("Hull")
    if hullFolder then
        for _, child in ipairs(hullFolder:GetChildren()) do
            if child:IsA("Model") then return child end
        end
        return hullFolder
    end
    return nil
end

local function FindTurret(chassis)
    local turretFolder = chassis:FindFirstChild("Turret")
    if turretFolder then
        for _, child in ipairs(turretFolder:GetChildren()) do
            if child:IsA("Model") then return child end
        end
        return turretFolder
    end
    local gun = chassis:FindFirstChild("Gun")
    if gun then
        for _, child in ipairs(gun:GetChildren()) do
            if child:IsA("Model") then return child end
        end
        return gun
    end
    return nil
end

local function GetPartFromModel(model)
    if model:IsA("BasePart") then return model end
    for _, child in ipairs(model:GetDescendants()) do
        if child:IsA("BasePart") then return child end
    end
    return nil
end

local function HasESP(obj)
    return ESP.TrackedObjects[obj] == true
end
local function MarkESP(obj)
    ESP.TrackedObjects[obj] = true
end

-- ================================
--  CREATE ESP ELEMENTS
-- ================================
local function CreateESP(target, color, outline, filled)
    if not target or not target.Parent then return end
    if HasESP(target) then return end

    local highlight = Instance.new("Highlight")
    highlight.FillColor = filled and color or Color3.new(0,0,0)
    highlight.FillTransparency = filled and 0.5 or 1
    highlight.OutlineColor = outline and color or Color3.new(0,0,0)
    highlight.OutlineTransparency = outline and 0.2 or 1
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.Adornee = target
    highlight.Enabled = true
    highlight.Parent = CoreGui

    ESP.Instances[target] = { Instance = highlight }
    MarkESP(target)
end

local function CreateBox(chassis, color)
    if not chassis or not chassis.Parent then return end
    if HasESP(chassis) then return end

    local box = Instance.new("SelectionBox")
    box.Adornee = chassis
    box.Color3 = color
    box.LineThickness = 0.1
    box.Transparency = 0.3
    box.AlwaysOnTop = true
    box.Parent = CoreGui

    ESP.Instances[chassis] = { Box = box }
    MarkESP(chassis)
end

local function CreateTracer(fromPos, toPos, color)
    local distance = (toPos - fromPos).Magnitude
    if distance < 1 then return end
    local part = Instance.new("Part")
    part.Name = "Tracer"
    part.Anchored = true
    part.CanCollide = false
    part.Material = Enum.Material.Neon
    part.Color = color
    part.Size = Vector3.new(0.3, 0.3, distance)
    part.CFrame = CFrame.lookAt(fromPos, toPos) * CFrame.new(0, 0, -distance/2)
    part.Parent = CoreGui
    return part
end

local function CreateBillboard(adornee, text, color, offset)
    local bill = Instance.new("BillboardGui")
    bill.Adornee = adornee
    bill.Size = UDim2.new(0, 200, 0, 30)
    bill.StudsOffset = Vector3.new(0, offset, 0)
    bill.AlwaysOnTop = true
    bill.Parent = CoreGui
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1,0,1,0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = color
    label.TextSize = 14
    label.Font = Enum.Font.GothamBold
    label.TextStrokeTransparency = 0.5
    label.Parent = bill
    return bill, label
end

-- ================================
--  CLEAR
-- ================================
local function ClearESP()
    for _, data in pairs(ESP.Instances) do
        if data.Instance then data.Instance:Destroy() end
        if data.Box then data.Box:Destroy() end
        if data.NameBillboard then data.NameBillboard:Destroy() end
        if data.DistBillboard then data.DistBillboard:Destroy() end
        if data.Tracer then data.Tracer:Destroy() end
    end
    ESP.Instances = {}
    ESP.TrackedObjects = {}
end

-- ================================
--  MAIN UPDATE
-- ================================
local function UpdateESP()
    ClearESP()

    local vehicles = Workspace:FindFirstChild("Vehicles")
    if not vehicles then return end

    local localChassis = vehicles:FindFirstChild("Chassis" .. localPlayer.Name)
    if not localChassis then return end

    local localCF, localSize = localChassis:GetBoundingBox()
    local localBottom = localCF.Position - Vector3.new(0, localSize.Y/2, 0)

    for _, chassis in ipairs(vehicles:GetChildren()) do
        if chassis:IsA("Model") and chassis.Name:match("^Chassis") then
            local playerName = chassis.Name:sub(8)
            local player = Players:FindFirstChild(playerName)
            if player and player ~= localPlayer then
                local isEnemy = IsEnemy(chassis)
                local isTeammate = IsTeammate(chassis)

                local espData = nil
                local isEnemyTarget = false

                if isEnemy and ESP.Enemy.Enabled then
                    espData = ESP.Enemy
                    isEnemyTarget = true
                elseif isTeammate and ESP.Teammate.Enabled then
                    espData = ESP.Teammate
                    isEnemyTarget = false
                end

                if espData then
                    local hull = FindHull(chassis)
                    local turret = FindTurret(chassis)
                    local hullPart = hull and GetPartFromModel(hull)
                    local turretPart = turret and GetPartFromModel(turret)

                    -- Wall check
                    if espData.WallCheck and hullPart then
                        local targetPos = hullPart.Position
                        if not IsVisible(targetPos) then
                            goto skip_vehicle
                        end
                    end

                    local hullColor, turretColor, boxColor, nameColor, distColor, moduleColor, tracerColor
                    if isEnemyTarget then
                        hullColor = ESPColors.EnemyHull
                        turretColor = ESPColors.EnemyTurret
                        boxColor = ESPColors.EnemyBox
                        nameColor = ESPColors.EnemyName
                        distColor = ESPColors.EnemyDistance
                        moduleColor = ESPColors.EnemyModule
                        tracerColor = ESPColors.EnemyTracers
                    else
                        hullColor = ESPColors.TeammateHull
                        turretColor = ESPColors.TeammateTurret
                        boxColor = ESPColors.TeammateBox
                        nameColor = ESPColors.TeammateName
                        distColor = ESPColors.TeammateDistance
                        moduleColor = ESPColors.TeammateModule
                        tracerColor = ESPColors.TeammateTracers
                    end

                    -- Box (3D)
                    if espData.Box.Enabled and chassis and not HasESP(chassis) then
                        CreateBox(chassis, boxColor)
                    end

                    -- Hull
                    if espData.Hull.Enabled and hull and not HasESP(hull) then
                        CreateESP(hull, hullColor, espData.Hull.Outline, espData.Hull.Filled)
                    end

                    -- Turret
                    if espData.Turret.Enabled and turret and not HasESP(turret) then
                        CreateESP(turret, turretColor, espData.Turret.Outline, espData.Turret.Filled)
                    end

                    -- Name
                    if espData.Name.Enabled and hullPart then
                        if not ESP.Instances[hullPart] then ESP.Instances[hullPart] = {} end
                        if not ESP.Instances[hullPart].NameBillboard then
                            local offsetStuds = (espData.Name.Offset or 0) / 10
                            local bill, _ = CreateBillboard(hullPart, playerName, nameColor, 3.5 + offsetStuds)
                            ESP.Instances[hullPart].NameBillboard = bill
                        end
                    end

                    -- Distance
                    if espData.Distance.Enabled and hullPart then
                        if not ESP.Instances[hullPart] then ESP.Instances[hullPart] = {} end
                        if not ESP.Instances[hullPart].DistBillboard then
                            local offsetStuds = (espData.Distance.Offset or 0) / 10
                            local bill, label = CreateBillboard(hullPart, "0m", distColor, -3 - offsetStuds)
                            ESP.Instances[hullPart].DistBillboard = bill
                            ESP.Instances[hullPart].DistLabel = label
                        end
                    end

                    -- Module ESP
                    if espData.Module.Enabled and hull then
                        local allModules = {}
                        if hull then
                            for _, mod in ipairs(GetModuleParts(hull, ModulePatterns)) do
                                table.insert(allModules, mod)
                            end
                        end
                        if turret then
                            for _, mod in ipairs(GetModuleParts(turret, ModulePatterns)) do
                                table.insert(allModules, mod)
                            end
                        end
                        for _, pattern in ipairs(ModulePatterns) do
                            for _, child in ipairs(chassis:GetDescendants()) do
                                if child:IsA("BasePart") and matchesPattern(child.Name, pattern) then
                                    table.insert(allModules, child)
                                end
                            end
                        end

                        for _, mod in ipairs(allModules) do
                            local modName = mod.Name
                            local enabled = false
                            for _, pattern in ipairs(ModulePatterns) do
                                if matchesPattern(modName, pattern) and espData.Module.List[pattern] then
                                    enabled = true
                                    break
                                end
                            end
                            if enabled and not HasESP(mod) then
                                CreateESP(mod, moduleColor, true, true)
                            end
                        end
                    end

                    -- Tracers
                    if espData.Tracers.Enabled then
                        local targetCF, targetSize = chassis:GetBoundingBox()
                        if targetCF then
                            local targetBottom = targetCF.Position - Vector3.new(0, targetSize.Y/2, 0)
                            if not ESP.Instances[chassis] then ESP.Instances[chassis] = {} end
                            if not ESP.Instances[chassis].Tracer then
                                local tracer = CreateTracer(localBottom, targetBottom, tracerColor)
                                if tracer then
                                    ESP.Instances[chassis].Tracer = tracer
                                end
                            end
                        end
                    end

                    ::skip_vehicle::
                end
            end
        end
    end
end

-- ================================
--  UPDATE DISTANCES
-- ================================
local function UpdateDistances()
    for _, data in pairs(ESP.Instances) do
        if data.DistLabel and data.DistBillboard and data.DistBillboard.Adornee then
            local pos = data.DistBillboard.Adornee.Position
            if pos then
                local dist = math.floor((pos - Workspace.CurrentCamera.CFrame.Position).Magnitude / 3)
                data.DistLabel.Text = dist .. "m"
            end
        end
    end
end

-- ================================
--  UI BUILDING (FULL)
-- ================================
local registeredTabs = {}
local function CreateTab(name, order)
    local Btn = Instance.new("TextButton")
    Btn.Name, Btn.Text = name .. "Tab", name
    Btn.TextColor3, Btn.TextSize = Color3.fromRGB(120, 120, 120), 12
    Btn.Font, Btn.BackgroundColor3 = Enum.Font.Code, Color3.fromRGB(20, 20, 20)
    Btn.BorderColor3, Btn.BorderSizePixel, Btn.LayoutOrder, Btn.Parent = Color3.fromRGB(30, 30, 30), 1, order, TabContainer

    local Page = Instance.new("ScrollingFrame")
    Page.Name, Page.Size = name .. "Page", UDim2.new(1, 0, 1, 0)
    Page.BackgroundTransparency = 1
    Page.Visible = (order == 1)
    Page.AutomaticCanvasSize = Enum.AutomaticSize.Y
    Page.CanvasSize = UDim2.new(0, 0, 0, 0)
    Page.ScrollBarThickness = 6
    Page.Parent = ContentArea

    local Left = Instance.new("ScrollingFrame")
    Left.Name, Left.Size, Left.BackgroundTransparency = "Left", UDim2.new(0.5, -8, 1, 0), 1
    Left.CanvasSize, Left.ScrollBarThickness, Left.Parent = UDim2.new(0, 0, 0, 800), 0, Page
    local LeftList = Instance.new("UIListLayout")
    LeftList.SortOrder, LeftList.Padding, LeftList.Parent = Enum.SortOrder.LayoutOrder, UDim.new(0, 4), Left

    local Right = Instance.new("ScrollingFrame")
    Right.Name, Right.Size = "Right", UDim2.new(0.5, -8, 1, 0)
    Right.Position, Right.BackgroundTransparency = UDim2.new(0.5, 8, 0, 0), 1
    Right.CanvasSize, Right.ScrollBarThickness, Right.Parent = UDim2.new(0, 0, 0, 800), 0, Page
    local RightList = Instance.new("UIListLayout")
    RightList.SortOrder, RightList.Padding, RightList.Parent = Enum.SortOrder.LayoutOrder, UDim.new(0, 4), Right

    if order == 1 then
        Btn.BackgroundColor3, Btn.TextColor3 = Color3.fromRGB(26, 26, 26), Color3.fromRGB(240, 240, 240)
    end

    Btn.MouseButton1Click:Connect(function()
        for _, t in pairs(registeredTabs) do
            t.Page.Visible = false
            t.Btn.BackgroundColor3, t.Btn.TextColor3 = Color3.fromRGB(20, 20, 20), Color3.fromRGB(120, 120, 120)
        end
        Page.Visible = true
        Btn.BackgroundColor3, Btn.TextColor3 = Color3.fromRGB(26, 26, 26), Color3.fromRGB(240, 240, 240)
    end)
    registeredTabs[name] = {Btn = Btn, Page = Page, Left = Left, Right = Right}
    return Left, Right
end

local gL, gR = CreateTab("Gun", 1)
local vL, vR = CreateTab("Visual", 2)
local aL, aR = CreateTab("Aimbot", 3)
local rL, rR = CreateTab("Rage", 4)
local mL, mR = CreateTab("Micx", 5)
local sL, sR = CreateTab("Setting", 6)

local function CreateSection(parent, title, sizeY)
    local S = Instance.new("Frame")
    S.Size = UDim2.new(1, 0, 0, sizeY + 40)
    S.BackgroundColor3, S.BorderColor3 = Color3.fromRGB(18, 18, 18), Color3.fromRGB(32, 32, 32)
    S.Parent = parent

    local T = Instance.new("TextLabel")
    T.Size, T.Position, T.BackgroundTransparency = UDim2.new(1, -12, 0, 24), UDim2.new(0, 10, 0, 4), 1
    T.Text, T.Font, T.TextSize = title, Enum.Font.Code, 12
    T.TextColor3, T.TextXAlignment = Color3.fromRGB(140, 140, 140), Enum.TextXAlignment.Left
    T.Parent = S

    local Container = Instance.new("Frame")
    Container.Size, Container.Position, Container.BackgroundTransparency = UDim2.new(1, 0, 1, -32), UDim2.new(0, 0, 0, 32), 1
    Container.Parent = S
    local List = Instance.new("UIListLayout")
    List.SortOrder, List.Padding, List.Parent = Enum.SortOrder.LayoutOrder, UDim.new(0, 4), Container
    return Container, S
end

localContext = {gL=gL, gR=gR, vL=vL, vR=vR, aL=aL, aR=aR, rL=rL, rR=rR, mL=mL, mR=mR, sL=sL, sR=sR, MainFrame=MainFrame, TabContainer=TabContainer, ContentArea=ContentArea, LoadBarBg=LoadBarBg, LoadBar=LoadBar, CreateSection=CreateSection, PageSetting=sL.Parent}
local data = localContext
local gL, gR, vL, vR, aL, aR, rL, mL, mR, sL = data.gL, data.gR, data.vL, data.vR, data.aL, data.aR, data.rL, data.mL, data.mR, data.sL
local CreateSection = data.CreateSection
local PageSetting = data.PageSetting

local function AttachSliderDragging(trackBtn, fillFrame, textLabel, textPrefix, minVal, maxVal)
    local isDragging = false
    local function ProcessUpdate(inputLocation)
        local relativeX = inputLocation.X - trackBtn.AbsolutePosition.X
        local percentage = math.clamp(relativeX / trackBtn.AbsoluteSize.X, 0, 1)
        fillFrame.Size = UDim2.new(percentage, 0, 1, 0)
        local currentVal = math.floor(minVal + (maxVal - minVal) * percentage)
        textLabel.Text = textPrefix .. "   [" .. tostring(currentVal) .. "]"
    end
    trackBtn.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            isDragging = true
            data.MainFrame.Draggable = false
            ProcessUpdate(input.Position)
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if isDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            ProcessUpdate(input.Position)
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            isDragging = false
            data.MainFrame.Draggable = true
        end
    end)
end

-- ================================
--  UI HELPERS
-- ================================
local function SetupToggleLogic(button, toggleTable, key, subKey)
    local active = false
    button.MouseButton1Click:Connect(function()
        active = not active
        button.BackgroundColor3 = active and Color3.fromRGB(240, 240, 240) or Color3.fromRGB(60, 60, 60)
        if toggleTable and key then
            if subKey then
                toggleTable[key][subKey] = active
            else
                toggleTable[key] = active
            end
            if ESP.Enemy.Enabled or ESP.Teammate.Enabled then
                UpdateESP()
            end
        end
    end)
    return active
end

local function CreateSlider(parent, labelText, initialValue, minVal, maxVal, callback)
    local Row = Instance.new("Frame")
    Row.Size = UDim2.new(1, 0, 0, 30)
    Row.BackgroundTransparency = 1
    Row.Parent = parent

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(0.4, 0, 1, 0)
    Label.BackgroundTransparency = 1
    Label.Text = labelText
    Label.TextColor3 = Color3.fromRGB(150, 150, 150)
    Label.TextSize = 11
    Label.Font = Enum.Font.Code
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Row

    local ValueLabel = Instance.new("TextLabel")
    ValueLabel.Size = UDim2.new(0.1, 0, 1, 0)
    ValueLabel.Position = UDim2.new(0.4, 0, 0, 0)
    ValueLabel.BackgroundTransparency = 1
    ValueLabel.Text = tostring(initialValue)
    ValueLabel.TextColor3 = Color3.fromRGB(255,255,255)
    ValueLabel.TextSize = 11
    ValueLabel.Font = Enum.Font.Code
    ValueLabel.TextXAlignment = Enum.TextXAlignment.Center
    ValueLabel.Parent = Row

    local SliderBg = Instance.new("Frame")
    SliderBg.Size = UDim2.new(0.45, 0, 0, 4)
    SliderBg.Position = UDim2.new(0.55, 0, 0.5, -2)
    SliderBg.BackgroundColor3 = Color3.fromRGB(40,40,40)
    SliderBg.BorderSizePixel = 0
    SliderBg.Parent = Row

    local SliderFill = Instance.new("Frame")
    SliderFill.Size = UDim2.new((initialValue - minVal)/(maxVal - minVal), 0, 1, 0)
    SliderFill.BackgroundColor3 = Color3.fromRGB(255,255,255)
    SliderFill.BorderSizePixel = 0
    SliderFill.Parent = SliderBg

    local SliderBtn = Instance.new("TextButton")
    SliderBtn.Size = UDim2.new(0, 10, 0, 10)
    SliderBtn.Position = UDim2.new((initialValue - minVal)/(maxVal - minVal), -5, 0.5, -5)
    SliderBtn.BackgroundColor3 = Color3.fromRGB(200,200,200)
    SliderBtn.BorderSizePixel = 0
    SliderBtn.Text = ""
    SliderBtn.Parent = SliderBg

    local dragging = false
    local function updateFromMouse(x)
        local relative = math.clamp((x - SliderBg.AbsolutePosition.X) / SliderBg.AbsoluteSize.X, 0, 1)
        local val = math.floor(minVal + relative * (maxVal - minVal))
        ValueLabel.Text = tostring(val)
        SliderFill.Size = UDim2.new(relative, 0, 1, 0)
        SliderBtn.Position = UDim2.new(relative, -5, 0.5, -5)
        if callback then callback(val) end
    end

    SliderBtn.MouseButton1Down:Connect(function() dragging = true end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            updateFromMouse(input.Position.X)
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
    end)
    SliderBg.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            updateFromMouse(input.Position.X)
            dragging = true
        end
    end)

    return Row
end

local function AddRow(parent, text, order, toggleTable, key, subKey, colorTable, colorKey, settingsLines, settingsToggleTable, settingsSubKeyPrefix, sliderCallback)
    local Row = Instance.new("Frame")
    Row.Size = UDim2.new(1, 0, 0, 24)
    Row.BackgroundTransparency = 1
    Row.LayoutOrder = order
    Row.Parent = parent

    local offset = 12
    local B = Instance.new("TextButton")
    B.Size = UDim2.new(0, 16, 0, 16)
    B.Position = UDim2.new(0, offset, 0, 4)
    B.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    B.BorderColor3 = Color3.fromRGB(10, 10, 10)
    B.Text = ""
    B.BorderSizePixel = 1
    B.Parent = Row
    SetupToggleLogic(B, toggleTable, key, subKey)

    local L = Instance.new("TextLabel")
    L.Size = UDim2.new(1, -(offset + 24 + 20 + 20), 1, 0)
    L.Position = UDim2.new(0, offset + 24, 0, 0)
    L.BackgroundTransparency = 1
    L.Text = text
    L.Font = Enum.Font.Code
    L.TextSize = 12
    L.TextColor3 = Color3.fromRGB(150, 150, 150)
    L.TextXAlignment = Enum.TextXAlignment.Left
    L.Parent = Row

    if colorTable and colorKey then
        local colorBtn = Instance.new("TextButton")
        colorBtn.Size = UDim2.new(0, 16, 0, 16)
        colorBtn.Position = UDim2.new(1, -40, 0, 4)
        colorBtn.BackgroundColor3 = colorTable[colorKey]
        colorBtn.BorderColor3 = Color3.fromRGB(60,60,60)
        colorBtn.Text = ""
        colorBtn.Parent = Row

        local colors = {
            Color3.fromRGB(255,50,50), Color3.fromRGB(50,255,50), Color3.fromRGB(50,50,255),
            Color3.fromRGB(255,255,50), Color3.fromRGB(255,50,255), Color3.fromRGB(50,255,255),
            Color3.fromRGB(255,150,50), Color3.fromRGB(150,255,50), Color3.fromRGB(50,150,255),
            Color3.fromRGB(255,50,150), Color3.fromRGB(150,50,255), Color3.fromRGB(50,255,150)
        }
        local colorIndex = 1
        colorBtn.MouseButton1Click:Connect(function()
            colorIndex = colorIndex % #colors + 1
            colorTable[colorKey] = colors[colorIndex]
            colorBtn.BackgroundColor3 = colors[colorIndex]
            if ESP.Enemy.Enabled or ESP.Teammate.Enabled then
                UpdateESP()
            end
        end)
    end

    if settingsLines and #settingsLines > 0 then
        local C = Instance.new("TextButton")
        C.Size = UDim2.new(0, 20, 0, 16)
        C.Position = UDim2.new(1, -20, 0, 4)
        C.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
        C.BorderColor3 = Color3.fromRGB(40, 40, 40)
        C.Text = "+"
        C.Font = Enum.Font.Code
        C.TextSize = 11
        C.TextColor3 = Color3.fromRGB(180, 180, 180)
        C.Parent = Row

        local targetHeight = (#settingsLines * 24) + ((#settingsLines - 1) * 6) + 12
        if sliderCallback then targetHeight = targetHeight + 30 end

        local Dropdown = Instance.new("Frame")
        Dropdown.Size = UDim2.new(1, -24, 0, 0)
        Dropdown.Position = UDim2.new(0, 12, 0, 0)
        Dropdown.Visible = false
        Dropdown.BackgroundColor3 = Color3.fromRGB(14,14,14)
        Dropdown.BorderColor3 = Color3.fromRGB(28,28,28)
        Dropdown.ClipsDescendants = true
        Dropdown.LayoutOrder = order + 0.5
        Dropdown.Parent = parent

        local UIPadding = Instance.new("UIPadding")
        UIPadding.PaddingTop, UIPadding.PaddingBottom = UDim.new(0, 6), UDim.new(0, 6)
        UIPadding.Parent = Dropdown

        local List = Instance.new("UIListLayout")
        List.SortOrder = Enum.SortOrder.LayoutOrder
        List.Padding = UDim.new(0, 6)
        List.Parent = Dropdown

        if sliderCallback then
            CreateSlider(Dropdown, "Height", 50, 0, 100, sliderCallback)
        end

        for i, line in ipairs(settingsLines) do
            AddRow(Dropdown, line, i, settingsToggleTable, settingsSubKeyPrefix, line, nil, nil, nil, nil, nil)
        end

        local open = false
        local debounce = false
        C.MouseButton1Click:Connect(function()
            if debounce then return end
            debounce = true
            open = not open
            local targetH = open and targetHeight or 0
            TweenService:Create(Dropdown, TweenInfo.new(0.25, Enum.EasingStyle.Quad), {Size = UDim2.new(1, -24, 0, targetH)}):Play()
            Dropdown.Visible = true
            task.wait(1)
            debounce = false
        end)
    end

    return Row
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.RightShift then
        data.MainFrame.Visible = not data.MainFrame.Visible
    end
end)

local function AddToggle(parent, text, order, toggleTable, key, subKey, indent)
    return AddRow(parent, text, order, toggleTable, key, subKey, nil, nil, {}, nil, nil, nil)
end

local function AddFAQText(parent, question, answer, order)
    local F = Instance.new("Frame")
    F.Size, F.BackgroundTransparency, F.LayoutOrder = UDim2.new(1, 0, 0, 36), 1, order; F.Parent = parent
    local Q = Instance.new("TextLabel")
    Q.Size, Q.Position, Q.BackgroundTransparency = UDim2.new(1, -24, 0, 16), UDim2.new(0, 12, 0, 0), 1
    Q.Text, Q.Font, Q.TextSize, Q.TextColor3 = "> " .. question, Enum.Font.Code, 11, Color3.fromRGB(210, 210, 210)
    Q.TextXAlignment = Enum.TextXAlignment.Left; Q.Parent = F
    local A = Instance.new("TextLabel")
    A.Size, A.Position, A.BackgroundTransparency = UDim2.new(1, -34, 0, 14), UDim2.new(0, 22, 0, 16), 1
    A.Text, A.Font, A.TextSize, A.TextColor3 = answer, Enum.Font.Code, 10, Color3.fromRGB(140, 140, 140)
    A.TextXAlignment = Enum.TextXAlignment.Left; A.Parent = F
end

local function CreateSettingBox(parent, sizeY)
    local S = Instance.new("Frame")
    S.Size = UDim2.new(1, 0, 0, sizeY)
    S.BackgroundColor3, S.BorderColor3 = Color3.fromRGB(18, 18, 18), Color3.fromRGB(32, 32, 32)
    S.Parent = parent
    local Container = Instance.new("Frame")
    Container.Size, Container.Position, Container.BackgroundTransparency = UDim2.new(1, 0, 1, -16), UDim2.new(0, 0, 0, 8), 1
    Container.Parent = S
    local List = Instance.new("UIListLayout")
    List.SortOrder, List.Padding, List.Parent = Enum.SortOrder.LayoutOrder, UDim.new(0, 8), Container
    return Container, S
end

localContextPart2 = {AddToggle=AddToggle, SetupToggleLogic=SetupToggleLogic, AddFAQText=AddFAQText, CreateSettingBox=CreateSettingBox, AttachSliderDragging=AttachSliderDragging}
local d2 = localContextPart2
local AddToggle, SetupToggleLogic, AddFAQText, CreateSettingBox, AttachSliderDragging = d2.AddToggle, d2.SetupToggleLogic, d2.AddFAQText, d2.CreateSettingBox, d2.AttachSliderDragging

local function AddSlider(parent, text, min, max, order)
    local Row = Instance.new("Frame")
    Row.Size, Row.BackgroundTransparency, Row.LayoutOrder = UDim2.new(1, 0, 0, 44), 1, order
    Row.Parent = parent
    local L = Instance.new("TextLabel")
    L.Size, L.Position, L.BackgroundTransparency = UDim2.new(1, -24, 0, 16), UDim2.new(0, 12, 0, 0), 1
    L.Text, L.Font, L.TextSize = text .. "   [" .. tostring(min) .. "]", Enum.Font.Code, 11
    L.TextColor3, L.TextXAlignment = Color3.fromRGB(140, 140, 140), Enum.TextXAlignment.Left; L.Parent = Row
    local T = Instance.new("TextButton")
    T.Size, T.Position = UDim2.new(1, -24, 0, 10), UDim2.new(0, 12, 0, 22)
    T.BackgroundColor3, T.BorderColor3, T.Text = Color3.fromRGB(24, 24, 24), Color3.fromRGB(12, 12, 12), ""
    T.BorderSizePixel, T.Parent = 1, Row
    local F = Instance.new("Frame")
    F.Size, F.BackgroundColor3, F.BorderSizePixel = UDim2.new(0.5, 0, 1, 0), Color3.fromRGB(160, 160, 160), 0
    F.Parent = T
    d2.AttachSliderDragging(T, F, L, text, min, max)
end

local function AddHotkeyButton(parent, order)
    local Row = Instance.new("Frame")
    Row.Size, Row.BackgroundTransparency, Row.LayoutOrder = UDim2.new(1, 0, 0, 28), 1, order
    Row.Parent = parent
    local B = Instance.new("TextButton")
    B.Size, B.Position = UDim2.new(1, -24, 0, 24), UDim2.new(0, 12, 0, 2)
    B.BackgroundColor3, B.BorderColor3 = Color3.fromRGB(24, 24, 24), Color3.fromRGB(38, 38, 38)
    B.Text, B.Font, B.TextSize, B.TextColor3 = "Keybind: [Click to Set]", Enum.Font.Code, 11, Color3.fromRGB(140, 140, 140)
    B.Parent = Row
    SetupToggleLogic(B)
end

local function AddToggleSlider(parent, text, min, max, order)
    local ContainerRow = Instance.new("Frame")
    ContainerRow.Size, ContainerRow.BackgroundTransparency, ContainerRow.LayoutOrder = UDim2.new(1, 0, 0, 52), 1, order
    ContainerRow.Parent = parent
    local B = Instance.new("TextButton")
    B.Size, B.Position = UDim2.new(0, 16, 0, 16), UDim2.new(0, 12, 0, 4)
    B.BackgroundColor3, B.BorderColor3 = Color3.fromRGB(60, 60, 60), Color3.fromRGB(10, 10, 10)
    B.Text, B.BorderSizePixel, B.Parent = "", 1, ContainerRow
    SetupToggleLogic(B)
    local L = Instance.new("TextLabel")
    L.Size, L.Position, L.BackgroundTransparency = UDim2.new(1, -36, 0, 16), UDim2.new(0, 36, 0, 2), 1
    L.Text, L.Font, L.TextSize = text .. "   [" .. tostring(min) .. "]", Enum.Font.Code, 12
    L.TextColor3, L.TextXAlignment = Color3.fromRGB(150, 150, 150), Enum.TextXAlignment.Left
    L.Parent = ContainerRow
    local T = Instance.new("TextButton")
    T.Size, T.Position = UDim2.new(1, -24, 0, 10), UDim2.new(0, 12, 0, 28)
    T.BackgroundColor3, T.BorderColor3, T.Text = Color3.fromRGB(24, 24, 24), Color3.fromRGB(12, 12, 12), ""
    T.BorderSizePixel, T.Parent = 1, ContainerRow
    local F = Instance.new("Frame")
    F.Size, F.BackgroundColor3, F.BorderSizePixel = UDim2.new(0.5, 0, 1, 0), Color3.fromRGB(160, 160, 160), 0
    F.Parent = T
    d2.AttachSliderDragging(T, F, L, text, min, max)
end

local function AddConfigMenu(targetRow, parentContainer, order, height, lines, sectionFrame)
    local C = Instance.new("TextButton")
    C.Size, C.Position = UDim2.new(0, 20, 0, 16), UDim2.new(1, -32, 0, 4)
    C.BackgroundColor3, C.BorderColor3 = Color3.fromRGB(24, 24, 24), Color3.fromRGB(40, 40, 40)
    C.Text, C.Font, C.TextSize, C.TextColor3 = "+", Enum.Font.Code, 11, Color3.fromRGB(180, 180, 180)
    C.Parent = targetRow

    local targetHeight = (#lines * 24) + ((#lines - 1) * 6) + 12
    local Dropdown = Instance.new("Frame")
    Dropdown.Size = UDim2.new(1, -24, 0, 0)
    Dropdown.Position = UDim2.new(0, 12, 0, 0)
    Dropdown.Visible = false
    Dropdown.BackgroundColor3 = Color3.fromRGB(14,14,14)
    Dropdown.BorderColor3 = Color3.fromRGB(28,28,28)
    Dropdown.ClipsDescendants = true
    Dropdown.LayoutOrder = order
    Dropdown.Parent = parentContainer

    local UIPadding = Instance.new("UIPadding")
    UIPadding.PaddingTop, UIPadding.PaddingBottom = UDim.new(0, 6), UDim.new(0, 6)
    UIPadding.Parent = Dropdown

    local List = Instance.new("UIListLayout")
    List.SortOrder = Enum.SortOrder.LayoutOrder
    List.Padding = UDim.new(0, 6)
    List.Parent = Dropdown

    for i, line in ipairs(lines) do
        AddRow(Dropdown, line, i, nil, nil, nil, nil, nil, nil, nil, nil)
    end

    local open = false
    local debounce = false
    C.MouseButton1Click:Connect(function()
        if debounce then return end
        debounce = true
        open = not open
        local targetH = open and targetHeight or 0
        local secH = sectionFrame.Size.Y.Offset + (open and targetHeight or -targetHeight)
        TweenService:Create(Dropdown, TweenInfo.new(0.25, Enum.EasingStyle.Quad), {Size = UDim2.new(1, -24, 0, targetH)}):Play()
        TweenService:Create(sectionFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quad), {Size = UDim2.new(1, 0, 0, secH)}):Play()
        Dropdown.Visible = true
        task.wait(1)
        debounce = false
    end)
end

-- ================================
--  POPULATE UI
-- ================================
local gC, gS = CreateSection(gL, "Gun Mods", 340)
AddToggleSlider(gC, "Pen Primary", 1, 99999, 1); AddToggleSlider(gC, "Pen Secondary", 1, 99999, 2)
AddToggleSlider(gC, "Shell Accuracy", 1, 99999, 3); AddToggleSlider(gC, "Shell Speed", 1, 99999, 4); AddToggleSlider(gC, "Shell Gravity", 1, 1000, 5)

-- Enemy ESP (Left)
local eC, eS = CreateSection(vL, "Enemy ESP", 650)

AddRow(eC, "Enabled", 1, ESP.Enemy, "Enabled", nil, nil, nil)
AddRow(eC, "Wall Check", 2, ESP.Enemy, "WallCheck", nil, nil, nil)
AddRow(eC, "Box", 3, ESP.Enemy.Box, "Enabled", nil, ESPColors, "EnemyBox")
AddRow(eC, "Name", 4, ESP.Enemy.Name, "Enabled", nil, ESPColors, "EnemyName", {"Height"}, ESP.Enemy.Name, "Offset",
    function(val) ESP.Enemy.Name.Offset = val; if ESP.Enemy.Enabled then UpdateESP() end end)
AddRow(eC, "Distance", 5, ESP.Enemy.Distance, "Enabled", nil, ESPColors, "EnemyDistance", {"Height"}, ESP.Enemy.Distance, "Offset",
    function(val) ESP.Enemy.Distance.Offset = val; if ESP.Enemy.Enabled then UpdateESP() end end)
AddRow(eC, "Hull", 6, ESP.Enemy.Hull, "Enabled", nil, ESPColors, "EnemyHull", {"Outline", "Filled"}, ESP.Enemy.Hull, nil)
AddRow(eC, "Turret", 7, ESP.Enemy.Turret, "Enabled", nil, ESPColors, "EnemyTurret", {"Outline", "Filled"}, ESP.Enemy.Turret, nil)
AddRow(eC, "Module ESP", 8, ESP.Enemy.Module, "Enabled", nil, ESPColors, "EnemyModule", ModulePatterns, ESP.Enemy.Module, "List")
AddRow(eC, "Tracers", 9, ESP.Enemy.Tracers, "Enabled", nil, ESPColors, "EnemyTracers")

-- Teammate ESP (Right)
local tC, tS = CreateSection(vR, "Teammate ESP", 650)

AddRow(tC, "Enabled", 1, ESP.Teammate, "Enabled", nil, nil, nil)
AddRow(tC, "Wall Check", 2, ESP.Teammate, "WallCheck", nil, nil, nil)
AddRow(tC, "Box", 3, ESP.Teammate.Box, "Enabled", nil, ESPColors, "TeammateBox")
AddRow(tC, "Name", 4, ESP.Teammate.Name, "Enabled", nil, ESPColors, "TeammateName", {"Height"}, ESP.Teammate.Name, "Offset",
    function(val) ESP.Teammate.Name.Offset = val; if ESP.Teammate.Enabled then UpdateESP() end end)
AddRow(tC, "Distance", 5, ESP.Teammate.Distance, "Enabled", nil, ESPColors, "TeammateDistance", {"Height"}, ESP.Teammate.Distance, "Offset",
    function(val) ESP.Teammate.Distance.Offset = val; if ESP.Teammate.Enabled then UpdateESP() end end)
AddRow(tC, "Hull", 6, ESP.Teammate.Hull, "Enabled", nil, ESPColors, "TeammateHull", {"Outline", "Filled"}, ESP.Teammate.Hull, nil)
AddRow(tC, "Turret", 7, ESP.Teammate.Turret, "Enabled", nil, ESPColors, "TeammateTurret", {"Outline", "Filled"}, ESP.Teammate.Turret, nil)
AddRow(tC, "Module ESP", 8, ESP.Teammate.Module, "Enabled", nil, ESPColors, "TeammateModule", ModulePatterns, ESP.Teammate.Module, "List")
AddRow(tC, "Tracers", 9, ESP.Teammate.Tracers, "Enabled", nil, ESPColors, "TeammateTracers")

-- Other tabs
local mC, mS = CreateSection(mL, "Flight Controls", 180)
AddToggle(mC, "Fly Toggle", 1); AddSlider(mC, "Fly Speed (1-1k)", 1, 1000, 2); AddHotkeyButton(mC, 3)

local mC2, mS2 = CreateSection(mR, "Environment Override", 180)
AddToggle(mC2, "Noclip Toggle", 1); AddSlider(mC2, "FOV Changer", 1, 120, 2); AddHotkeyButton(mC2, 3)

local aC, aS = CreateSection(aL, "Targeting Core", 130)
AddToggle(aC, "Aimbot On/Off", 1); AddSlider(aC, "Smoothing", 0, 10, 2); AddToggle(aC, "Show FOV", 3)

local aC2, aS2 = CreateSection(aR, "Mathematical Limits", 280)
AddSlider(aC2, "FOV Slider (1-240)", 1, 240, 1); AddSlider(aC2, "Max Aim Distance (0-10K)", 0, 10000, 2)
AddToggle(aC2, "Wall Check", 3); AddToggle(aC2, "Movement Prediction", 4); AddSlider(aC2, "Prediction Slider (0-100)", 0, 100, 5)

local rC, rS = CreateSection(rL, "Silent Configuration", 210)
local rT = AddToggle(rC, "Silent Aim", 1); AddSlider(rC, "Degrees", 0, 360, 2)
local rTm = AddToggle(rC, "Target Selection", 3)
AddConfigMenu(rTm, rC, 4, 54, {"Only Ammunition", "Hull/Turret", "Drivers"}, rS)

-- Settings tab
local sLeft, sRight = localContext.sL, localContext.sR
PageSetting.Left:Destroy(); PageSetting.Right:Destroy()
local FinalSettingGrid = Instance.new("Frame")
FinalSettingGrid.Size, FinalSettingGrid.BackgroundTransparency = UDim2.new(1, 0, 1, 0), 1
FinalSettingGrid.Parent = PageSetting

local MainSettingPadding = Instance.new("UIPadding")
MainSettingPadding.PaddingLeft, MainSettingPadding.PaddingRight = UDim.new(0, 12), UDim.new(0, 12)
MainSettingPadding.PaddingTop, MainSettingPadding.PaddingBottom = UDim.new(0, 12), UDim.new(0, 12)
MainSettingPadding.Parent = FinalSettingGrid

local LeftColumn = Instance.new("Frame")
LeftColumn.Size, LeftColumn.BackgroundTransparency = UDim2.new(0.5, -8, 1, 0), 1
LeftColumn.Parent = FinalSettingGrid
local LeftList = Instance.new("UIListLayout")
LeftList.SortOrder, LeftList.Padding = Enum.SortOrder.LayoutOrder, UDim.new(0, 12); LeftList.Parent = LeftColumn

local RightColumn = Instance.new("Frame")
RightColumn.Size, RightColumn.Position, RightColumn.BackgroundTransparency = UDim2.new(0.5, -8, 1, 0), UDim2.new(0.5, 8, 0, 0), 1
RightColumn.Parent = FinalSettingGrid
local RightList = Instance.new("UIListLayout")
RightList.SortOrder, RightList.Padding = Enum.SortOrder.LayoutOrder, UDim.new(0, 12); RightList.Parent = RightColumn

local scCore, scCoreFrame = CreateSettingBox(LeftColumn, 96)
local InternalPad = Instance.new("UIPadding")
InternalPad.PaddingLeft, InternalPad.PaddingRight = UDim.new(0, 12), UDim.new(0, 12)
InternalPad.Parent = scCore

local ExList = Instance.new("UIListLayout")
ExList.SortOrder, ExList.Padding = Enum.SortOrder.LayoutOrder, UDim.new(0, 8)
ExList.HorizontalAlignment = Enum.HorizontalAlignment.Center
ExList.VerticalAlignment = Enum.VerticalAlignment.Center; ExList.Parent = scCore

local kBtn = Instance.new("TextButton")
kBtn.Size, kBtn.LayoutOrder = UDim2.new(1, 0, 0, 36), 1
kBtn.BackgroundColor3, kBtn.BorderColor3 = Color3.fromRGB(24, 24, 24), Color3.fromRGB(40, 40, 40)
kBtn.Text, kBtn.Font, kBtn.TextSize, kBtn.TextColor3 = "Menu Keybind: Right Shift", Enum.Font.Code, 13, Color3.fromRGB(160, 160, 160)
kBtn.TextXAlignment = Enum.TextXAlignment.Center; kBtn.Parent = scCore

local uBtn = Instance.new("TextButton")
uBtn.Size, uBtn.LayoutOrder = UDim2.new(1, 0, 0, 36), 2
uBtn.BackgroundColor3, uBtn.BorderColor3 = Color3.fromRGB(30, 30, 30), Color3.fromRGB(45, 45, 45)
uBtn.Text, uBtn.Font, uBtn.TextSize, uBtn.TextColor3 = "UNLOAD MENU", Enum.Font.Code, 12, Color3.fromRGB(180, 180, 180)
uBtn.TextXAlignment = Enum.TextXAlignment.Center; uBtn.Parent = scCore
uBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

local scFaq, scFaqFrame = CreateSection(LeftColumn, "FAQ", 195)
AddFAQText(scFaq, "no reload", "its server sided impossible", 1)
AddFAQText(scFaq, "instant turret speed", "impossible on 90% of hulls and turrets", 2)
AddFAQText(scFaq, "will be lags fixed next update", "they are", 3)
AddFAQText(scFaq, "will mobile support come", "by the time reading this it is yes", 4)

local scCred, scCredFrame = CreateSection(RightColumn, "Credits To", 110)
local CredPad = Instance.new("UIPadding")
CredPad.PaddingLeft, CredPad.PaddingRight = UDim.new(0, 12), UDim.new(0, 12); CredPad.Parent = scCred

local cGui = Instance.new("TextLabel")
cGui.Size, cGui.BackgroundTransparency, cGui.LayoutOrder = UDim2.new(1, 0, 0, 20), 1, 1
cGui.Text, cGui.Font, cGui.TextSize, cGui.TextColor3 = "GUI = [ developer ]", Enum.Font.Code, 11, Color3.fromRGB(150, 150, 150)
cGui.TextXAlignment = Enum.TextXAlignment.Left; cGui.Parent = scCred

local cFn = Instance.new("TextLabel")
cFn.Size, cFn.BackgroundTransparency, cFn.LayoutOrder = UDim2.new(1, 0, 0, 20), 1, 2
cFn.Text, cFn.Font, cFn.TextSize, cFn.TextColor3 = "functions = [ developer + doshiba ]", Enum.Font.Code, 11, Color3.fromRGB(150, 150, 150)
cFn.TextXAlignment = Enum.TextXAlignment.Left; cFn.Parent = scCred

local cBy = Instance.new("TextLabel")
cBy.Size, cBy.BackgroundTransparency, cBy.LayoutOrder = UDim2.new(1, 0, 0, 20), 1, 3
cBy.Text, cBy.Font, cBy.TextSize, cBy.TextColor3 = "bypass = [ developer ]", Enum.Font.Code, 11, Color3.fromRGB(150, 150, 150)
cBy.TextXAlignment = Enum.TextXAlignment.Left; cBy.Parent = scCred

-- ================================
--  ANIMATION (FIXED – GUI always shows)
-- ================================
pcall(function()
    local fT1 = TweenService:Create(localContext.MainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {Size = UDim2.new(0, 540, 0, 440)})
    local fT2 = TweenService:Create(localContext.LoadBar, TweenInfo.new(1.2, Enum.EasingStyle.Quad), {Size = UDim2.new(1, 0, 1, 0)})
    fT1:Play(); fT1.Completed:Wait(); fT2:Play(); fT2.Completed:Wait()
end)

localContext.LoadBarBg.Visible = false
localContext.TabContainer.Visible = true
localContext.ContentArea.Visible = true

-- ================================
--  BACKGROUND UPDATE LOOPS
-- ================================
task.spawn(function()
    while true do
        task.wait(1)
        if ESP.Enemy.Enabled or ESP.Teammate.Enabled then
            UpdateESP()
            UpdateDistances()
        else
            ClearESP()
        end
    end
end)

local vehicles = Workspace:FindFirstChild("Vehicles")
if vehicles then
    vehicles.ChildAdded:Connect(function()
        task.wait(0.5)
        if ESP.Enemy.Enabled or ESP.Teammate.Enabled then
            UpdateESP()
        end
    end)
    vehicles.ChildRemoved:Connect(function()
        task.wait(0.5)
        for obj, _ in pairs(ESP.Instances) do
            if not obj or not obj.Parent then
                if ESP.Instances[obj] then
                    if ESP.Instances[obj].Instance then ESP.Instances[obj].Instance:Destroy() end
                    if ESP.Instances[obj].Box then ESP.Instances[obj].Box:Destroy() end
                    if ESP.Instances[obj].NameBillboard then ESP.Instances[obj].NameBillboard:Destroy() end
                    if ESP.Instances[obj].DistBillboard then ESP.Instances[obj].DistBillboard:Destroy() end
                    if ESP.Instances[obj].Tracer then ESP.Instances[obj].Tracer:Destroy() end
                end
                ESP.Instances[obj] = nil
                ESP.TrackedObjects[obj] = nil
            end
        end
    end)
end

print("Kirmic.dev - CTS Cheat Loaded!")
print("Press Right Shift to toggle menu")
