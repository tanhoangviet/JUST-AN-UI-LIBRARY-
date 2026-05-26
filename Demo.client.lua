-- Demo LocalScript for More UI Library.
-- Put MoreUILibrary.lua in a ModuleScript named MoreUILibrary, then require it.

local MoreUI = require(script.Parent.MoreUILibrary)

local GeneratedIcons = {
	Window = "Assets/GeneratedIcons/window.png",
	WindowSymbol = "Assets/GeneratedIcons/window-symbol.png",
	Library = "Assets/GeneratedIcons/library-symbol.png",
	Minimize = "Assets/GeneratedIcons/minimize-symbol.png",
	Close = "Assets/GeneratedIcons/close-symbol.png",
	Check = "Assets/GeneratedIcons/check-symbol.png",
	X = "Assets/GeneratedIcons/x-symbol.png",
	Plus = "Assets/GeneratedIcons/plus-symbol.png",
	Minus = "Assets/GeneratedIcons/minus-symbol.png",
	ToggleOn = "Assets/GeneratedIcons/toggle-on.png",
	ToggleOff = "Assets/GeneratedIcons/toggle-off.png",
	ToggleSwitchOn = "Assets/GeneratedIcons/toggle-switch-on.png",
	ToggleSwitchOff = "Assets/GeneratedIcons/toggle-switch-off.png",
}

local window = MoreUI:CreateWindow({
	Title = "More UI Library",
	Subtitle = "Liquid Glass mobile demo",
	Size = UDim2.fromOffset(660, 500),
	MobileHeight = 600,
	TopInset = 72,
	ToggleKey = Enum.KeyCode.RightShift,
	OpenButtonPosition = UDim2.fromOffset(92, 86),
	OpenIcon = { Path = GeneratedIcons.Window, PreserveColor = true },
	LibraryIcon = { Path = GeneratedIcons.Library, PreserveColor = true },
	MinimizeIcon = { Path = GeneratedIcons.Minimize, PreserveColor = true },
	CloseIcon = { Path = GeneratedIcons.Close, PreserveColor = true },
	ToggleOnIcon = { Path = GeneratedIcons.Check, PreserveColor = true },
	ToggleOffIcon = { Path = GeneratedIcons.X, PreserveColor = true },
	ToggleOnImage = { Path = GeneratedIcons.ToggleSwitchOn, PreserveColor = true },
	ToggleOffImage = { Path = GeneratedIcons.ToggleSwitchOff, PreserveColor = true },
	StepperPlusIcon = { Path = GeneratedIcons.Plus, PreserveColor = true },
	StepperMinusIcon = { Path = GeneratedIcons.Minus, PreserveColor = true },
	IconHubName = "More UI Library",
	TexturePath = "Assets/moreui-liquid-texture.png",
	TextureTransparency = 0.72,
	PreloadIcons = {
		GeneratedIcons.Window,
		GeneratedIcons.Library,
		GeneratedIcons.Minimize,
		GeneratedIcons.Close,
		GeneratedIcons.Check,
		GeneratedIcons.X,
		GeneratedIcons.Plus,
		GeneratedIcons.Minus,
		GeneratedIcons.ToggleOn,
		GeneratedIcons.ToggleOff,
		GeneratedIcons.ToggleSwitchOn,
		GeneratedIcons.ToggleSwitchOff,
		"lucide:home",
		"lucide:settings",
		"lucide:crosshair",
		"lucide:folder",
		"lucide:palette",
		"lucide:sparkles",
		"lucide:minus",
		"lucide:x",
		"lucide:check",
		"lucide:plus",
	},
	Dark = false,
	User = {
		Role = "Mobile Ready",
	},
})

local main = window:CreateTab("Main", "lucide:home")
local combat = window:CreateTab("Combat", "lucide:target")
local settings = window:CreateTab("Settings", "lucide:settings")

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
	Values = { "ESP", "Trail", "Hitbox", "Sound" },
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
	Values = { "Head", "UpperTorso", "HumanoidRootPart" },
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
