-- Demo LocalScript for More UI Library.
-- Executor use: loads the library from GitHub before creating the UI.

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local LOAD_URL = "https://raw.githubusercontent.com/tanhoangviet/JUST-AN-UI-LIBRARY-/main/MoreUILibrary.lua"
local KEY_SYSTEM = {
	Enabled = true,
	Key = "moreui",
	Title = "More UI Library",
	Subtitle = "Windows 11 loader",
}

local playerGui = Players.LocalPlayer and Players.LocalPlayer:FindFirstChildOfClass("PlayerGui")
local loaderParent = playerGui or game:GetService("CoreGui")
local loaderGui = Instance.new("ScreenGui")
loaderGui.Name = "MoreUILibraryLoader"
loaderGui.IgnoreGuiInset = true
loaderGui.ResetOnSpawn = false
loaderGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
loaderGui.Parent = loaderParent

local shade = Instance.new("Frame")
shade.Size = UDim2.fromScale(1, 1)
shade.BackgroundColor3 = Color3.fromRGB(10, 12, 18)
shade.BackgroundTransparency = 0.28
shade.BorderSizePixel = 0
shade.Parent = loaderGui

local card = Instance.new("Frame")
card.AnchorPoint = Vector2.new(0.5, 0.5)
card.Position = UDim2.fromScale(0.5, 0.5)
card.Size = UDim2.fromOffset(340, 188)
card.BackgroundColor3 = Color3.fromRGB(246, 250, 255)
card.BorderSizePixel = 0
card.Parent = shade
Instance.new("UICorner", card).CornerRadius = UDim.new(0, 18)
local cardStroke = Instance.new("UIStroke")
cardStroke.Color = Color3.fromRGB(215, 224, 238)
cardStroke.Transparency = 0.18
cardStroke.Parent = card

local title = Instance.new("TextLabel")
title.BackgroundTransparency = 1
title.Position = UDim2.fromOffset(20, 18)
title.Size = UDim2.new(1, -40, 0, 28)
title.FontFace = Font.new("rbxasset://fonts/families/BuilderSans.json", Enum.FontWeight.Bold)
title.Text = KEY_SYSTEM.Title
title.TextColor3 = Color3.fromRGB(22, 28, 36)
title.TextSize = 18
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = card

local status = Instance.new("TextLabel")
status.BackgroundTransparency = 1
status.Position = UDim2.fromOffset(20, 48)
status.Size = UDim2.new(1, -40, 0, 24)
status.FontFace = Font.new("rbxasset://fonts/families/BuilderSans.json", Enum.FontWeight.Medium)
status.Text = KEY_SYSTEM.Enabled and "Enter key to continue" or "Loading library..."
status.TextColor3 = Color3.fromRGB(88, 96, 110)
status.TextSize = 13
status.TextXAlignment = Enum.TextXAlignment.Left
status.Parent = card

local keyBox = Instance.new("TextBox")
keyBox.Position = UDim2.fromOffset(20, 82)
keyBox.Size = UDim2.new(1, -40, 0, 38)
keyBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
keyBox.TextColor3 = Color3.fromRGB(25, 30, 38)
keyBox.PlaceholderColor3 = Color3.fromRGB(120, 130, 145)
keyBox.PlaceholderText = "Key"
keyBox.Text = ""
keyBox.ClearTextOnFocus = false
keyBox.TextSize = 14
keyBox.FontFace = Font.new("rbxasset://fonts/families/BuilderSans.json", Enum.FontWeight.Medium)
keyBox.Parent = card
Instance.new("UICorner", keyBox).CornerRadius = UDim.new(0, 10)
local boxStroke = Instance.new("UIStroke")
boxStroke.Color = Color3.fromRGB(214, 222, 234)
boxStroke.Transparency = 0.12
boxStroke.Parent = keyBox

local continueButton = Instance.new("TextButton")
continueButton.Position = UDim2.new(1, -122, 1, -52)
continueButton.Size = UDim2.fromOffset(102, 34)
continueButton.BackgroundColor3 = Color3.fromRGB(0, 120, 212)
continueButton.Text = KEY_SYSTEM.Enabled and "Unlock" or "Loading"
continueButton.TextColor3 = Color3.fromRGB(255, 255, 255)
continueButton.TextSize = 13
continueButton.FontFace = Font.new("rbxasset://fonts/families/BuilderSans.json", Enum.FontWeight.Bold)
continueButton.AutoButtonColor = false
continueButton.Parent = card
Instance.new("UICorner", continueButton).CornerRadius = UDim.new(0, 9)

local unlocked = not KEY_SYSTEM.Enabled
local function tryUnlock()
	if not KEY_SYSTEM.Enabled or keyBox.Text == KEY_SYSTEM.Key then
		unlocked = true
		status.Text = "Loading library..."
		keyBox.Visible = false
		continueButton.Text = "Loading"
	else
		status.Text = "Invalid key"
		TweenService:Create(boxStroke, TweenInfo.new(0.12), { Color = Color3.fromRGB(210, 47, 36) }):Play()
		task.delay(0.5, function()
			if boxStroke.Parent then
				TweenService:Create(boxStroke, TweenInfo.new(0.18), { Color = Color3.fromRGB(214, 222, 234) }):Play()
			end
		end)
	end
end
continueButton.MouseButton1Click:Connect(tryUnlock)
keyBox.FocusLost:Connect(function(enterPressed)
	if enterPressed then
		tryUnlock()
	end
end)

while not unlocked do
	task.wait()
end

local source
local ok, result = pcall(function()
	return game:HttpGet(LOAD_URL)
end)
if ok then
	source = result
else
	status.Text = "HttpGet failed, using local module"
end

local MoreUI = source and typeof(loadstring) == "function" and loadstring(source)() or nil
if not MoreUI then
	MoreUI = require(script.Parent.MoreUILibrary)
end

status.Text = "Starting UI..."
task.wait(0.25)
loaderGui:Destroy()

local window = MoreUI:CreateWindow({
	Title = "More UI Library",
	Subtitle = "Liquid Glass mobile demo",
	Size = UDim2.fromOffset(660, 500),
	MobileHeight = 600,
	TopInset = 72,
	BackgroundBlurSize = 10,
	ToggleKey = Enum.KeyCode.RightShift,
	OpenButtonPosition = UDim2.fromOffset(92, 86),
	SidebarCompact = true,
	IconHubName = "More UI Library",
	Window11Icons = true,
	WindowBackgroundTransparency = 0.64,
	ControlTextureTransparency = 0.84,
	TextureTransparency = 0.72,
	Dark = false,
	User = {
		Role = "Mobile Ready",
	},
})

local main = window:CreateTab("Main", MoreUI.Window11Icon("home"))
local combat = window:CreateTab("Combat", MoreUI.Window11Icon("target"))
local settings = window:CreateTab("Settings", MoreUI.Window11Icon("settings"))

local overview = main:CreateSection("Overview", {
	Icon = "lucide:home",
})

overview:AddCard({
	Title = "Liquid Glass Shell",
	Icon = "lucide:palette",
	Content = "Fixed mobile layout, reflection lines, glass surfaces, bottom-up open animation, and a Roblox-corner open button.",
	Callback = function()
		window:Notify({
			Title = "Card",
			Content = "Card callback works.",
			Icon = "lucide:bell",
		})
	end,
})

overview:AddButton({
	Text = "Send Notification",
	Icon = "lucide:bell",
	Callback = function()
		window:Notify({
			Title = "More UI",
			Content = "Notification system is working.",
			Duration = 3,
			Icon = "lucide:bell",
		})
	end,
})

overview:AddButton({
	Text = "Show Loading",
	Icon = "lucide:sparkles",
	Callback = function()
		local loading = window:ShowLoading({
			Title = "Preparing",
			Content = "Windows 11 style loading overlay.",
		})
		task.delay(1.4, function()
			if loading then
				loading:Close()
			end
		end)
	end,
})

overview:AddButton({
	Text = "Open Dialog",
	Icon = "lucide:folder",
	Callback = function()
		window:Dialog({
			Title = "Dialog",
			Content = "This is a liquid glass dialog with Window 11 controls.",
			Icon = "lucide:folder",
			Actions = {
				{ Text = "Cancel", Accent = false },
				{ Text = "OK", Accent = true },
			},
		})
	end,
})

overview:AddHighlightButton({
	Text = "Highlighted Action",
	Icon = "lucide:sparkles",
	Callback = function()
		window:Notify({
			Title = "Highlight",
			Content = "Highlighted button callback.",
			Icon = "lucide:sparkles",
		})
	end,
})

local linkedItems = {}
local linkedIcons = {
	"lucide:home",
	"lucide:settings",
	"lucide:folder",
	"lucide:palette",
	"lucide:sparkles",
	"lucide:keyboard",
	"lucide:sliders",
	"lucide:user",
	"lucide:save",
}
for index, icon in ipairs(linkedIcons) do
	local itemIndex = index
	table.insert(linkedItems, {
		Text = ("Linked Button %02d"):format(itemIndex),
		Icon = icon,
		Callback = function()
			print("Linked", itemIndex)
		end,
	})
end
overview:AddButtonLink({
	ButtonHeight = 34,
	Buttons = linkedItems,
})

local player = main:CreateSection("Player", {
	Icon = "lucide:user",
})

local movement = player:AddGroupBox({
	Title = "Movement GroupBox",
	Icon = "lucide:sliders",
	Glass = false,
	Transparency = 0.03,
})

movement:AddToggle({
	Title = "Sprint",
	Flag = "sprint",
	Default = true,
	Callback = function(value)
		print("Sprint:", value)
	end,
})

movement:AddSlider({
	Title = "Walk Speed",
	Flag = "walk_speed",
	Min = 8,
	Max = 32,
	Default = 16,
	Decimals = 0,
	Callback = function(value)
		print("Walk speed:", value)
	end,
})

movement:AddStepper({
	Title = "Jump Power",
	Flag = "jump_power",
	Min = 25,
	Max = 120,
	Step = 5,
	Default = 50,
})

local modes = player:AddGroupTabs({
	Title = "GroupBox Tabs",
	Icon = "lucide:folder",
	IconOnly = true,
})

local normalTab = modes:AddTab({
	Title = "Normal",
	Icon = "lucide:home",
})
normalTab:AddCheckbox({
	Title = "Auto Equip",
	Flag = "auto_equip",
	Default = true,
})
normalTab:AddProgress({
	Title = "Loading Preview",
	Flag = "loading_preview",
	Default = 0.64,
})

local advancedTab = modes:AddTab({
	Title = "Advanced",
	Icon = "lucide:settings",
})
advancedTab:AddSegmented({
	Flag = "quality_mode",
	Values = { "Low", "Med", "High" },
	Default = "Med",
})
advancedTab:AddMultiDropdown({
	Title = "Enabled Modules",
	Flag = "modules",
	Style = "card",
	Values = {
		{ Title = "ESP", Desc = "Draw player overlays", Icon = "lucide:target", Value = "ESP" },
		{ Title = "Trail", Desc = "Movement path preview", Icon = "lucide:sparkles", Value = "Trail" },
		{ Title = "Hitbox", Desc = "Hitbox helper", Icon = "lucide:sliders", Value = "Hitbox" },
		{ Title = "Sound", Desc = "Sound cues", Icon = "lucide:bell", Value = "Sound" },
	},
	Default = { "ESP", "Sound" },
})

local aim = combat:CreateSection("Aim Assist", {
	Icon = "lucide:target",
})

aim:AddToggle({
	Title = "Enabled",
	Flag = "aim_enabled",
	Default = false,
})

aim:AddSlider({
	Title = "Field of View",
	Flag = "aim_fov",
	Min = 20,
	Max = 360,
	Default = 120,
})

aim:AddDropdown({
	Title = "Target Part",
	Flag = "target_part",
	Style = "card",
	Values = {
		{ Title = "Head", Desc = "Highest priority", Icon = "lucide:target", Value = "Head" },
		{ Title = "UpperTorso", Desc = "Stable center aim", Icon = "lucide:user", Value = "UpperTorso" },
		{
			Title = "HumanoidRootPart",
			Desc = "Root part target",
			Icon = "lucide:crosshair",
			Value = "HumanoidRootPart",
		},
	},
	Default = "Head",
})

aim:AddCard({
	Title = "Mobile Note",
	Icon = "lucide:target",
	Content = "On small screens the tab list becomes horizontal and the window behaves like a fixed bottom sheet.",
})

local profile = settings:CreateSection("Profile", {
	Icon = "lucide:user",
})

local windowsSettings = settings:CreateSection("Windows Settings", {
	Icon = "lucide:settings",
})

windowsSettings:AddCard({
	Title = "Accent Personalization",
	Icon = "lucide:palette",
	Accent = Color3.fromRGB(0, 120, 212),
	Content = "Windows 11 inspired settings surface with custom color controls.",
})

windowsSettings:AddButtonLink({
	Buttons = {
		{ Text = "Appearance", Icon = "lucide:palette" },
		{ Text = "Controls", Icon = "lucide:sliders" },
		{ Text = "Shortcuts", Icon = "lucide:keyboard" },
	},
})

profile:AddTextbox({
	Title = "Display Name",
	Flag = "display_name",
	Placeholder = "Your name",
	Default = "Player",
	SubmitOnly = true,
})

profile:AddKeybind({
	Title = "Toggle UI",
	Flag = "toggle_key",
	Default = Enum.KeyCode.RightShift,
	Callback = function()
		window:Toggle()
	end,
})

profile:AddColorPicker({
	Title = "Accent Color",
	Flag = "accent_color",
	Default = Color3.fromRGB(0, 120, 212),
	Height = 150,
	Callback = function(color)
		print("Selected color:", color)
	end,
})

local config = settings:CreateSection("Config", {
	Icon = "lucide:save",
})

config:AddButton({
	Text = "Print Config",
	Icon = "lucide:search",
	Callback = function()
		print(game:GetService("HttpService"):JSONEncode(window:GetConfig()))
	end,
})

config:AddButton({
	Text = "Save Config",
	Icon = "lucide:save",
	Callback = function()
		local saved = window:SaveToFile("more-ui-demo.json")
		window:Notify({
			Title = "Config",
			Content = saved and "Saved to more-ui-demo.json" or "writefile is unavailable here.",
			Icon = "lucide:save",
		})
	end,
})

config:AddButton({
	Text = "Load Config",
	Icon = "lucide:folder",
	Callback = function()
		local loaded = window:LoadFromFile("more-ui-demo.json")
		window:Notify({
			Title = "Config",
			Content = loaded and "Loaded config." or "No saved config found.",
			Icon = "lucide:folder",
		})
	end,
})

window:Notify({
	Title = "More UI Library",
	Content = "Loaded demo. Press the top-left button or RightShift to toggle.",
	Icon = "lucide:home",
	Duration = 4,
})
