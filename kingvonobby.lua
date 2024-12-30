local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
	Name = "runhub / King Von Obby",
	Icon = 0,
	LoadingTitle = "runhub / King Von Obby",
	LoadingSubtitle = "by fame",
	Theme = "Default", 

	DisableRayfieldPrompts = false,
	DisableBuildWarnings = false,
})
local Main = Window:CreateTab("Main", "bolt")
local Loop = Window:CreateTab("Loops", "repeat")
local freeTrollMenu = false
local TrollMenu:Frame = game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("Spectate"):WaitForChild("TrollMenu"):WaitForChild("Frame")

for i,v in ipairs(TrollMenu:GetChildren()) do
	if v:IsA("GuiButton") then
		v.MouseButton1Up:Connect(function()
			if freeTrollMenu then
				local rmEvent = nil
				for _, remote:RemoteEvent in ipairs(game:GetService("ReplicatedStorage").TrollMenuEvents:GetChildren()) do
					if (remote.Name:lower()):find(v.Name:lower()) then
						rmEvent = remote
					end
				end
				------------
				if not rmEvent then return end
				if v.readycheck.Visible == false then
					rmEvent:FireServer()
				else
					v.readycheck.Visible = false
				end
			end
			
		end)
	end
end

Main:CreateButton({
	Name = "Skip To End",
	Callback = function()
		game:GetService("ReplicatedStorage").SkipToEnd:FireServer()
	end,
})

Main:CreateToggle({
	Name = "Free Troll Menu",
	CurrentValue = false,
	Flag = "Toggle1",
	Callback = function(Value)
		freeTrollMenu = Value
	end,
})
local lagServer =false
local lagLevel = 10
Main:CreateToggle({
	Name = "Lag Server",
	CurrentValue = false,
	Flag = "Toggle1",
	Callback = function(Value)
		lagServer = Value
		while true do
			if not lagServer then break end
			
			for i=1,lagLevel/3.25 do
				game:GetService("ReplicatedStorage").NukeALL:FireServer()
			end
			task.wait()
		end
	end,
})

Main:CreateSlider({
	Name = "Lag Intensity",
	Range = {10, 70},
	Increment = 1,
	Suffix = "Intensity",
	CurrentValue = lagLevel,
	Flag = "Slider1",
	Callback = function(Value)
		lagLevel = Value
	end,
})

Main:CreateLabel("When the menu prompts you a purchase, do not buy since it is unnecessary.", "circle-alert")

Main:CreateSection("Trolling")

Main:CreateButton({
	Name = "Restart All Players",
	Callback = function()
		for i=1,55 do
			game:GetService("ReplicatedStorage").NukeALL:FireServer()
		end
	end,
})

Main:CreateButton({
	Name = "Jumpscare All",
	Callback = function()
		game:GetService("ReplicatedStorage").jumpscare:FireServer()
	end,
})

Main:CreateButton({
	Name = "Kill All",
	Callback = function()
		game:GetService("ReplicatedStorage").KillALL:FireServer()
	end,
})

----------
local loopActive = {
	KillAll = false,
	Jumpscare = false,
	LoopRestart = false
}


local function LoopKillAll()
	while loopActive.KillAll do
		game:GetService("ReplicatedStorage").KillALL:FireServer()
		wait(1) 
	end
end

local function LoopJumpscare()
	while loopActive.Jumpscare do
		game:GetService("ReplicatedStorage").jumpscare:FireServer()
		wait(1)
	end
end

local function LoopRestartAll()
	while loopActive.LoopRestart do
		for i=1,55 do
			game:GetService("ReplicatedStorage").NukeALL:FireServer()
		end
		wait(2)
	end
end

Loop:CreateToggle({
	Name = "Loop Restart All",
	CurrentValue = false,
	Flag = "LoopRestartAllToggle",
	Callback = function(Value)
		loopActive.LoopRestart = Value
		if Value then
			spawn(LoopRestartAll)
		end
	end,
})

Loop:CreateToggle({
	Name = "Loop Kill All",
	CurrentValue = false,
	Flag = "LoopKillAllToggle",
	Callback = function(Value)
		loopActive.KillAll = Value
		if Value then
			spawn(LoopKillAll)
		end
	end,
})

Loop:CreateToggle({
	Name = "Loop Jumpscare",
	CurrentValue = false,
	Flag = "LoopJumpscareToggle",
	Callback = function(Value)
		loopActive.Jumpscare = Value
		if Value then
			spawn(LoopJumpscare)
		end
	end,
})
