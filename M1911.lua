local NewModel = game:GetService("ReplicatedStorage").Resources.Items.Weapons.M1911

local function CustomHandGun(character)
    game.Players.LocalPlayer.Character.ChildAdded:Connect(function(new)
        if new.Name == "NavyRevolver" then
        	wait(0.05)
        	local modelToTeleport = NewModel:Clone()
        	for i,v in pairs(game.Players.LocalPlayer.Character.NavyRevolver:GetDescendants()) do
                if v:IsA("MeshPart") or v:IsA("Part") then
                    v.Transparency = 1
                end
            end
            local player = game.Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            local rootPart = character:WaitForChild("HumanoidRootPart")
            local replicatedStorage = game:GetService("ReplicatedStorage")
            modelToTeleport:SetPrimaryPartCFrame(game.Players.LocalPlayer.Character.NavyRevolver.Handle.CFrame*CFrame.Angles(math.rad(0), math.rad(180), math.rad(0))*CFrame.new(0,0.035,0.70))
            modelToTeleport.Parent = game.Players.LocalPlayer.Character.NavyRevolver.Handle
            local weld = Instance.new("WeldConstraint")
            weld.Parent = modelToTeleport
            weld.Part0 = modelToTeleport.Handle
            weld.Part1 = game.Players.LocalPlayer.Character.NavyRevolver.Handle
            for i,v in pairs(game.Players.LocalPlayer.Character.NavyRevolver:GetChildren()) do
                if v.Name:match("ChamberBullet") then
                    v.Base:Destroy()
                    v.End:Destroy()
                end
            end
            game.Players.LocalPlayer.Character.NavyRevolver.ChildAdded:Connect(function(new)
                if new.Name:match("ChamberBullet") then
                    new.Base:Destroy()
                    new.End:Destroy()
                end
            end)
        elseif new.Name == "LoadoutItem/NavyRevolver" then
            wait(0.05)
        	local modelToTeleport = NewModel:Clone()
            for i,v in pairs(game.Players.LocalPlayer.Character["LoadoutItem/NavyRevolver"]:GetDescendants()) do
                if v:IsA("MeshPart") or v:IsA("Part") then
                    v.Transparency = 1
                end
            end
            modelToTeleport:SetPrimaryPartCFrame(game.Players.LocalPlayer.Character["LoadoutItem/NavyRevolver"].Handle.CFrame*CFrame.Angles(math.rad(180), math.rad(180), math.rad(0))*CFrame.new(0,0,0))
            modelToTeleport.Parent = game.Players.LocalPlayer.Character["LoadoutItem/NavyRevolver"].Handle
            local weld = Instance.new("WeldConstraint")
            weld.Parent = modelToTeleport
            weld.Part0 = modelToTeleport.Handle
            weld.Part1 = game.Players.LocalPlayer.Character["LoadoutItem/NavyRevolver"].Handle
        end
    end)
end
game.Players.LocalPlayer.CharacterAdded:Connect(CustomHandGun)
CustomHandGun()

local function CustomHotbarGun()
    -- HotBar --
    for i,v in pairs(game.Players.LocalPlayer.PlayerGui.Hotbar.HotBar.Container.HotbarList.Body:GetChildren()) do
        if v:IsA("ImageButton") then
            if v.Container.Slot.ViewportFrame:FindFirstChild("NavyRevolver") then
                local modelToTeleport = NewModel:Clone()
                modelToTeleport:SetPrimaryPartCFrame(v.Container.Slot.ViewportFrame.NavyRevolver.Handle.CFrame*CFrame.Angles(math.rad(0), math.rad(180), math.rad(0))*CFrame.new(0,0,0.5))
                V = v
                v.Container.Slot.ViewportFrame.Camera.FieldOfView = 70
                for i,v in pairs(v.Container.Slot.ViewportFrame.NavyRevolver:GetDescendants()) do
                    if v:IsA("MeshPart") or v:IsA("Part") then
                        v.Transparency = 1
                    end
                end
                for i,v in pairs(modelToTeleport:GetChildren()) do
                    if not v:IsA("Attachment") then
                        v.Parent = V.Container.Slot.ViewportFrame.NavyRevolver
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
                if v.Container.ViewportFrame:FindFirstChild("NavyRevolver") then
                    for i,v in pairs(v.Container.ViewportFrame.NavyRevolver:GetDescendants()) do
                        if v:IsA("MeshPart") or v:IsA("Part") then
                            v.Transparency = 1
                        end
                    end
                    local modelToTeleport = NewModel:Clone()
                    modelToTeleport:SetPrimaryPartCFrame(v.Container.ViewportFrame.NavyRevolver.Handle.CFrame*CFrame.Angles(math.rad(0), math.rad(180), math.rad(0))*CFrame.new(0,0,0.5))
                    V = v
                    for i,v in pairs(modelToTeleport:GetChildren()) do
                        if not v:IsA("Attachment") then
                            v.Parent = V.Container.ViewportFrame.NavyRevolver
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
        if getgcItem == "NavyRevolver" then
            v.SlotType = "Starboard"
            v.Display = "M1911"
        end
    end
end
