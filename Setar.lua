local NewModel = game:GetService("Workspace")["WORKSPACE_Geometry"].Universal["Special Memorial"].Setar
local Equiped = false

local function CustomHandGun(character)
    game.Players.LocalPlayer.Character.ChildAdded:Connect(function(new)
        if new.Name == "Guitar" then
            Equiped = true
        	wait(0.05)
        	local modelToTeleport = NewModel:Clone()
            for i,v in pairs(modelToTeleport:GetDescendants()) do
                if v:IsA("MeshPart") or v:IsA("Part") then
                    local weld = Instance.new("WeldConstraint")
                    weld.Parent = modelToTeleport.Body
                    weld.Part0 = modelToTeleport.Body
                    weld.Part1 = v
                    v.Anchored = false
                    v.CanCollide = false
                end
            end
        	for i,v in pairs(game.Players.LocalPlayer.Character.Guitar:GetDescendants()) do
                if v:IsA("MeshPart") or v:IsA("Part") then
                    v.Transparency = 1
                end
            end
            local player = game.Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            local rootPart = character:WaitForChild("HumanoidRootPart")
            local replicatedStorage = game:GetService("ReplicatedStorage")
            modelToTeleport:SetPrimaryPartCFrame(game.Players.LocalPlayer.Character.Guitar.Center.CFrame*CFrame.Angles(math.rad(-90), math.rad(0), math.rad(0))*CFrame.new(0,0.045,1.5))
            modelToTeleport.Parent = game.Players.LocalPlayer.Character.Guitar.Center
            local weld = Instance.new("WeldConstraint")
            weld.Parent = modelToTeleport
            weld.Part0 = modelToTeleport.Body
            weld.Part1 = game.Players.LocalPlayer.Character.Guitar.Center

            game.Players.LocalPlayer.Character.Guitar.Center.ChildAdded:Connect(function(new)
                if new:IsA("Sound") then
                    new.SoundId = "rbxassetid://5712095817"
                end
            end)
        elseif new.Name == "LoadoutItem/Guitar" then
            Equiped = false
            wait(0.05)
        	local modelToTeleport = NewModel:Clone()
            for i,v in pairs(modelToTeleport:GetDescendants()) do
                if v:IsA("MeshPart") or v:IsA("Part") then
                    local weld = Instance.new("WeldConstraint")
                    weld.Parent = modelToTeleport.Body
                    weld.Part0 = modelToTeleport.Body
                    weld.Part1 = v
                    v.Anchored = false
                    v.CanCollide = false
                end
            end
            for i,v in pairs(game.Players.LocalPlayer.Character["LoadoutItem/Guitar"]:GetDescendants()) do
                if v:IsA("MeshPart") or v:IsA("Part") then
                    v.Transparency = 1
                end
            end
            modelToTeleport:SetPrimaryPartCFrame(game.Players.LocalPlayer.Character["LoadoutItem/Guitar"].Center.CFrame*CFrame.Angles(math.rad(-90), math.rad(0), math.rad(0))*CFrame.new(0,0.3,1.2))
            modelToTeleport.Parent = game.Players.LocalPlayer.Character["LoadoutItem/Guitar"].Center
            local weld = Instance.new("WeldConstraint")
            weld.Parent = modelToTeleport
            weld.Part0 = modelToTeleport.Body
            weld.Part1 = game.Players.LocalPlayer.Character["LoadoutItem/Guitar"].Center
        end
    end)
end
game.Players.LocalPlayer.CharacterAdded:Connect(CustomHandGun)
CustomHandGun()
