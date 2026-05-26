# More UI Library

A Roblox Luau UI library inspired by Windows 11 and liquid glass/mobile bottom-sheet UI.

## Files

- `MoreUILibrary.lua` - reusable library module.
- `Demo.client.lua` - LocalScript example using tabs, cards, group boxes, group tabs, and all major controls.
- `Assets/moreui-liquid-texture.png` - generated Windows-style texture used by `TexturePath`.
- `Assets/generated-icon-sheet-v1.png` - generated source sheet for custom UI icons.
- `Assets/GeneratedIcons/*.png` - generated PNG assets for the window button, library mark, controls, toggles, and steppers.

## Quick Start

Put `MoreUILibrary.lua` in a ModuleScript named `MoreUILibrary`, then require it from a LocalScript:

```lua
local MoreUI = require(script.Parent.MoreUILibrary)

local window = MoreUI:CreateWindow({
	Title = "My Hub",
	Subtitle = "Liquid Glass",
	ToggleKey = Enum.KeyCode.RightShift,
	TopInset = 72,
	OpenButtonPosition = UDim2.fromOffset(92, 86),
	OpenIcon = MoreUI.Window11Asset("window"),
	LibraryIcon = MoreUI.Window11Asset("library-symbol"),
	MinimizeIcon = MoreUI.Window11Asset("minimize-symbol"),
	CloseIcon = MoreUI.Window11Asset("close-symbol"),
	ToggleOnIcon = MoreUI.Window11Asset("check-symbol"),
	ToggleOffIcon = MoreUI.Window11Asset("x-symbol"),
	ToggleOnImage = MoreUI.Window11Asset("toggle-switch-on"),
	ToggleOffImage = MoreUI.Window11Asset("toggle-switch-off"),
	StepperPlusIcon = MoreUI.Window11Asset("plus-symbol"),
	StepperMinusIcon = MoreUI.Window11Asset("minus-symbol"),
	IconHubName = "My Hub",
	TextureAsset = MoreUI.Window11Asset("moreui-liquid-texture"),
	TexturePath = "Assets/moreui-liquid-texture.png",
	TextureTransparency = 0.72,
	Dark = false,
	User = {
		Role = "Mobile Ready",
	},
})

local tab = window:CreateTab("Main", "lucide:home")
local section = tab:CreateSection("Player", {
	Icon = "lucide:user",
})

section:AddCard({
	Title = "Player Tools",
	Icon = "lucide:sliders",
	Content = "Card UI with glass, reflection, and click callback support.",
})

section:AddToggle({
	Title = "Sprint",
	Flag = "sprint",
	Default = true,
})
```

## Window Behavior

- Fixed window, no dragging.
- Mobile responsive bottom-sheet layout.
- Opens from below with animation.
- Smaller default window and lighter corner radius.
- `TopInset` keeps the UI below the Roblox topbar. Use `64-82` on mobile landscape; increase only if it touches the Roblox top menu.
- Top-left open button defaults below the Roblox menu area and uses a Windows-style icon.
- `LibraryIcon`, `OpenIcon`, `MinimizeIcon`, `CloseIcon`, `ToggleOnIcon`, `ToggleOffIcon`, `ToggleOnImage`, `ToggleOffImage`, `StepperPlusIcon`, and `StepperMinusIcon` can each use separate image assets.
- `MoreUI.Window11Asset(name)` downloads generated UI assets from GitHub and caches them to `{IconHubName}/Asset/Window11/{name}.png` with `writefile`.
- `TexturePath` can still point at a local `getcustomasset` texture as fallback for the panel background.
- Close/minimize hides the UI so the open button can bring it back.
- `ToggleKey` calls `window:Toggle()` instead of disabling the whole `ScreenGui`.

## Icons

Icons accept WindUI-like strings such as:

```lua
"lucide:home"
"lucide:settings"
"solar:user"
"Assets/GeneratedIcons/window.png"
"rbxassetid://123456789"
"https://example.com/icon.png"
MoreUI.Window11Asset("window")
```

For generated Windows 11 PNGs hosted on GitHub, use:

```lua
OpenIcon = MoreUI.Window11Asset("window")
LibraryIcon = MoreUI.Window11Asset("library-symbol")
```

For full toggle-switch image assets, use:

```lua
ToggleOnImage = MoreUI.Window11Asset("toggle-switch-on")
ToggleOffImage = MoreUI.Window11Asset("toggle-switch-off")
```

The default GitHub URL template is:

```lua
MoreUI.Window11AssetBaseUrl =
	"https://raw.githubusercontent.com/tanhoangviet/JUST-AN-UI-LIBRARY-/main/Assets/GeneratedIcons/{name}.png"
```

Icons are loaded as image assets. You can also pass an icon provider:

```lua
local window = MoreUI:CreateWindow({
	IconProvider = LucideIcons,
})
```

The provider can expose `GetAsset(name, size)`, `GetIcon(name, size)`, or be a function.

You can also register a custom pack:

```lua
MoreUI:AddIconPack("solar", {
	Home2Bold = "rbxassetid://92190299966310",
	FolderWithFilesBold = "rbxassetid://74631950400584",
})

local tab = window:CreateTab("Home", "solar:Home2Bold")
```

Remote icon URLs are preloaded and cached before the UI uses them when executor file APIs exist. The library uses `request`/`game:HttpGet`, then `writefile`, `isfile`, and `getcustomasset`/`getsynasset`.

Cache path format:

```text
/{IconHubName}/Icons/{Lucide or Solar}/{icon-name}.png
```

Example:

```text
/My_Hub/Icons/Lucide/home.png
```

You can provide URL templates too:

```lua
MoreUI:SetIconUrlTemplate("lucide", function(name)
	return ("https://raw.githubusercontent.com/tijnepema/lucide-roblox/master/icons/processed/24px/%s.png"):format(name)
end)
```

## Elements

- `CreateTab(name, icon)`
- `CreateSection(title, { Icon })`
- `AddParagraph({ Title, Content, Icon })`
- `AddCard({ Title, Content, Icon, Callback })`
- `AddButton({ Text, Icon, Callback })`
- `AddToggle({ Title, Flag, Default, ToggleOnImage, ToggleOffImage, Callback })`
- `AddCheckbox({ Title, Flag, Default, Callback })`
- `AddSlider({ Title, Flag, Min, Max, Default, Decimals, Callback })`
- `AddStepper({ Title, Flag, Min, Max, Step, Default, Callback })`
- `AddDropdown({ Title, Flag, Values, Default, Callback })`
- `AddMultiDropdown({ Title, Flag, Values, Default, Callback })`
- `AddTextbox({ Title, Flag, Placeholder, Default, SubmitOnly, Callback })`
- `AddKeybind({ Title, Flag, Default, Changed, Callback })`
- `AddColorPicker({ Title, Flag, Default, Colors, Height, Callback })`
- `AddProgress({ Title, Flag, Default })`
- `AddSegmented({ Flag, Values, Default, Callback })`
- `AddDivider()`
- `AddGroupBox({ Title, Icon })`
- `AddGroupTabs({ Title, Icon })`

## GroupBox Tabs

```lua
local groupTabs = section:AddGroupTabs({
	Title = "Modes",
	Icon = "lucide:folder",
})

local normal = groupTabs:AddTab({
	Title = "Normal",
	Icon = "lucide:home",
})

normal:AddToggle({
	Title = "Enabled",
	Flag = "normal_enabled",
})
```

## Flags And Config

```lua
print(window:GetFlag("sprint"))
window:SetFlag("sprint", false)

local data = window:GetConfig()
window:LoadConfig(data)
window:SaveToFile("my-config.json")
window:LoadFromFile("my-config.json")
```

`SaveToFile` and `LoadFromFile` require executor-style `writefile`, `readfile`, and `isfile`. In normal Roblox Studio, use `GetConfig` and store the table through your own server/DataStore flow.
