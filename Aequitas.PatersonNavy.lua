local NewModel = game:GetService("ReplicatedStorage").Resources.Items.Weapons.Sidearms.Aequitas

local function CustomHandGun(character)
    game.Players.LocalPlayer.Character.ChildAdded:Connect(function(new)
        if new.Name == "PatersonNavy" then
        	wait(0.05)
        	local modelToTeleport = NewModel:Clone()
        	for i,v in pairs(game.Players.LocalPlayer.Character.PatersonNavy:GetDescendants()) do
                if v:IsA("MeshPart") or v:IsA("Part") then
                    v.Transparency = 1
                end
            end
            local player = game.Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            local rootPart = character:WaitForChild("HumanoidRootPart")
            local replicatedStorage = game:GetService("ReplicatedStorage")
            modelToTeleport:SetPrimaryPartCFrame(game.Players.LocalPlayer.Character.PatersonNavy.Handle.CFrame*CFrame.Angles(math.rad(0), math.rad(0), math.rad(0))*CFrame.new(0,0.065,-0.04))
            modelToTeleport.Parent = game.Players.LocalPlayer.Character.PatersonNavy.Handle
            local weld = Instance.new("WeldConstraint")
            weld.Parent = modelToTeleport
            weld.Part0 = modelToTeleport.Grip
            weld.Part1 = game.Players.LocalPlayer.Character.PatersonNavy.Handle
            -- Reload --
            if game.Players.LocalPlayer.Character.PatersonNavy:FindFirstChild("Chamber") then
                local weld = Instance.new("WeldConstraint")
                weld.Parent = modelToTeleport
                weld.Part0 = modelToTeleport.Chamber
                weld.Part1 = game.Players.LocalPlayer.Character.PatersonNavy.Chamber
                modelToTeleport.Chamber.ChamberWeld:Destroy()
            end
        elseif new.Name == "LoadoutItem/PatersonNavy" then
            wait(0.05)
        	local modelToTeleport = NewModel:Clone()
            for i,v in pairs(game.Players.LocalPlayer.Character["LoadoutItem/PatersonNavy"]:GetDescendants()) do
                if v:IsA("MeshPart") or v:IsA("Part") then
                    v.Transparency = 1
                end
            end
            modelToTeleport:SetPrimaryPartCFrame(game.Players.LocalPlayer.Character["LoadoutItem/PatersonNavy"].Handle.CFrame*CFrame.Angles(math.rad(0), math.rad(0), math.rad(0))*CFrame.new(0,0,-0.075))
            modelToTeleport.Parent = game.Players.LocalPlayer.Character["LoadoutItem/PatersonNavy"].Handle
            local weld = Instance.new("WeldConstraint")
            weld.Parent = modelToTeleport
            weld.Part0 = modelToTeleport.Grip
            weld.Part1 = game.Players.LocalPlayer.Character["LoadoutItem/PatersonNavy"].Handle
        end
    end)
end
game.Players.LocalPlayer.CharacterAdded:Connect(CustomHandGun)
CustomHandGun()

local function CustomHotbarGun()
    -- HotBar --
    for i,v in pairs(game.Players.LocalPlayer.PlayerGui.Hotbar.HotBar.Container.HotbarList.Body:GetChildren()) do
        if v:IsA("ImageButton") then
            if v.Container.Slot.ViewportFrame:FindFirstChild("PatersonNavy") then
                local modelToTeleport = NewModel:Clone()
                modelToTeleport:SetPrimaryPartCFrame(v.Container.Slot.ViewportFrame.PatersonNavy.Handle.CFrame*CFrame.Angles(math.rad(40), math.rad(180), math.rad(0))*CFrame.new(0,0.4,-1.25))
                V = v
                v.Container.Slot.ViewportFrame.Camera.FieldOfView = 47.5
                for i,v in pairs(v.Container.Slot.ViewportFrame.PatersonNavy:GetDescendants()) do
                    if v:IsA("MeshPart") or v:IsA("Part") then
                        v.Transparency = 1
                    end
                end
                for i,v in pairs(modelToTeleport:GetChildren()) do
                    if not v:IsA("Attachment") then
                        v.Parent = V.Container.Slot.ViewportFrame.PatersonNavy
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
                if v.Container.ViewportFrame:FindFirstChild("PatersonNavy") then
                    for i,v in pairs(v.Container.ViewportFrame.PatersonNavy:GetDescendants()) do
                        if v:IsA("MeshPart") or v:IsA("Part") then
                            v.Transparency = 1
                        end
                    end
                    local modelToTeleport = NewModel:Clone()
                    modelToTeleport:SetPrimaryPartCFrame(v.Container.ViewportFrame.PatersonNavy.Handle.CFrame*CFrame.Angles(math.rad(40), math.rad(180), math.rad(0))*CFrame.new(0.5,0.4,-1.25))
                    V = v
                    for i,v in pairs(modelToTeleport:GetChildren()) do
                        if not v:IsA("Attachment") then
                            v.Parent = V.Container.ViewportFrame.PatersonNavy
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
        if getgcItem == "PatersonNavy" then
            v.SlotType = "Starboard"
            v.Display = "Aequitas"
        end
    end
end
