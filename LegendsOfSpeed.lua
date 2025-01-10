local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/gxslighted/Echo/refs/heads/main/Library.lua"))()

local Player = game:GetService("Players").LocalPlayer

game:GetService('ReplicatedStorage').raceInProgress.Changed:Connect(function()
	if _G.AR == true then		
		if game:GetService('ReplicatedStorage').raceInProgress.Value == true then
			game:GetService('ReplicatedStorage').rEvents.raceEvent:FireServer("joinRace")
		end
	end
end)

game:GetService('ReplicatedStorage').raceStarted.Changed:Connect(function()
	if _G.AR == true then
		if game:GetService('ReplicatedStorage').raceStarted.Value == true then
			for i, v in pairs(game:GetService('Workspace').raceMaps:GetChildren()) do
				local OldFinishPosition = v.finishPart.CFrame
				v.finishPart.CFrame = Player.Character.HumanoidRootPart.CFrame
				wait()
				v.finishPart.CFrame = OldFinishPosition
			end
		end
		wait(2)
	end
end)

local Window = Library:CreateWindow("Echo -  by gxslighted")

Window:Label("Universal")
Window:Toggle("Hoops V1", function(state)
	if state then
	 _G.loop = true
        while _G.loop do
            wait()
            for i,v in pairs(game:GetService("Workspace").Hoops:GetChildren()) do
                firetouchinterest(v, game.Players.LocalPlayer.Character.HumanoidRootPart, 0)
                wait()
                firetouchinterest(v, game.Players.LocalPlayer.Character.HumanoidRootPart, 1)
            end
	    end
	else
		_G.loop = false
	end
end)
Window:Toggle("Hoops V2", function(state)
	if state then
	 _G.loop = true
        while _G.loop do
            wait()
            local children = workspace.Hoops:GetChildren()
            for i, child in ipairs(children) do
                if child.Name == "Hoop" then
                    child.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                end    
            end
	    end
	else
		_G.loop = false
	end
end)
Window:Toggle("Race V1", function(state)
	if state then
        _G.AR = true 
	else
		_G.AR = false
	end
end)
Window:Toggle("Race V2", function(state)
	if state then
	 _G.loop = true
        while _G.loop do
            wait()
            local args = {
               [1] = "joinRace"
            }
            game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("raceEvent"):FireServer(unpack(args))
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(48.3109131, 36.3147125, -8680.45312, -1, 0, 0, 0, 1, 0, 0, 0, -1)
            wait(0.4)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1686.07495, 36.3147125, -5946.63428, -0.984812617, 0, 0.173621148, 0, 1, 0, -0.173621148, 0, -0.984812617)
            wait(0.4)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1001.33118, 36.3147125, -10986.2178, -0.996191859, 0, -0.0871884301, 0, 1, 0, 0.0871884301, 0, -0.996191859)
            wait(0.4)
        end
	else
		_G.loop = false
	end
end)
Window:Toggle("Bull", function(state)
	if state then 
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local newProperties = PhysicalProperties.new(30, 0.3, 0.5)
        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CustomPhysicalProperties = newProperties
            end
        end
	else 
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CustomPhysicalProperties = nil
            end
        end
	end 
end)
Window:Label("Misc")
Window:Box("Backtrack", function(btam)
    settings():GetService("NetworkSettings").IncomingReplicationLag = btam
end)
Window:Toggle("Connection Enhancer", function(state)
    if state then
        _G.loop = true
        while _G.loop == true do wait()
            game:GetService("NetworkClient"):SetOutgoingKBPSLimit(800000)
            game:GetService("NetworkClient"):SetIncomingKBPSLimit(800000)
            game:ClearCache()
            wait(0.4)
        end
    else
        _G.loop = false
    end
end)
Window:Label("Rebirths")
Window:Box("Enter Stopping Point", function(rebamountbb)
    rebamount = tonumber(rebamountbb) or 0
end)
Window:Toggle("Auto Rebirth Stopping Point", function(state)
if state then 
    _G.loop = true
    while _G.loop do 
        wait()
        local success, err = pcall(function()
            local rebirthsBefore = game.Players.LocalPlayer.leaderstats.Rebirths.Value
            game:GetService("ReplicatedStorage").rEvents.rebirthEvent:FireServer("rebirthRequest")
            wait(0.5)
            local rebirthsAfter = game.Players.LocalPlayer.leaderstats.Rebirths.Value
            if rebirthsAfter > rebirthsBefore then
                rebirthSuccessful = true
                wait(0.5)
                rebirthSuccessful = false
            end
            if rebirthsAfter >= rebamount then
                print("Reached rebirth "..rebamount.."!")
                _G.loop = false
            end
        end)
        if not success then
            warn("Error while rebirthing:", err)
            _G.loop = false
        end
    end 
else 
    _G.loop = false 
end 
end)
Window:Toggle("Auto Rebirth", function(state)
    if state then 
        _G.loop = true 
        while _G.loop do 
            wait()
            local success, err = pcall(function()
                local rebirthsBefore = game.Players.LocalPlayer.leaderstats.Rebirths.Value
                game:GetService("ReplicatedStorage").rEvents.rebirthEvent:FireServer("rebirthRequest")
                wait(0.5)
                local rebirthsAfter = game.Players.LocalPlayer.leaderstats.Rebirths.Value
                if rebirthsAfter > rebirthsBefore then
                    rebirthSuccessful = true
                    wait(0.5)
                    rebirthSuccessful = false
                end
            end)
        end 
    else 
        _G.loop = false 
    end 
end)
Window:Label("Farm [150]")
Window:Toggle("Yellow Orb [City]", function(state)
	if state then 
        _G.loop = true 
        while _G.loop do 
            for i = 1, 150 do
                game:GetService('ReplicatedStorage').rEvents.orbEvent:FireServer("collectOrb", "Yellow Orb", "City")
            end
            wait(0.26)
        end 
    else 
        _G.loop = false 
    end
end)
Window:Toggle("Red Orb [City]", function(state)
	if state then 
        _G.loop = true 
        while _G.loop do 
            for i = 1, 150 do
                game:GetService('ReplicatedStorage').rEvents.orbEvent:FireServer("collectOrb", "Red Orb", "City")
            end
            wait(0.26)
        end 
    else 
        _G.loop = false 
    end
end)
Window:Toggle("Gem [City]", function(state)
	if state then 
        _G.loop = true 
        while _G.loop do 
            for i = 1, 150 do
                game:GetService('ReplicatedStorage').rEvents.orbEvent:FireServer("collectOrb", "Red Orb", "City")
            end
            wait(0.26)
        end 
    else 
        _G.loop = false 
    end
end)
Window:Toggle("Yellow Orb [Magma City]", function(state)
	if state then 
        _G.loop = true 
        while _G.loop do 
            for i = 1, 150 do
                game:GetService('ReplicatedStorage').rEvents.orbEvent:FireServer("collectOrb", "Yellow Orb", "Magma City")
            end
            wait(0.26)
        end 
    else 
        _G.loop = false 
    end
end)
Window:Toggle("Red Orb [Magma City]", function(state)
	if state then 
        _G.loop = true 
        while _G.loop do 
            for i = 1, 150 do
                game:GetService('ReplicatedStorage').rEvents.orbEvent:FireServer("collectOrb", "Red Orb", "Magma City")
            end
            wait(0.26)
        end 
    else 
        _G.loop = false 
    end
end)
Window:Toggle("Gem [Magma City]", function(state)
	if state then 
        _G.loop = true 
        while _G.loop do 
            for i = 1, 150 do
                game:GetService('ReplicatedStorage').rEvents.orbEvent:FireServer("collectOrb", "Red Orb", "Magma City")
            end
            wait(0.26)
        end 
    else 
        _G.loop = false 
    end
end)
Window:Label("Farm [200]")
Window:Toggle("Yellow Orb [City]", function(state)
	if state then 
        _G.loop = true 
        while _G.loop do 
            for i = 1, 200 do
                game:GetService('ReplicatedStorage').rEvents.orbEvent:FireServer("collectOrb", "Yellow Orb", "City")
            end
            wait(0.26)
        end 
    else 
        _G.loop = false 
    end
end)
Window:Toggle("Red Orb [City]", function(state)
	if state then 
        _G.loop = true 
        while _G.loop do 
            for i = 1, 200 do
                game:GetService('ReplicatedStorage').rEvents.orbEvent:FireServer("collectOrb", "Red Orb", "City")
            end
            wait(0.26)
        end 
    else 
        _G.loop = false 
    end
end)
Window:Toggle("Gem [City]", function(state)
	if state then 
        _G.loop = true 
        while _G.loop do 
            for i = 1, 200 do
                game:GetService('ReplicatedStorage').rEvents.orbEvent:FireServer("collectOrb", "Red Orb", "City")
            end
            wait(0.26)
        end 
    else 
        _G.loop = false 
    end
end)
Window:Toggle("Yellow Orb [Magma City]", function(state)
	if state then 
        _G.loop = true 
        while _G.loop do 
            for i = 1, 200 do
                game:GetService('ReplicatedStorage').rEvents.orbEvent:FireServer("collectOrb", "Yellow Orb", "Magma City")
            end
            wait(0.26)
        end 
    else 
        _G.loop = false 
    end
end)
Window:Toggle("Red Orb [Magma City]", function(state)
	if state then 
        _G.loop = true 
        while _G.loop do 
            for i = 1, 200 do
                game:GetService('ReplicatedStorage').rEvents.orbEvent:FireServer("collectOrb", "Red Orb", "Magma City")
            end
            wait(0.26)
        end 
    else 
        _G.loop = false 
    end
end)
Window:Toggle("Gem [Magma City]", function(state)
	if state then 
        _G.loop = true 
        while _G.loop do 
            for i = 1, 200 do
                game:GetService('ReplicatedStorage').rEvents.orbEvent:FireServer("collectOrb", "Red Orb", "Magma City")
            end
            wait(0.26)
        end 
    else 
        _G.loop = false 
    end
end)
Window:Label("Farm [250]")
Window:Toggle("Yellow Orb [City]", function(state)
	if state then 
        _G.loop = true 
        while _G.loop do 
            for i = 1, 250 do
                game:GetService('ReplicatedStorage').rEvents.orbEvent:FireServer("collectOrb", "Yellow Orb", "City")
            end
            wait(0.26)
        end 
    else 
        _G.loop = false 
    end
end)
Window:Toggle("Red Orb [City]", function(state)
	if state then 
        _G.loop = true 
        while _G.loop do 
            for i = 1, 250 do
                game:GetService('ReplicatedStorage').rEvents.orbEvent:FireServer("collectOrb", "Red Orb", "City")
            end
            wait(0.26)
        end 
    else 
        _G.loop = false 
    end
end)
Window:Toggle("Gem [City]", function(state)
	if state then 
        _G.loop = true 
        while _G.loop do 
            for i = 1, 250 do
                game:GetService('ReplicatedStorage').rEvents.orbEvent:FireServer("collectOrb", "Red Orb", "City")
            end
            wait(0.26)
        end 
    else 
        _G.loop = false 
    end
end)
Window:Toggle("Yellow Orb [Magma City]", function(state)
	if state then 
        _G.loop = true 
        while _G.loop do 
            for i = 1, 250 do
                game:GetService('ReplicatedStorage').rEvents.orbEvent:FireServer("collectOrb", "Yellow Orb", "Magma City")
            end
            wait(0.26)
        end 
    else 
        _G.loop = false 
    end
end)
Window:Toggle("Red Orb [Magma City]", function(state)
	if state then 
        _G.loop = true 
        while _G.loop do 
            for i = 1, 250 do
                game:GetService('ReplicatedStorage').rEvents.orbEvent:FireServer("collectOrb", "Red Orb", "Magma City")
            end
            wait(0.26)
        end 
    else 
        _G.loop = false 
    end
end)
Window:Toggle("Gem [Magma City]", function(state)
	if state then 
        _G.loop = true 
        while _G.loop do 
            for i = 1, 250 do
                game:GetService('ReplicatedStorage').rEvents.orbEvent:FireServer("collectOrb", "Red Orb", "Magma City")
            end
            wait(0.26)
        end 
    else 
        _G.loop = false 
    end
end)
Window:Label("Pets [Bug]")
Window:Toggle("Red Kitty [Basic]",function(state)
	if state then 
        _G.loop = true 
        while _G.loop == true do wait() 
            local args = { 
   		   	    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild("Red Kitty")   
			}
			game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args)) 
        end 
    else 
        _G.loop = false 
    end 
end)
Window:Toggle("Dark Golem [Advanced]",function(state)
	if state then 
        _G.loop = true 
        while _G.loop == true do wait() 
            local args = { 
   		   	    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild("Dark Golem")   
			}
			game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args)) 
        end 
    else 
        _G.loop = false 
    end 
end)
Window:Toggle("Orange Pegasus [Rare]",function(state)
	if state then 
        _G.loop = true 
        while _G.loop == true do wait() 
            local args = { 
   		   	    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild("Orange Pegasus")   
			}
			game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args)) 
        end 
    else 
        _G.loop = false 
    end 
end)
Window:Toggle("White Phoenix [Epic]",function(state)
	if state then 
        _G.loop = true 
        while _G.loop == true do wait() 
            local args = { 
   		   	    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild("White Phoenix")   
			}
			game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args)) 
        end 
    else 
        _G.loop = false 
    end 
end)
Window:Toggle("Ultimate Overdrive Bunny [Omega]",function(state)
	if state then 
        _G.loop = true 
        while _G.loop == true do wait() 
            local args = { 
   		   	    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild("Ultimate Overdrive Bunny")   
			}
			game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args)) 
        end 
    else 
        _G.loop = false 
    end 
end)
Window:Toggle("Flaming Hedgehog [Unique]",function(state)
	if state then 
        _G.loop = true 
        while _G.loop == true do wait() 
            local args = { 
   		   	    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild("Flaming Hedgehog")   
			}
			game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args)) 
        end 
    else 
        _G.loop = false 
    end 
end)
Window:Toggle("Swift Samurai [Update]",function(state)
	if state then 
        _G.loop = true 
        while _G.loop == true do wait() 
            local args = { 
   		   	    [1] = game:GetService("ReplicatedStorage"):WaitForChild("cPetShopFolder"):WaitForChild("Swift Samurai")   
			}
			game:GetService("ReplicatedStorage"):WaitForChild("cPetShopRemote"):InvokeServer(unpack(args)) 
        end 
    else 
        _G.loop = false 
    end 
end)