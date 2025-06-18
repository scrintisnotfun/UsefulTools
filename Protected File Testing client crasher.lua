local Players = game:GetService("Players")
local player = Players.LocalPlayer




































































































-- Wait for player and character
local character = player.Character or player.CharacterAdded:Wait()
local backpack = player:WaitForChild("Backpack")

-- Function to check for the tool
local function findSeedPack()
    for _, item in ipairs(backpack:GetChildren()) do
        if item:IsA("Tool") and item:GetAttribute("n") == "Flower Seed Pack" then
            return item
        end
    end
    return nil
end

-- Wait for the tool to appear if not already there
local tool = findSeedPack()
if not tool then
    local connection
    connection = backpack.ChildAdded:Connect(function(child)
        if child:IsA("Tool") and child:GetAttribute("n") == "Flower Seed Pack" then
            tool = child
            connection:Disconnect()
        end
    end)
    
    -- Wait until we find the tool
    while not tool do
        task.wait(0.01)
    end
end

-- Equip and activate the tool
tool.Parent = character
task.wait(0.05) -- Small delay for equip animation
tool:Activate()

print("Successfully equipped and activated Flower Seed Pack")
