local NewModel = game:GetService("ReplicatedStorage").Resources.Items.Weapons.Shotguns.GoldenShotgun

local function CustomHandGun(character)
    game.Players.LocalPlayer.Character.ChildAdded:Connect(function(new)
        if new.Name == "RevolvingShotgun" then
        	wait(0.05)
        	local modelToTeleport = NewModel:Clone()
        	for i,v in pairs(game.Players.LocalPlayer.Character.RevolvingShotgun:GetDescendants()) do
                if v:IsA("MeshPart") or v:IsA("Part") then
                    v.Transparency = 1
                end
            end
            local player = game.Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            local rootPart = character:WaitForChild("HumanoidRootPart")
            local replicatedStorage = game:GetService("ReplicatedStorage")
            modelToTeleport:SetPrimaryPartCFrame(game.Players.LocalPlayer.Character.RevolvingShotgun.Handle.CFrame*CFrame.Angles(math.rad(0), math.rad(0), math.rad(0))*CFrame.new(0,0,0.125))
            modelToTeleport.Parent = game.Players.LocalPlayer.Character.RevolvingShotgun.Handle
            local weld = Instance.new("WeldConstraint")
            weld.Parent = modelToTeleport
            weld.Part0 = modelToTeleport.Handle
            weld.Part1 = game.Players.LocalPlayer.Character.RevolvingShotgun.Handle
        elseif new.Name == "LoadoutItem/RevolvingShotgun" then
            wait(0.05)
        	local modelToTeleport = NewModel:Clone()
            for i,v in pairs(game.Players.LocalPlayer.Character["LoadoutItem/RevolvingShotgun"]:GetDescendants()) do
                if v:IsA("MeshPart") or v:IsA("Part") then
                    v.Transparency = 1
                end
            end
            modelToTeleport:SetPrimaryPartCFrame(game.Players.LocalPlayer.Character["LoadoutItem/RevolvingShotgun"].Handle.CFrame*CFrame.Angles(math.rad(0), math.rad(0), math.rad(0))*CFrame.new(0,0,-0.075))
            modelToTeleport.Parent = game.Players.LocalPlayer.Character["LoadoutItem/RevolvingShotgun"].Handle
            local weld = Instance.new("WeldConstraint")
            weld.Parent = modelToTeleport
            weld.Part0 = modelToTeleport.Handle
            weld.Part1 = game.Players.LocalPlayer.Character["LoadoutItem/RevolvingShotgun"].Handle
        end
    end)
end
game.Players.LocalPlayer.CharacterAdded:Connect(CustomHandGun)
CustomHandGun()

local function CustomHotbarGun()
    -- HotBar --
    for i,v in pairs(game.Players.LocalPlayer.PlayerGui.Hotbar.HotBar.Container.HotbarList.Body:GetChildren()) do
        if v:IsA("ImageButton") then
            if v.Container.Slot.ViewportFrame:FindFirstChild("RevolvingShotgun") then
                local modelToTeleport = NewModel:Clone()
                modelToTeleport:SetPrimaryPartCFrame(v.Container.Slot.ViewportFrame.RevolvingShotgun.Handle.CFrame*CFrame.Angles(math.rad(-15), math.rad(0), math.rad(0))*CFrame.new(0,-0.5,-0.50))
                V = v
                v.Container.Slot.ViewportFrame.Camera.FieldOfView = 47.5
                for i,v in pairs(v.Container.Slot.ViewportFrame.RevolvingShotgun:GetDescendants()) do
                    if v:IsA("MeshPart") or v:IsA("Part") then
                        v.Transparency = 1
                    end
                end
                for i,v in pairs(modelToTeleport:GetChildren()) do
                    if not v:IsA("Attachment") then
                        v.Parent = V.Container.Slot.ViewportFrame.RevolvingShotgun
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
                if v.Container.ViewportFrame:FindFirstChild("RevolvingShotgun") then
                    for i,v in pairs(v.Container.ViewportFrame.RevolvingShotgun:GetDescendants()) do
                        if v:IsA("MeshPart") or v:IsA("Part") then
                            v.Transparency = 1
                        end
                    end
                    local modelToTeleport = NewModel:Clone()
                    modelToTeleport:SetPrimaryPartCFrame(v.Container.ViewportFrame.RevolvingShotgun.Handle.CFrame*CFrame.Angles(math.rad(15), math.rad(0), math.rad(0))*CFrame.new(0.5,0.4,-1))
                    V = v
                    for i,v in pairs(modelToTeleport:GetChildren()) do
                        if not v:IsA("Attachment") then
                            v.Parent = V.Container.ViewportFrame.RevolvingShotgun
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
        if getgcItem == "RevolvingShotgun" then
            v.SlotType = "Starboard"
            v.Display = "Golden Shotgun"
        end
    end
end
