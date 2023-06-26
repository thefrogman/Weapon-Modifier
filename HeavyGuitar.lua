local NewModel = game:GetService("ReplicatedStorage").Resources.Items.Instruments.HeavyGuitar
local Equiped = false

local function CustomHandGun(character)
    game.Players.LocalPlayer.Character.ChildAdded:Connect(function(new)
        if new.Name == "Guitar" then
            Equiped = true
        	wait(0.05)
        	local modelToTeleport = NewModel:Clone()
        	for i,v in pairs(game.Players.LocalPlayer.Character.Guitar:GetDescendants()) do
                if v:IsA("MeshPart") or v:IsA("Part") then
                    v.Transparency = 1
                end
            end
            local player = game.Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            local rootPart = character:WaitForChild("HumanoidRootPart")
            local replicatedStorage = game:GetService("ReplicatedStorage")
            modelToTeleport:SetPrimaryPartCFrame(game.Players.LocalPlayer.Character.Guitar.Center.CFrame*CFrame.Angles(math.rad(0), math.rad(0), math.rad(0))*CFrame.new(0,0.035,0.125))
            modelToTeleport.Parent = game.Players.LocalPlayer.Character.Guitar.Center
            local weld = Instance.new("WeldConstraint")
            weld.Parent = modelToTeleport
            weld.Part0 = modelToTeleport.Center
            weld.Part1 = game.Players.LocalPlayer.Character.Guitar.Center

            game.Players.LocalPlayer.Character.Guitar.Center.ChildAdded:Connect(function(new)
                if new:IsA("Sound") then
                    new.SoundId = "rbxassetid://6839032240"
                    new.Parent.HeavyGuitar.Center.LightningBody.Enabled = true
                    wait(0.25)
                    new.Parent.HeavyGuitar.Center.LightningBody.Enabled = false
                end
            end)
        elseif new.Name == "LoadoutItem/Guitar" then
            Equiped = false
            wait(0.05)
        	local modelToTeleport = NewModel:Clone()
            for i,v in pairs(game.Players.LocalPlayer.Character["LoadoutItem/Guitar"]:GetDescendants()) do
                if v:IsA("MeshPart") or v:IsA("Part") then
                    v.Transparency = 1
                end
            end
            modelToTeleport:SetPrimaryPartCFrame(game.Players.LocalPlayer.Character["LoadoutItem/Guitar"].Center.CFrame*CFrame.Angles(math.rad(0), math.rad(0), math.rad(0))*CFrame.new(0,0,-0.075))
            modelToTeleport.Parent = game.Players.LocalPlayer.Character["LoadoutItem/Guitar"].Center
            local weld = Instance.new("WeldConstraint")
            weld.Parent = modelToTeleport
            weld.Part0 = modelToTeleport.Center
            weld.Part1 = game.Players.LocalPlayer.Character["LoadoutItem/Guitar"].Center
        end
    end)
end
game.Players.LocalPlayer.CharacterAdded:Connect(CustomHandGun)
CustomHandGun()

local function CustomHotbarGun()
    -- HotBar --
    for i,v in pairs(game.Players.LocalPlayer.PlayerGui.Hotbar.HotBar.Container.HotbarList.Body:GetChildren()) do
        if v:IsA("ImageButton") then
            if v.Container.Slot.ViewportFrame:FindFirstChild("Guitar") then
                local modelToTeleport = NewModel:Clone()
                modelToTeleport:SetPrimaryPartCFrame(v.Container.Slot.ViewportFrame.Guitar.Center.CFrame*CFrame.Angles(math.rad(0), math.rad(0), math.rad(0))*CFrame.new(0,0,0))
                V = v
                v.Container.Slot.ViewportFrame.Camera.FieldOfView = 70
                for i,v in pairs(v.Container.Slot.ViewportFrame.Guitar:GetDescendants()) do
                    if v:IsA("MeshPart") or v:IsA("Part") then
                        v.Transparency = 1
                    end
                end
                for i,v in pairs(modelToTeleport:GetChildren()) do
                    if not v:IsA("Attachment") then
                        v.Parent = V.Container.Slot.ViewportFrame.Guitar
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
                if v.Container.ViewportFrame:FindFirstChild("Guitar") then
                    for i,v in pairs(v.Container.ViewportFrame.Guitar:GetDescendants()) do
                        if v:IsA("MeshPart") or v:IsA("Part") then
                            v.Transparency = 1
                        end
                    end
                    local modelToTeleport = NewModel:Clone()
                    modelToTeleport:SetPrimaryPartCFrame(v.Container.ViewportFrame.Guitar.Center.CFrame*CFrame.Angles(math.rad(0), math.rad(0), math.rad(0))*CFrame.new(0,0,0))
                    V = v
                    for i,v in pairs(modelToTeleport:GetChildren()) do
                        if not v:IsA("Attachment") then
                            v.Parent = V.Container.ViewportFrame.Guitar
                        end
                    end
                end
            end
        end
    end
end)
