-- Script --
local function CustomHandGun(character)
    game.Players.LocalPlayer.Character.ChildAdded:Connect(function(new)
        if new.Name == Default_Weapon_Name then
        	wait(0.05)
        	local modelToTeleport = Custom_Weapon_Path:Clone()
            Custom_Weapon(modelToTeleport)
        	for i,v in pairs(game.Players.LocalPlayer.Character[Default_Weapon_Name]:GetDescendants()) do
                if v:IsA("MeshPart") or v:IsA("Part") then
                    v.Transparency = 1
                end
            end
            local player = game.Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            local rootPart = character:WaitForChild("HumanoidRootPart")
            local replicatedStorage = game:GetService("ReplicatedStorage")
            modelToTeleport:SetPrimaryPartCFrame(game.Players.LocalPlayer.Character[Default_Weapon_Name][Default_Weapon_Grip_Name].CFrame*Custom_Hand_CFrame)
            modelToTeleport.Parent = game.Players.LocalPlayer.Character[Default_Weapon_Name][Default_Weapon_Grip_Name]
            local weld = Instance.new("WeldConstraint")
            weld.Parent = modelToTeleport
            weld.Part0 = modelToTeleport[Custom_Weapon_Grip_Name]
            weld.Part1 = game.Players.LocalPlayer.Character[Default_Weapon_Name][Default_Weapon_Grip_Name]
            -- Reload --
            Custom_Reload(modelToTeleport)
        elseif new.Name == "LoadoutItem/"..Default_Weapon_Name then
            wait(0.05)
        	local modelToTeleport = Custom_Weapon_Path:Clone()
            Custom_Weapon(modelToTeleport)
            for i,v in pairs(game.Players.LocalPlayer.Character["LoadoutItem/"..Default_Weapon_Name]:GetDescendants()) do
                if v:IsA("MeshPart") or v:IsA("Part") then
                    v.Transparency = 1
                end
            end
            modelToTeleport:SetPrimaryPartCFrame(game.Players.LocalPlayer.Character["LoadoutItem/"..Default_Weapon_Name][Default_Weapon_Grip_Name].CFrame*Custom_LoadoutItem_CFrame)
            modelToTeleport.Parent = game.Players.LocalPlayer.Character["LoadoutItem/"..Default_Weapon_Name][Default_Weapon_Grip_Name]
            local weld = Instance.new("WeldConstraint")
            weld.Parent = modelToTeleport
            weld.Part0 = modelToTeleport[Custom_Weapon_Grip_Name]
            weld.Part1 = game.Players.LocalPlayer.Character["LoadoutItem/"..Default_Weapon_Name][Default_Weapon_Grip_Name]
        end
    end)
end
game.Players.LocalPlayer.CharacterAdded:Connect(CustomHandGun)
CustomHandGun()

local function CustomHotbarGun()
    -- HotBar --
    for i,v in pairs(game.Players.LocalPlayer.PlayerGui.Hotbar.HotBar.Container.HotbarList.Body:GetChildren()) do
        if v:IsA("ImageButton") then
            if v.Container.Slot.ViewportFrame:FindFirstChild(Default_Weapon_Name) then
                local modelToTeleport = Custom_Weapon_Path:Clone()
                Custom_Weapon(modelToTeleport)
                modelToTeleport:SetPrimaryPartCFrame(v.Container.Slot.ViewportFrame[Default_Weapon_Name][Default_Weapon_Grip_Name].CFrame*Custom_HotBar_CFrame)
                V = v
                v.Container.Slot.ViewportFrame.Camera.FieldOfView = 47.5
                for i,v in pairs(v.Container.Slot.ViewportFrame[Default_Weapon_Name]:GetDescendants()) do
                    if v:IsA("MeshPart") or v:IsA("Part") then
                        v.Transparency = 1
                    end
                end
                for i,v in pairs(modelToTeleport:GetChildren()) do
                    if not v:IsA("Attachment") then
                        v.Parent = V.Container.Slot.ViewportFrame[Default_Weapon_Name]
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
                if v.Container.ViewportFrame:FindFirstChild(Default_Weapon_Name) then
                    Custom_SlotType(v)
                    for i,v in pairs(v.Container.ViewportFrame[Default_Weapon_Name]:GetDescendants()) do
                        if v:IsA("MeshPart") or v:IsA("Part") then
                            v.Transparency = 1
                        end
                    end
                    local modelToTeleport = Custom_Weapon_Path:Clone()
                    Custom_Weapon(modelToTeleport)
                    modelToTeleport:SetPrimaryPartCFrame(v.Container.ViewportFrame[Default_Weapon_Name][Default_Weapon_Grip_Name].CFrame*Custom_Inventory_CFrame)
                    V = v
                    for i,v in pairs(modelToTeleport:GetChildren()) do
                        if not v:IsA("Attachment") then
                            v.Parent = V.Container.ViewportFrame[Default_Weapon_Name]
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
            end
        end
        if getgcItem == Default_Weapon_Name then
            v.SlotType = Custom_SlotType_Name
            v.Display = Custom_Weapon_Name
        end
    end
end

Custom_End()
