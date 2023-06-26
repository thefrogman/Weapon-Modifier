local NewModel = game:GetService("ReplicatedStorage").Resources.Items.Weapons.Rifles.M16
local CustomProperty = false

local function CustomHandGun(character)
    game.Players.LocalPlayer.Character.ChildAdded:Connect(function(new)
        if new.Name == "HarmonicaRifle" then
        	wait(0.05)
        	local modelToTeleport = NewModel:Clone()
        	for i,v in pairs(game.Players.LocalPlayer.Character.HarmonicaRifle:GetDescendants()) do
                if v:IsA("MeshPart") or v:IsA("Part") then
                    v.Transparency = 1
                end
            end
            local player = game.Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            local rootPart = character:WaitForChild("HumanoidRootPart")
            local replicatedStorage = game:GetService("ReplicatedStorage")
            modelToTeleport:SetPrimaryPartCFrame(game.Players.LocalPlayer.Character.HarmonicaRifle.Barrel.CFrame*CFrame.Angles(math.rad(0), math.rad(0), math.rad(0))*CFrame.new(0,-0.19,-3.25))
            modelToTeleport.Parent = game.Players.LocalPlayer.Character.HarmonicaRifle.Barrel
            local weld = Instance.new("WeldConstraint")
            weld.Parent = modelToTeleport
            weld.Part0 = modelToTeleport.Barrel
            weld.Part1 = game.Players.LocalPlayer.Character.HarmonicaRifle.Barrel
            -- Reload --
            game.Players.LocalPlayer.Character.HarmonicaRifle.HarmonicaMagazine:Destroy()
        elseif new.Name == "LoadoutItem/HarmonicaRifle" then
            wait(0.05)
        	local modelToTeleport = NewModel:Clone()
            for i,v in pairs(game.Players.LocalPlayer.Character["LoadoutItem/HarmonicaRifle"]:GetDescendants()) do
                if v:IsA("MeshPart") or v:IsA("Part") then
                    v.Transparency = 1
                end
            end
            modelToTeleport:SetPrimaryPartCFrame(game.Players.LocalPlayer.Character["LoadoutItem/HarmonicaRifle"].Barrel.CFrame*CFrame.Angles(math.rad(0), math.rad(0), math.rad(0))*CFrame.new(0,-0.19,-2.5))
            modelToTeleport.Parent = game.Players.LocalPlayer.Character["LoadoutItem/HarmonicaRifle"].Barrel
            local weld = Instance.new("WeldConstraint")
            weld.Parent = modelToTeleport
            weld.Part0 = modelToTeleport.Barrel
            weld.Part1 = game.Players.LocalPlayer.Character["LoadoutItem/HarmonicaRifle"].Barrel
        end
    end)
end
game.Players.LocalPlayer.CharacterAdded:Connect(CustomHandGun)
CustomHandGun()

local function CustomHotbarGun()
    -- HotBar --
    for i,v in pairs(game.Players.LocalPlayer.PlayerGui.Hotbar.HotBar.Container.HotbarList.Body:GetChildren()) do
        if v:IsA("ImageButton") then
            if v.Container.Slot.ViewportFrame:FindFirstChild("HarmonicaRifle") then
                local modelToTeleport = NewModel:Clone()
                modelToTeleport:SetPrimaryPartCFrame(v.Container.Slot.ViewportFrame.HarmonicaRifle.Barrel.CFrame*CFrame.Angles(math.rad(-20), math.rad(0), math.rad(0))*CFrame.new(0,0.5,-3.75))
                V = v
                v.Container.Slot.ViewportFrame.Camera.FieldOfView = 85
                for i,v in pairs(v.Container.Slot.ViewportFrame.HarmonicaRifle:GetDescendants()) do
                    if v:IsA("MeshPart") or v:IsA("Part") then
                        v.Transparency = 1
                    end
                end
                for i,v in pairs(modelToTeleport:GetChildren()) do
                    if not v:IsA("Attachment") then
                        v.Parent = V.Container.Slot.ViewportFrame.HarmonicaRifle
                    end
                end
            end
        end
    end
end
CustomHotbarGun()

game.Players.LocalPlayer.PlayerGui.InventoryUI.Changed:Connect(function()
    if game.Players.LocalPlayer.PlayerGui.InventoryUI.Enabled == true then
        game.Players.LocalPlayer.PlayerGui.InventoryUI.Inventory.Visible = false
        wait()
        game.Players.LocalPlayer.PlayerGui.InventoryUI.Inventory.Visible = true
        for i,v in pairs(game.Players.LocalPlayer.PlayerGui.InventoryUI.Inventory.Container.Body.Page.ScrollingFrame:GetChildren()) do
            if v:IsA("ImageButton") then
                if v.Container.ViewportFrame:FindFirstChild("HarmonicaRifle") then
                    for i,v in pairs(v.Container.ViewportFrame.HarmonicaRifle:GetDescendants()) do
                        if v:IsA("MeshPart") or v:IsA("Part") then
                            v.Transparency = 1
                        end
                    end
                    local modelToTeleport = NewModel:Clone()
                    modelToTeleport:SetPrimaryPartCFrame(v.Container.ViewportFrame.HarmonicaRifle.Barrel.CFrame*CFrame.Angles(math.rad(0), math.rad(0), math.rad(0))*CFrame.new(-0.5,-0.5,-3.75))
                    V = v
                    for i,v in pairs(modelToTeleport:GetChildren()) do
                        if not v:IsA("Attachment") then
                            v.Parent = V.Container.ViewportFrame.HarmonicaRifle
                        end
                    end
                end
            end
        end
    end
end)

local getgcItem

for i,v in pairs(getgc(true)) do
    if type(v) == "table" and rawget(v,"BaseRecoil") then 
        for i,v in pairs(v) do
            if i == "ItemName" then
                getgcItem = v
                print(getgcItem)
            end
        end
        if getgcItem == "HarmonicaRifle" then
            v.SlotType = "Starboard"
            v.Display = "M16"
            if CustomProperty == true then
                v.ProjectilePenetration = 3
                v.ProjectileAccuracy = 1.1
                v.HorseAccuracyModifier = 1.1
                
                v.ReloadSpeed = math.huge
                v.LoadSpeed = 2.25
                
                v.BaseRecoil = 6
                v.BaseRecoilScoped = 5
            end
        end
    end
end
