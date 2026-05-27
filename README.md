# More UI Library

A Roblox Luau UI library inspired by Windows 11 and liquid glass/mobile bottom-sheet UI.

## Files

- `MoreUILibrary.lua` - reusable library module.
- `Demo.client.lua` - LocalScript example using tabs, cards, group boxes, group tabs, and all major controls.
- `Assets/moreui-liquid-texture.png` - generated Windows-style texture used by `TexturePath`.
- `Assets/control-texture.png` - generated subtle control texture for buttons, dropdowns, inputs, color pickers, and menus.
- `Assets/slider-texture.png`, `Assets/dropdown-texture.png`, `Assets/button-link-texture.png` - generated special textures for upgraded controls.
- `Assets/button-texture.png`, `Assets/highlight-button-texture.png`, `Assets/open-button-texture.png` - generated textures for normal buttons, highlight actions, and the floating open button.
- `Assets/button-link-top.png`, `Assets/button-link-center.png`, `Assets/button-link-bottom.png` - generated linked-button state textures for long linked groups.
- `Assets/key-card-texture.png`, `Assets/key-banner-texture.png`, `Assets/key-thumbnail-texture.png`, `Assets/loading-card-texture.png` - generated key system and loading window textures.
- `Assets/window11-background.png` - generated Windows 11 style background used behind the liquid glass shell.
- `Assets/generated-icon-sheet-v1.png` - generated source sheet for custom UI icons.
- `Assets/GeneratedIcons/*.png` - generated PNG assets for the window button, library mark, controls, toggles, steppers, and Window11 icon set.

## Quick Start

Put `MoreUILibrary.lua` in a ModuleScript named `MoreUILibrary`, then require it from a LocalScript:

```lua
local MoreUI = require(script.Parent.MoreUILibrary)

MoreUI:KeySystem({
	Enabled = true,
	Key = "moreui",
	Title = "My Hub",
	Subtitle = "Windows 11 loader",
	IconHubName = "My Hub",
})

local window = MoreUI:CreateWindow({
	Title = "My Hub",
	Subtitle = "Liquid Glass",
	ToggleKey = Enum.KeyCode.RightShift,
	TopInset = 72,
	BackgroundBlurSize = 10,
	OpenButtonPosition = UDim2.fromOffset(92, 86),
	SidebarCompact = true,
	IconHubName = "My Hub",
	Window11Icons = true,
	WindowBackgroundTransparency = 0.64,
	ControlTextureTransparency = 0.84,
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
- The floating open button now uses `open-button-texture` by default for a linked-button style glass surface.
- `SidebarCompact = true` makes main tabs icon-only and gives more room to page content.
- Window 11 generated icons are built in by default for `OpenIcon`, `LibraryIcon`, `MinimizeIcon`, `CloseIcon`, toggle icons/images, and stepper icons. Override any of them only when you need a custom asset.
- Clicking the user card opens `ShowUserTabs()`, a small Windows 11 style user tab panel.
- `MoreUI.Window11Asset(name)` downloads generated UI assets from GitHub and caches them to `{IconHubName}/Asset/Window11/{name}.png` with `writefile`.
- `BackgroundBlurSize` controls the Roblox `BlurEffect` while the window is open. Set `BackgroundBlur = false` or `Blur = false` to disable it.
- Main tab switching uses a slide/scale transition with a liquid-glass blur overlay instead of fading every element.
- `WindowBackgroundAsset` applies a generated Windows 11 style background under the liquid glass shell.
- `Window11Icons = true` maps common Lucide/Solar icon names to generated Window11 PNG icons. You can also call `MoreUI.Window11Icon("home")`.
- `ControlTextureAsset` applies a subtle custom texture across controls. Set `ControlTexture = false` to disable it globally, or pass `Texture = false` on a row/container option to skip it locally.
- `AddButtonLink` automatically uses `button-link-top`, `button-link-center`, and `button-link-bottom`, so linked groups with 2, 3, 9, or more buttons stay connected.
- `AddButton` and `AddHighlightButton` use generated `button-texture` and `highlight-button-texture` unless disabled with `TextureAsset = false`.
- `MoreUI:KeySystem(options)` shows a built-in Windows 11 key gate with generated banner, thumbnail, loading window, and asset-backed controls before creating the main UI.
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
-- Optional overrides. These are already the defaults when Window11Icons is not false.
OpenIcon = MoreUI.Window11Asset("window")
LibraryIcon = MoreUI.Window11Asset("library-symbol")
ControlTextureAsset = MoreUI.Window11Asset("control-texture")
WindowBackgroundAsset = MoreUI.Window11Asset("window11-background")
HomeIcon = MoreUI.Window11Icon("home")
```

For full toggle-switch image assets, use:

```lua
ToggleStyle = "image"
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
- `AddHighlightButton({ Text, Icon, Callback })`
- `AddButtonLink({ ButtonHeight, Buttons = { { Text, Icon, Callback }, ... } })`
- `AddToggle({ Title, Flag, Default, ToggleOnImage, ToggleOffImage, Callback })`
- `KeySystem({ Key, Keys, Validate, Title, Subtitle, BannerAsset, ThumbnailAsset })`
- `ShowUserTabs({ Tabs })`
- `ShowLoading({ Title, Content })`
- `Dialog({ Title, Content, Icon, Actions })`
- `Popup({ Title, Content, Actions })`
- `ShowKeybindMenu({ Title, Current, Keys, Callback })`
- `AddCheckbox({ Title, Flag, Default, Callback })`
- `AddSlider({ Title, Flag, Min, Max, Default, Decimals, Callback })`
- `AddStepper({ Title, Flag, Min, Max, Step, Default, Callback })`
- `AddDropdown({ Title, Flag, Values, Default, Multi, Style = "card", Callback })`
- `AddMultiDropdown({ Title, Flag, Values, Default, Style = "card", Callback })`
- `AddTextbox({ Title, Flag, Placeholder, Default, SubmitOnly, Callback })`
- `AddKeybind({ Title, Flag, Default, Changed, Callback })`
- `AddColorPicker({ Title, Flag, Default, Colors, Height, Callback })`
- `AddProgress({ Title, Flag, Default })`
- `AddSegmented({ Flag, Values, Default, Callback })`
- `AddDivider()`
- `AddGroupBox({ Title, Icon })`
- `AddGroupTabs({ Title, Icon, IconOnly })`

## GroupBox Tabs

```lua
local groupTabs = section:AddGroupTabs({
	Title = "Modes",
	Icon = "lucide:folder",
	IconOnly = true,
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
