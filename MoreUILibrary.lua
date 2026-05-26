-- More UI Library
-- Windows 11 / Liquid Glass inspired Roblox UI library.

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local Lighting = game:GetService("Lighting")

local LocalPlayer = Players.LocalPlayer

local MoreUI = {}
MoreUI.__index = MoreUI
MoreUI.Version = "2.1.0"
MoreUI.IconPacks = {}
MoreUI.IconUrlTemplates = {
	lucide = "https://raw.githubusercontent.com/tijnepema/lucide-roblox/master/icons/processed/{size}px/{name}.png",
}
MoreUI.Window11AssetBaseUrl =
	"https://raw.githubusercontent.com/tanhoangviet/JUST-AN-UI-LIBRARY-/main/Assets/GeneratedIcons/{name}.png"
MoreUI.Window11AssetUrls = {
	["button-link-bottom"] = "https://raw.githubusercontent.com/tanhoangviet/JUST-AN-UI-LIBRARY-/main/Assets/button-link-bottom.png",
	["button-link-center"] = "https://raw.githubusercontent.com/tanhoangviet/JUST-AN-UI-LIBRARY-/main/Assets/button-link-center.png",
	["button-link-texture"] = "https://raw.githubusercontent.com/tanhoangviet/JUST-AN-UI-LIBRARY-/main/Assets/button-link-texture.png",
	["button-link-top"] = "https://raw.githubusercontent.com/tanhoangviet/JUST-AN-UI-LIBRARY-/main/Assets/button-link-top.png",
	["control-texture"] = "https://raw.githubusercontent.com/tanhoangviet/JUST-AN-UI-LIBRARY-/main/Assets/control-texture.png",
	["dropdown-texture"] = "https://raw.githubusercontent.com/tanhoangviet/JUST-AN-UI-LIBRARY-/main/Assets/dropdown-texture.png",
	["moreui-liquid-texture"] = "https://raw.githubusercontent.com/tanhoangviet/JUST-AN-UI-LIBRARY-/main/Assets/moreui-liquid-texture.png",
	["slider-texture"] = "https://raw.githubusercontent.com/tanhoangviet/JUST-AN-UI-LIBRARY-/main/Assets/slider-texture.png",
	["window11-background"] = "https://raw.githubusercontent.com/tanhoangviet/JUST-AN-UI-LIBRARY-/main/Assets/window11-background.png",
}
MoreUI.Window11Icons = {
	bell = "w11-bell",
	combat = "w11-target",
	config = "w11-folder",
	crosshair = "w11-target",
	folder = "w11-folder",
	gear = "w11-settings",
	home = "w11-home",
	keyboard = "w11-keyboard",
	main = "w11-home",
	palette = "w11-palette",
	profile = "w11-user",
	save = "w11-save",
	search = "w11-search",
	settings = "w11-settings",
	sliders = "w11-sliders",
	["sliders-horizontal"] = "w11-sliders",
	sparkles = "w11-sparkles",
	target = "w11-target",
	user = "w11-user",
}
MoreUI.Window11Defaults = {
	OpenIcon = { Window11 = "window", PreserveColor = true },
	LibraryIcon = { Window11 = "library-symbol", PreserveColor = true },
	MinimizeIcon = { Window11 = "minimize-symbol", PreserveColor = true },
	CloseIcon = { Window11 = "close-symbol", PreserveColor = true },
	ToggleOnIcon = { Window11 = "check-symbol", PreserveColor = true },
	ToggleOffIcon = { Window11 = "x-symbol", PreserveColor = true },
	ToggleOnImage = { Window11 = "toggle-switch-on", PreserveColor = true },
	ToggleOffImage = { Window11 = "toggle-switch-off", PreserveColor = true },
	StepperPlusIcon = { Window11 = "plus-symbol", PreserveColor = true },
	StepperMinusIcon = { Window11 = "minus-symbol", PreserveColor = true },
}
MoreUI.Window11DefaultPreload = {
	MoreUI.Window11Defaults.OpenIcon,
	MoreUI.Window11Defaults.LibraryIcon,
	MoreUI.Window11Defaults.MinimizeIcon,
	MoreUI.Window11Defaults.CloseIcon,
	MoreUI.Window11Defaults.ToggleOnIcon,
	MoreUI.Window11Defaults.ToggleOffIcon,
	MoreUI.Window11Defaults.ToggleOnImage,
	MoreUI.Window11Defaults.ToggleOffImage,
	MoreUI.Window11Defaults.StepperPlusIcon,
	MoreUI.Window11Defaults.StepperMinusIcon,
	{ Window11 = "toggle-on" },
	{ Window11 = "toggle-off" },
	"lucide:home",
	"lucide:settings",
	"lucide:user",
	"lucide:bell",
	"lucide:folder",
	"lucide:save",
	"lucide:search",
	"lucide:palette",
	"lucide:sliders-horizontal",
	"lucide:crosshair",
	"lucide:swords",
	"lucide:sparkles",
	"lucide:chevron-down",
	"lucide:x",
	"lucide:users",
	"lucide:app-window",
}

local Theme = {
	Background = Color3.fromRGB(244, 246, 250),
	Surface = Color3.fromRGB(255, 255, 255),
	SurfaceAlt = Color3.fromRGB(248, 250, 253),
	Control = Color3.fromRGB(255, 255, 255),
	Stroke = Color3.fromRGB(218, 224, 232),
	StrokeStrong = Color3.fromRGB(180, 190, 204),
	Text = Color3.fromRGB(26, 28, 32),
	MutedText = Color3.fromRGB(92, 99, 112),
	Accent = Color3.fromRGB(0, 120, 212),
	AccentHover = Color3.fromRGB(28, 139, 226),
	AccentSoft = Color3.fromRGB(219, 238, 255),
	AccentText = Color3.fromRGB(255, 255, 255),
	Danger = Color3.fromRGB(210, 47, 36),
	Success = Color3.fromRGB(26, 148, 76),
	Warning = Color3.fromRGB(230, 168, 31),
	Shadow = Color3.fromRGB(0, 0, 0),
	GlassTransparency = 0.13,
	GlassSoftTransparency = 0.16,
	ControlTransparency = 0.02,
	Radius = 10,
}

local DarkTheme = {
	Background = Color3.fromRGB(28, 30, 36),
	Surface = Color3.fromRGB(42, 45, 53),
	SurfaceAlt = Color3.fromRGB(50, 54, 63),
	Control = Color3.fromRGB(56, 61, 72),
	Stroke = Color3.fromRGB(78, 86, 101),
	StrokeStrong = Color3.fromRGB(114, 126, 148),
	Text = Color3.fromRGB(246, 248, 252),
	MutedText = Color3.fromRGB(178, 186, 200),
	Accent = Color3.fromRGB(94, 174, 255),
	AccentHover = Color3.fromRGB(125, 191, 255),
	AccentSoft = Color3.fromRGB(37, 68, 98),
	AccentText = Color3.fromRGB(10, 18, 28),
	Danger = Color3.fromRGB(255, 105, 92),
	Success = Color3.fromRGB(86, 214, 136),
	Warning = Color3.fromRGB(255, 204, 88),
	Shadow = Color3.fromRGB(0, 0, 0),
	GlassTransparency = 0.24,
	GlassSoftTransparency = 0.2,
	ControlTransparency = 0.06,
	Radius = 10,
}

local IconAliases = {
	["lucide:gear"] = "lucide:settings",
	["lucide:aim"] = "lucide:crosshair",
	["lucide:combat"] = "lucide:swords",
	["lucide:config"] = "lucide:folder",
	["lucide:sliders"] = "lucide:sliders-horizontal",
	["lucide:window"] = "lucide:panel-top",
	["lucide:windows"] = "lucide:panel-top",
	["lucide:main"] = "lucide:home",
	["lucide:color"] = "lucide:palette",
	["lucide:close"] = "lucide:x",
	["lucide:remove"] = "lucide:minus",
	["lucide:add"] = "lucide:plus",
	["lucide:on"] = "lucide:check",
	["lucide:off"] = "lucide:x",
	["lucide:target"] = "lucide:crosshair",
	["lucide:sparkle"] = "lucide:sparkles",
	gear = "lucide:settings",
	aim = "lucide:crosshair",
	combat = "lucide:swords",
	config = "lucide:folder",
	main = "lucide:home",
	color = "lucide:palette",
	close = "lucide:x",
	remove = "lucide:minus",
	add = "lucide:plus",
	on = "lucide:check",
	off = "lucide:x",
	window = "lucide:panel-top",
	windows = "lucide:panel-top",
}

local Fast = TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local Smooth = TweenInfo.new(0.24, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
local WindowAnim = TweenInfo.new(0.26, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
local ElementAnim = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

local function mergeTheme(base, overrides)
	local out = {}
	for key, value in pairs(base) do
		out[key] = value
	end
	if overrides then
		for key, value in pairs(overrides) do
			out[key] = value
		end
	end
	return out
end

local function mergeMap(base, overrides)
	local out = {}
	for key, value in pairs(base or {}) do
		out[key] = value
	end
	for key, value in pairs(overrides or {}) do
		out[key] = value
	end
	return out
end

local function defaultWindow11Option(options, key, fallback)
	if options and options[key] ~= nil then
		return options[key]
	end
	if options and (options.Window11Defaults == false or options.Window11Icons == false) then
		return fallback
	end
	return MoreUI.Window11Defaults[key] or fallback
end

local function tween(instance, info, props)
	local t = TweenService:Create(instance, info, props)
	t:Play()
	return t
end

local function new(className, props, children)
	local inst = Instance.new(className)
	if props then
		for key, value in pairs(props) do
			inst[key] = value
		end
	end
	if children then
		for _, child in ipairs(children) do
			child.Parent = inst
		end
	end
	return inst
end

local function corner(radius)
	return new("UICorner", { CornerRadius = UDim.new(0, radius) })
end

local function stroke(color, transparency, thickness)
	return new("UIStroke", {
		Color = color,
		Transparency = transparency or 0,
		Thickness = thickness or 1,
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
	})
end

local function padding(px)
	return new("UIPadding", {
		PaddingTop = UDim.new(0, px),
		PaddingBottom = UDim.new(0, px),
		PaddingLeft = UDim.new(0, px),
		PaddingRight = UDim.new(0, px),
	})
end

local function listLayout(gap, horizontal)
	return new("UIListLayout", {
		FillDirection = horizontal and Enum.FillDirection.Horizontal or Enum.FillDirection.Vertical,
		SortOrder = Enum.SortOrder.LayoutOrder,
		Padding = UDim.new(0, gap),
	})
end

local function safeCall(callback, ...)
	if callback then
		task.spawn(function(...)
			local ok, err = pcall(callback, ...)
			if not ok then
				warn("[MoreUI] callback error:", err)
			end
		end, ...)
	end
end

local function makeText(props, children)
	local defaults = {
		BackgroundTransparency = 1,
		FontFace = Font.new("rbxasset://fonts/families/BuilderSans.json", Enum.FontWeight.Medium),
		TextSize = 14,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Center,
		TextWrapped = true,
	}
	for key, value in pairs(defaults) do
		if props[key] == nil then
			props[key] = value
		end
	end
	return new("TextLabel", props, children)
end

local function makeButton(props, children)
	local defaults = {
		AutoButtonColor = false,
		FontFace = Font.new("rbxasset://fonts/families/BuilderSans.json", Enum.FontWeight.Medium),
		TextSize = 14,
		TextWrapped = true,
	}
	for key, value in pairs(defaults) do
		if props[key] == nil then
			props[key] = value
		end
	end
	return new("TextButton", props, children)
end

local function sanitizeFileName(value)
	value = tostring(value or "icon")
	value = string.gsub(value, "^https?://", "")
	value = string.gsub(value, "[^%w%._%-]", "_")
	return value
end

local function getIconValue(icon)
	if typeof(icon) == "table" then
		return icon.Path or icon.Asset or icon.Image or icon.Window11 or icon.Name or icon.Icon or icon[1]
	end
	return icon
end

local function normalizeIconKey(icon)
	local rawIcon = getIconValue(icon)
	if typeof(rawIcon) ~= "string" then
		return nil
	end
	rawIcon = IconAliases[rawIcon] or IconAliases[string.lower(rawIcon)] or rawIcon
	local colon = string.find(rawIcon, ":", 1, true)
	if colon then
		rawIcon = string.sub(rawIcon, colon + 1)
	end
	rawIcon = string.lower(rawIcon)
	rawIcon = string.gsub(rawIcon, "_", "-")
	rawIcon = string.gsub(rawIcon, "%-bold$", "")
	rawIcon = string.gsub(rawIcon, "%-linear$", "")
	return rawIcon
end

local function getWindow11IconAssetName(icon)
	local key = normalizeIconKey(icon)
	if not key then
		return nil
	end
	if string.sub(key, 1, 4) == "w11-" then
		return key
	end
	return MoreUI.Window11Icons[key]
end

local function isLocalImagePath(value)
	if typeof(value) ~= "string" then
		return false
	end
	local lower = string.lower(value)
	if string.sub(lower, 1, 7) == "http://" or string.sub(lower, 1, 8) == "https://" then
		return false
	end
	return string.find(lower, "/", 1, true) ~= nil
		or string.match(lower, "%.png$") ~= nil
		or string.match(lower, "%.jpg$") ~= nil
		or string.match(lower, "%.jpeg$") ~= nil
		or string.match(lower, "%.webp$") ~= nil
end

local function normalizeIconName(icon)
	icon = getIconValue(icon)
	if typeof(icon) ~= "string" then
		return nil
	end
	icon = IconAliases[icon] or IconAliases[string.lower(icon)] or icon
	if string.find(icon, ":", 1, true) then
		local provider, name = string.match(icon, "^([^:]+):(.+)$")
		if provider and name then
			return string.lower(provider), string.gsub(string.lower(name), "_", "-"), icon
		end
	end
	return "lucide", string.gsub(string.lower(icon), "_", "-"), icon
end

local function getHttpRequest()
	return (typeof(request) == "function" and request)
		or (syn and syn.request)
		or http_request
		or (http and http.request)
end

local function getCustomAsset(path)
	if typeof(getcustomasset) == "function" then
		return getcustomasset(path)
	end
	if typeof(getsynasset) == "function" then
		return getsynasset(path)
	end
	return nil
end

local function readCachedAsset(path)
	if typeof(isfile) == "function" and isfile(path) then
		local asset = getCustomAsset(path)
		if asset then
			return asset
		end
	end
	return nil
end

local function downloadAsset(url, path)
	if typeof(writefile) ~= "function" then
		return nil
	end

	local cached = readCachedAsset(path)
	if cached then
		return cached
	end

	local requester = getHttpRequest()
	local body
	if requester then
		local ok, response = pcall(requester, {
			Url = url,
			Method = "GET",
		})
		if ok and response then
			body = response.Body or response.body
		end
	elseif game.HttpGet then
		local ok, response = pcall(function()
			return game:HttpGet(url)
		end)
		if ok then
			body = response
		end
	end

	if not body or body == "" then
		return nil
	end

	local folder = string.match(path, "^(.*)/[^/]+$")
	if folder and typeof(makefolder) == "function" then
		local current = ""
		for part in string.gmatch(folder, "[^/]+") do
			current = current == "" and part or (current .. "/" .. part)
			if typeof(isfolder) ~= "function" or not isfolder(current) then
				pcall(makefolder, current)
			end
		end
	end

	local ok = pcall(writefile, path, body)
	if not ok then
		return nil
	end
	return getCustomAsset(path)
end

local function resolveLocalAsset(path)
	if typeof(path) ~= "string" or path == "" then
		return nil
	end
	if string.sub(path, 1, 13) == "rbxassetid://" or string.sub(path, 1, 10) == "rbxasset://" then
		return path
	end
	if typeof(isfile) == "function" and isfile(path) then
		return getCustomAsset(path)
	end
	return nil
end

local function resolveTemplateUrl(library, packName, iconName, size)
	local templates = (library and library.IconUrlTemplates) or MoreUI.IconUrlTemplates
	if not templates then
		return nil
	end
	local template = templates[string.lower(packName or "")]
	if typeof(template) == "function" then
		return template(iconName, size)
	end
	if typeof(template) == "string" then
		local url = template
		url = string.gsub(url, "{name}", iconName)
		url = string.gsub(url, "{size}", tostring(size or 24))
		return url
	end
	return nil
end

local function getCachePath(library, packName, iconName)
	local hubName = (library and library.IconHubName) or (library and library.Title) or "MoreUI"
	local cacheRoot = (library and library.IconCacheFolder) or sanitizeFileName(hubName)
	local folderName = string.lower(packName) == "lucide" and "Lucide"
		or (string.lower(packName) == "solar" and "Solar" or sanitizeFileName(packName))
	return string.format("%s/Icons/%s/%s.png", cacheRoot, folderName, sanitizeFileName(iconName))
end

local function normalizePngName(name)
	name = sanitizeFileName(name)
	if not string.match(string.lower(name), "%.png$") then
		name = name .. ".png"
	end
	return name
end

local function stripPngExtension(name)
	name = tostring(name or "")
	return (string.gsub(name, "%.png$", ""))
end

local function getWindow11AssetCachePath(library, assetName)
	local hubName = (library and library.IconHubName) or (library and library.Title) or "MoreUI"
	local cacheRoot = (library and library.IconCacheFolder) or sanitizeFileName(hubName)
	return string.format("%s/Asset/Window11/%s", cacheRoot, normalizePngName(assetName))
end

local function getWindow11AssetFallbackPath(assetName)
	local cleanName = stripPngExtension(tostring(assetName or ""))
	if cleanName == "control-texture" then
		return "Assets/control-texture.png"
	end
	if cleanName == "button-link-texture" then
		return "Assets/button-link-texture.png"
	end
	if cleanName == "button-link-top" then
		return "Assets/button-link-top.png"
	end
	if cleanName == "button-link-center" then
		return "Assets/button-link-center.png"
	end
	if cleanName == "button-link-bottom" then
		return "Assets/button-link-bottom.png"
	end
	if cleanName == "dropdown-texture" then
		return "Assets/dropdown-texture.png"
	end
	if cleanName == "moreui-liquid-texture" then
		return "Assets/moreui-liquid-texture.png"
	end
	if cleanName == "slider-texture" then
		return "Assets/slider-texture.png"
	end
	if cleanName == "window11-background" then
		return "Assets/window11-background.png"
	end
	return "Assets/GeneratedIcons/" .. normalizePngName(cleanName)
end

local function resolveWindow11AssetUrl(library, assetName)
	local key = stripPngExtension(string.lower(tostring(assetName or "")))
	local urls = (library and library.Window11AssetUrls) or MoreUI.Window11AssetUrls
	if urls and urls[key] then
		return urls[key]
	end

	local template = (library and library.Window11AssetBaseUrl) or MoreUI.Window11AssetBaseUrl
	if typeof(template) == "function" then
		return template(stripPngExtension(assetName), assetName)
	end
	if typeof(template) == "string" then
		local url = template
		url = string.gsub(url, "{name}", stripPngExtension(assetName))
		url = string.gsub(url, "{file}", normalizePngName(assetName))
		return url
	end
	return nil
end

local function getWindow11Asset(library, asset, fallbackPath)
	local assetName = asset
	local url
	if typeof(asset) == "table" then
		url = asset.Url or asset.URL
		assetName = asset.Window11 or asset.Name or asset.AssetName or asset.File or asset[1] or url
		fallbackPath = fallbackPath or asset.FallbackPath or asset.Path
	end
	if typeof(assetName) ~= "string" or assetName == "" then
		return fallbackPath and resolveLocalAsset(fallbackPath) or nil
	end
	fallbackPath = fallbackPath or getWindow11AssetFallbackPath(assetName)

	local localAsset = resolveLocalAsset(assetName)
	if localAsset then
		return localAsset
	end

	if string.sub(assetName, 1, 7) == "http://" or string.sub(assetName, 1, 8) == "https://" then
		url = assetName
		assetName = string.match(assetName, "/([^/%?]+)%.png") or "asset"
	end
	url = url or resolveWindow11AssetUrl(library, assetName)
	if not url then
		return fallbackPath and resolveLocalAsset(fallbackPath) or nil
	end

	local assetPath = getWindow11AssetCachePath(library, assetName)
	return downloadAsset(url, assetPath) or (fallbackPath and resolveLocalAsset(fallbackPath) or nil)
end

local function getIconAsset(library, icon, size)
	if typeof(icon) == "number" then
		return "rbxassetid://" .. tostring(icon)
	end
	if typeof(icon) == "table" and (icon.Window11 or icon.AssetName or icon.Url or icon.URL) then
		local asset = getWindow11Asset(library, icon)
		if asset then
			return asset
		end
	end
	if library and library._options and library._options.Window11Icons ~= false then
		local window11Icon = getWindow11IconAssetName(icon)
		if window11Icon then
			local asset = getWindow11Asset(library, window11Icon)
			if asset then
				return asset
			end
		end
	end
	icon = getIconValue(icon)
	if typeof(icon) ~= "string" then
		return nil
	end
	if string.sub(icon, 1, 13) == "rbxassetid://" or string.sub(icon, 1, 10) == "rbxasset://" then
		return icon
	end
	if string.sub(icon, 1, 7) == "http://" or string.sub(icon, 1, 8) == "https://" then
		local extension = string.match(icon, "%.([%w]+)%??[^/]*$") or "png"
		local hubName = (library and library.IconHubName) or (library and library.Title) or "MoreUI"
		local cacheRoot = (library and library.IconCacheFolder) or sanitizeFileName(hubName)
		local path = string.format("%s/Icons/Remote/%s.%s", cacheRoot, sanitizeFileName(icon), extension)
		return downloadAsset(icon, path)
	end
	local localAsset = resolveLocalAsset(icon)
	if localAsset then
		return localAsset
	end
	if isLocalImagePath(icon) then
		return nil
	end
	local packName, iconName = normalizeIconName(icon)
	icon = IconAliases[icon] or IconAliases[string.lower(icon)] or icon

	if packName and iconName then
		local url = resolveTemplateUrl(library, packName, iconName, size)
		if url then
			local path = getCachePath(library, packName, iconName)
			local asset = downloadAsset(url, path)
			if asset then
				return asset
			end
		end

		local packs = (library and library.IconPacks) or MoreUI.IconPacks
		local pack = packs and packs[string.lower(packName)]
		if pack then
			local asset = pack[iconName] or pack[string.lower(iconName)]
			if asset then
				if typeof(asset) == "number" then
					return "rbxassetid://" .. tostring(asset)
				end
				return resolveLocalAsset(asset) or asset
			end
		end
	end

	local provider = library and library.IconProvider
	if provider then
		local name = icon
		local colon = string.find(name, ":", 1, true)
		if colon then
			name = string.sub(name, colon + 1)
		end

		local ok, asset = pcall(function()
			if typeof(provider) == "function" then
				return provider(icon, size)
			end
			if provider.GetAsset then
				local dotOk, dotAsset = pcall(provider.GetAsset, name, size)
				if dotOk and dotAsset then
					return dotAsset
				end
				local colonOk, colonAsset = pcall(function()
					return provider:GetAsset(name, size)
				end)
				if colonOk then
					return colonAsset
				end
			end
			if provider.GetIcon then
				local dotOk, dotAsset = pcall(provider.GetIcon, name, size)
				if dotOk and dotAsset then
					return dotAsset
				end
				local colonOk, colonAsset = pcall(function()
					return provider:GetIcon(name, size)
				end)
				if colonOk then
					return colonAsset
				end
			end
			return nil
		end)
		if ok and asset then
			if typeof(asset) == "number" then
				return "rbxassetid://" .. tostring(asset)
			end
			if typeof(asset) == "string" then
				return asset
			end
		end
	end

	return nil
end

local function createIcon(library, icon, props)
	props = props or {}
	local size = props.Size or UDim2.fromOffset(18, 18)
	local image = getIconAsset(library, icon, props.PixelSize or 24)
	local rawIcon = getIconValue(icon)
	local preserveColor = props.PreserveColor
	if preserveColor == nil and typeof(icon) == "table" then
		preserveColor = icon.PreserveColor or icon.FullColor or icon.OriginalColor
	end
	if preserveColor == nil then
		preserveColor = isLocalImagePath(rawIcon)
			or (
				library
				and library._options
				and library._options.Window11Icons ~= false
				and getWindow11IconAssetName(icon) ~= nil
			)
	end
	return new("ImageLabel", {
		Name = props.Name or "Icon",
		BackgroundTransparency = 1,
		Image = image or "",
		ImageColor3 = preserveColor and Color3.fromRGB(255, 255, 255)
			or props.Color
			or (library and library.Theme.Text)
			or Theme.Text,
		ImageTransparency = image and 0 or 1,
		ScaleType = Enum.ScaleType.Fit,
		Position = props.Position,
		AnchorPoint = props.AnchorPoint,
		Size = size,
		Parent = props.Parent,
		ZIndex = props.ZIndex,
	})
end

local function preloadIcon(library, icon, size)
	return getIconAsset(library, icon, size or 24)
end

local function createWindowLogo(props)
	props = props or {}
	local holder = new("Frame", {
		Name = props.Name or "WindowLogo",
		BackgroundTransparency = 1,
		Position = props.Position,
		AnchorPoint = props.AnchorPoint,
		Size = props.Size or UDim2.fromOffset(22, 22),
		Parent = props.Parent,
		ZIndex = props.ZIndex,
	})
	local color = props.Color or Color3.fromRGB(255, 255, 255)
	local gap = props.Gap or 2
	for row = 0, 1 do
		for column = 0, 1 do
			new("Frame", {
				Position = UDim2.new(column * 0.5, column == 0 and 0 or gap, row * 0.5, row == 0 and 0 or gap),
				Size = UDim2.new(0.5, -gap, 0.5, -gap),
				BackgroundColor3 = color,
				BorderSizePixel = 0,
				ZIndex = props.ZIndex,
				Parent = holder,
			}, {
				corner(2),
				new("UIGradient", {
					Rotation = 45,
					Color = ColorSequence.new(color, Color3.fromRGB(51, 151, 255)),
				}),
			})
		end
	end
	return holder
end

local function applyGlass(frame, theme, radius, strength, noReflection)
	frame.BackgroundColor3 = frame.BackgroundColor3 or theme.Surface
	frame.BackgroundTransparency = strength == "strong" and theme.GlassTransparency or theme.GlassSoftTransparency
	frame.BorderSizePixel = 0

	if not frame:FindFirstChildOfClass("UICorner") then
		corner(radius or 14).Parent = frame
	end
	if not frame:FindFirstChildOfClass("UIStroke") then
		stroke(theme.Stroke, strength == "strong" and 0.16 or 0.34, 1).Parent = frame
	end

	local gradient = new("UIGradient", {
		Name = "GlassGradient",
		Rotation = 90,
		Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
			ColorSequenceKeypoint.new(1, theme.Surface),
		}),
		Transparency = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 0.1),
			NumberSequenceKeypoint.new(1, 0.42),
		}),
		Parent = frame,
	})

	if noReflection then
		return gradient
	end

	local reflection = new("Frame", {
		Name = "Reflection",
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 0.74,
		BorderSizePixel = 0,
		Position = UDim2.new(0, 10, 0, 7),
		Size = UDim2.new(0.62, 0, 0, 2),
		ZIndex = (frame.ZIndex or 1) + 1,
		Parent = frame,
	}, {
		corner(2),
		new("UIGradient", {
			Rotation = 0,
			Transparency = NumberSequence.new({
				NumberSequenceKeypoint.new(0, 0.86),
				NumberSequenceKeypoint.new(0.35, 0.1),
				NumberSequenceKeypoint.new(1, 1),
			}),
		}),
	})

	return gradient, reflection
end

local function getControlTextureAsset(library)
	if not library then
		return nil
	end
	local options = library._options or {}
	if options.ControlTexture == false or options.ControlTextureAsset == false then
		return nil
	end
	if library.ControlTextureAsset ~= nil then
		return library.ControlTextureAsset ~= false and library.ControlTextureAsset or nil
	end

	local asset = getWindow11Asset(library, options.ControlTextureAsset or options.ControlTexture or "control-texture")
	library.ControlTextureAsset = asset or false
	return asset
end

local function applyControlTexture(library, frame, options)
	options = options or {}
	if options.Texture == false or options.ControlTexture == false then
		return nil
	end
	if not frame or frame:FindFirstChild("ControlTexture") then
		return nil
	end
	if
		options.AllowLayoutTexture ~= true
		and (
			frame:FindFirstChildOfClass("UIListLayout")
			or frame:FindFirstChildOfClass("UIGridLayout")
			or frame:FindFirstChildOfClass("UITableLayout")
		)
	then
		return nil
	end

	local asset = getControlTextureAsset(library)
	if not asset then
		return nil
	end

	local theme = (library and library.Theme) or Theme
	local texture = new("ImageLabel", {
		Name = "ControlTexture",
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		Image = asset,
		ImageColor3 = options.TextureColor
			or (library and library._options and library._options.ControlTextureColor)
			or Color3.fromRGB(255, 255, 255),
		ImageTransparency = options.TextureTransparency
			or (library and library._options and library._options.ControlTextureTransparency)
			or ((library and library._options and library._options.Dark) and 0.9 or 0.84),
		ScaleType = options.ScaleType or Enum.ScaleType.Crop,
		ZIndex = options.ZIndex or (frame.ZIndex or 1),
		Parent = frame,
	}, {
		corner(options.Radius or theme.Radius),
	})
	return texture
end

local function applyWindowAssetTexture(library, frame, assetName, options)
	options = options or {}
	if not frame or options.Texture == false then
		return nil
	end
	local textureName = assetName or options.AssetName
	if not textureName then
		return nil
	end
	local asset = getWindow11Asset(library, textureName, options.FallbackPath)
	if not asset then
		return nil
	end
	local theme = (library and library.Theme) or Theme
	local texture = new("ImageLabel", {
		Name = options.Name or "WindowAssetTexture",
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		Image = asset,
		ImageTransparency = options.Transparency or 0.84,
		ImageColor3 = options.Color or Color3.fromRGB(255, 255, 255),
		ScaleType = options.ScaleType or Enum.ScaleType.Crop,
		ZIndex = options.ZIndex or (frame.ZIndex or 1),
		Parent = frame,
	}, {
		corner(options.Radius or theme.Radius),
	})
	return texture
end

local function setCanvasToContent(scroller, axis)
	local layout = scroller:FindFirstChildOfClass("UIListLayout")
	if not layout then
		return
	end
	scroller:SetAttribute("MoreUICanvasAxis", axis)

	local function update()
		local currentAxis = scroller:GetAttribute("MoreUICanvasAxis")
		if currentAxis == "X" then
			scroller.CanvasSize = UDim2.fromOffset(layout.AbsoluteContentSize.X + 18, 0)
		else
			scroller.CanvasSize = UDim2.fromOffset(0, layout.AbsoluteContentSize.Y + 18)
		end
	end

	update()
	if not scroller:GetAttribute("MoreUICanvasBound") then
		scroller:SetAttribute("MoreUICanvasBound", true)
		layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(update)
	end
end

local function addButtonMotion(button, normalColor, hoverColor, pressColor)
	local scale = button:FindFirstChildOfClass("UIScale") or new("UIScale", { Scale = 1, Parent = button })
	button.MouseEnter:Connect(function()
		tween(scale, Fast, { Scale = 1.015 })
		if hoverColor then
			tween(button, Fast, { BackgroundColor3 = hoverColor })
		end
	end)
	button.MouseLeave:Connect(function()
		tween(scale, Fast, { Scale = 1 })
		if normalColor then
			tween(button, Fast, { BackgroundColor3 = normalColor })
		end
	end)
	button.MouseButton1Down:Connect(function()
		tween(scale, Fast, { Scale = 0.975 })
		if pressColor then
			tween(button, Fast, { BackgroundColor3 = pressColor })
		end
	end)
	button.MouseButton1Up:Connect(function()
		tween(scale, Fast, { Scale = 1.015 })
		if hoverColor then
			tween(button, Fast, { BackgroundColor3 = hoverColor })
		end
	end)
end

local function addTitlebarButtonMotion(
	button,
	icon,
	normalColor,
	hoverColor,
	pressColor,
	normalIconColor,
	hoverIconColor
)
	local normalTransparency = button.BackgroundTransparency
	button.MouseEnter:Connect(function()
		tween(button, Fast, {
			BackgroundColor3 = hoverColor,
			BackgroundTransparency = 0,
		})
		if icon then
			tween(icon, Fast, { ImageColor3 = hoverIconColor or normalIconColor })
		end
	end)
	button.MouseLeave:Connect(function()
		tween(button, Fast, {
			BackgroundColor3 = normalColor,
			BackgroundTransparency = normalTransparency,
		})
		if icon then
			tween(icon, Fast, { ImageColor3 = normalIconColor })
		end
	end)
	button.MouseButton1Down:Connect(function()
		tween(button, Fast, {
			BackgroundColor3 = pressColor or hoverColor,
			BackgroundTransparency = 0,
		})
	end)
	button.MouseButton1Up:Connect(function()
		tween(button, Fast, {
			BackgroundColor3 = hoverColor,
			BackgroundTransparency = 0,
		})
	end)
end

local function getOrCreateScale(guiObject, name)
	local existing = guiObject:FindFirstChild(name)
	if existing and existing:IsA("UIScale") then
		return existing
	end
	return new("UIScale", {
		Name = name,
		Scale = 1,
		Parent = guiObject,
	})
end

local function playPageBlur(library)
	if not library then
		return
	end

	local overlay = library.PageBlurOverlay
	if overlay then
		local overlayScale = getOrCreateScale(overlay, "PageBlurScale")
		overlay.Visible = true
		overlay.BackgroundTransparency = 0.46
		overlayScale.Scale = 1.035
		tween(overlay, Smooth, { BackgroundTransparency = 1 })
		tween(overlayScale, Smooth, { Scale = 1 })
		task.delay(0.28, function()
			if overlay.Parent then
				overlay.Visible = false
			end
		end)
	end

	local blur = library.BackgroundBlur
	if blur and blur.Parent and library.Open then
		local baseSize = library._openBlurSize or 8
		tween(blur, Fast, { Size = baseSize + 4 })
		task.delay(0.12, function()
			if blur.Parent and library.Open then
				tween(blur, Smooth, { Size = baseSize })
			end
		end)
	end
end

local function animateGuiObject(guiObject, show, delayTime)
	if not guiObject or not guiObject:IsA("GuiObject") then
		return
	end
	local originalPosition = guiObject:GetAttribute("MoreUIBasePosition")
	if not originalPosition then
		originalPosition = guiObject.Position
		guiObject:SetAttribute("MoreUIBasePosition", originalPosition)
	end

	local hiddenPosition = UDim2.new(
		originalPosition.X.Scale,
		originalPosition.X.Offset,
		originalPosition.Y.Scale,
		originalPosition.Y.Offset + 12
	)

	if show then
		guiObject.Visible = true
		if guiObject:GetAttribute("MoreUIBaseTransparency") == nil then
			guiObject:SetAttribute("MoreUIBaseTransparency", guiObject.BackgroundTransparency)
		end
		guiObject.Position = hiddenPosition
		guiObject.BackgroundTransparency = math.min((guiObject:GetAttribute("MoreUIBaseTransparency") or 0) + 0.22, 1)
		task.delay(delayTime or 0, function()
			if guiObject.Parent then
				tween(guiObject, ElementAnim, {
					Position = originalPosition,
					BackgroundTransparency = guiObject:GetAttribute("MoreUIBaseTransparency")
						or guiObject.BackgroundTransparency,
				})
			end
		end)
	else
		if guiObject:GetAttribute("MoreUIBaseTransparency") == nil then
			guiObject:SetAttribute("MoreUIBaseTransparency", guiObject.BackgroundTransparency)
		end
		tween(guiObject, ElementAnim, {
			Position = hiddenPosition,
			BackgroundTransparency = 1,
		})
		task.delay(0.18, function()
			if guiObject.Parent then
				guiObject.Visible = false
				guiObject.Position = originalPosition
			end
		end)
	end
end

local function getViewport()
	local camera = workspace.CurrentCamera
	if camera then
		return camera.ViewportSize
	end
	return Vector2.new(1280, 720)
end

local function makeAvatarUrl(userId)
	if not userId or userId <= 0 then
		return ""
	end
	return string.format("rbxthumb://type=AvatarHeadShot&id=%d&w=150&h=150", userId)
end

function MoreUI:SetIconProvider(provider)
	self.IconProvider = provider
end

function MoreUI:AddIconPack(name, icons)
	self.IconPacks = self.IconPacks or {}
	self.IconPacks[string.lower(name)] = icons or {}
end

function MoreUI:SetIconUrlTemplate(name, template)
	self.IconUrlTemplates = self.IconUrlTemplates or {}
	self.IconUrlTemplates[string.lower(name)] = template
end

function MoreUI:PreloadIcons(icons, size)
	for _, icon in ipairs(icons or {}) do
		preloadIcon(self, icon, size or 24)
	end
end

function MoreUI.Window11Asset(name, options)
	options = options or {}
	return {
		Window11 = name,
		Url = options.Url,
		FallbackPath = options.FallbackPath,
		PreserveColor = options.PreserveColor ~= false,
	}
end

function MoreUI.Window11Icon(name, options)
	local key = normalizeIconKey(name) or tostring(name or "home")
	local assetName = getWindow11IconAssetName(name)
	if not assetName then
		assetName = string.sub(key, 1, 4) == "w11-" and key or ("w11-" .. key)
	end
	return MoreUI.Window11Asset(assetName, options)
end

function MoreUI:CreateWindow(options)
	options = options or {}

	local library = setmetatable({}, MoreUI)
	library.Title = options.Title or "More UI"
	library.Subtitle = options.Subtitle or "Liquid Glass UI"
	library.Theme = mergeTheme(options.Dark and DarkTheme or Theme, options.Theme)
	library.IconProvider = options.IconProvider or MoreUI.IconProvider
	library.IconPacks = options.IconPacks or MoreUI.IconPacks
	library.IconUrlTemplates = options.IconUrlTemplates or MoreUI.IconUrlTemplates
	library.Window11AssetBaseUrl = options.Window11AssetBaseUrl or MoreUI.Window11AssetBaseUrl
	library.Window11AssetUrls = mergeMap(MoreUI.Window11AssetUrls, options.Window11AssetUrls)
	library.IconHubName = options.IconHubName or options.Name or library.Title
	library.IconCacheFolder = options.IconCacheFolder or sanitizeFileName(library.IconHubName)
	library.Flags = {}
	library.Elements = {}
	library.Tabs = {}
	library.SelectedTab = nil
	library.SidebarCompact = options.SidebarCompact == true or options.CompactSidebar == true
	library.Open = options.Open ~= false
	library.ScreenGui = nil
	library._connections = {}
	library._options = options
	library._openBlurSize = options.BlurSize or options.BackgroundBlurSize or 8

	if options.BackgroundBlur ~= false and options.Blur ~= false then
		local backgroundBlur = new("BlurEffect", {
			Name = (options.Name or "MoreUILibrary") .. "BackgroundBlur",
			Enabled = false,
			Size = 0,
			Parent = Lighting,
		})
		library.BackgroundBlur = backgroundBlur
	end

	local parent = options.Parent
	if not parent then
		local playerGui = LocalPlayer and LocalPlayer:FindFirstChildOfClass("PlayerGui")
		parent = playerGui or game:GetService("CoreGui")
	end

	local screenGui = new("ScreenGui", {
		Name = options.Name or "MoreUILibrary",
		IgnoreGuiInset = true,
		ResetOnSpawn = false,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		Parent = parent,
	})
	library.ScreenGui = screenGui

	local notificationLayer = new("Frame", {
		Name = "Notifications",
		AnchorPoint = Vector2.new(1, 1),
		Position = UDim2.new(1, -16, 1, -16),
		Size = UDim2.fromOffset(330, 420),
		BackgroundTransparency = 1,
		ZIndex = 60,
		Parent = screenGui,
	}, {
		listLayout(10),
	})
	notificationLayer.UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
	library.NotificationLayer = notificationLayer

	local iconsToPreload = {
		defaultWindow11Option(options, "OpenIcon", "lucide:panel-top"),
		defaultWindow11Option(options, "LibraryIcon", "lucide:panel-top"),
		defaultWindow11Option(options, "MinimizeIcon", "lucide:minus"),
		defaultWindow11Option(options, "CloseIcon", "lucide:x"),
		defaultWindow11Option(options, "ToggleOnIcon", "lucide:check"),
		defaultWindow11Option(options, "ToggleOffIcon", "lucide:x"),
		defaultWindow11Option(options, "StepperPlusIcon", "lucide:plus"),
		defaultWindow11Option(options, "StepperMinusIcon", "lucide:minus"),
	}
	for _, asset in ipairs({
		defaultWindow11Option(options, "ToggleOnImage", options.ToggleOnAsset),
		defaultWindow11Option(options, "ToggleOffImage", options.ToggleOffAsset),
	}) do
		if asset then
			table.insert(iconsToPreload, asset)
		end
	end
	if options.Window11Defaults ~= false and options.Window11Icons ~= false then
		for _, icon in ipairs(MoreUI.Window11DefaultPreload) do
			table.insert(iconsToPreload, icon)
		end
	end
	for _, icon in ipairs(options.PreloadIcons or {}) do
		table.insert(iconsToPreload, icon)
	end
	library:PreloadIcons(iconsToPreload, 24)

	local openButton = makeButton({
		Name = "OpenButton",
		AnchorPoint = Vector2.new(0, 0),
		Position = options.OpenButtonPosition or UDim2.fromOffset(92, 86),
		Size = options.OpenButtonSize or UDim2.fromOffset(50, 50),
		Text = "",
		BackgroundColor3 = Color3.fromRGB(22, 24, 29),
		BackgroundTransparency = 0.08,
		TextColor3 = Color3.fromRGB(255, 255, 255),
		ZIndex = 80,
		Parent = screenGui,
	}, {
		corner(14),
		stroke(Color3.fromRGB(255, 255, 255), 0.78, 1),
	})
	applyControlTexture(library, openButton, {
		Radius = 14,
		TextureTransparency = 0.9,
	})
	local openIconName = defaultWindow11Option(options, "OpenIcon", "lucide:panel-top")
	if options.OpenIcon == "window" or options.OpenIcon == "windows" then
		openIconName = MoreUI.Window11Defaults.OpenIcon
	end
	createIcon(library, openIconName, {
		Parent = openButton,
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.fromOffset(24, 24),
		Color = Color3.fromRGB(255, 255, 255),
		ZIndex = 81,
	})
	addButtonMotion(openButton, Color3.fromRGB(22, 24, 29), Color3.fromRGB(35, 38, 45), Color3.fromRGB(8, 9, 12))
	library.OpenButton = openButton

	local shadow = new("ImageLabel", {
		Name = "Shadow",
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundTransparency = 1,
		Image = "rbxassetid://1316045217",
		ImageColor3 = library.Theme.Shadow,
		ImageTransparency = options.Dark and 0.54 or 0.8,
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(10, 10, 118, 118),
		ZIndex = 1,
		Parent = screenGui,
	})
	library.Shadow = shadow

	local softShadow = new("Frame", {
		Name = "SoftShadow",
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(0, 0, 0),
		BackgroundTransparency = options.Dark and 0.76 or 0.86,
		BorderSizePixel = 0,
		ZIndex = 1,
		Parent = screenGui,
	}, {
		corner(library.Theme.Radius + 4),
	})
	library.SoftShadow = softShadow

	local window = new("Frame", {
		Name = "Window",
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = library.Theme.Background,
		ClipsDescendants = true,
		ZIndex = 2,
		Parent = screenGui,
	})
	applyGlass(window, library.Theme, library.Theme.Radius + 2, "strong")
	new("UIScale", { Name = "WindowScale", Scale = 1, Parent = window })
	library.Window = window

	local animatedBackground = new("Frame", {
		Name = "AnimatedGradientBackground",
		Size = UDim2.fromScale(1, 1),
		BackgroundColor3 = library.Theme.Background,
		BackgroundTransparency = options.Dark and 0.34 or 0.18,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		ZIndex = 2,
		Parent = window,
	}, {
		corner(library.Theme.Radius + 2),
	})
	local windowBackgroundAsset
	if options.WindowBackgroundAsset ~= false and options.BackgroundAsset ~= false then
		windowBackgroundAsset = getWindow11Asset(
			library,
			options.WindowBackgroundAsset or options.BackgroundAsset or "window11-background",
			options.WindowBackgroundPath or "Assets/window11-background.png"
		)
	end
	if windowBackgroundAsset then
		local windowBackground = new("ImageLabel", {
			Name = "Window11Background",
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			Image = windowBackgroundAsset,
			ImageTransparency = options.WindowBackgroundTransparency or 0.64,
			ImageColor3 = options.Dark and Color3.fromRGB(170, 205, 255) or Color3.fromRGB(255, 255, 255),
			ScaleType = Enum.ScaleType.Crop,
			ZIndex = 2,
			Parent = animatedBackground,
		}, {
			corner(library.Theme.Radius + 2),
		})
		library.WindowBackground = windowBackground
	end
	local animatedGradient = new("UIGradient", {
		Name = "MovingGradient",
		Rotation = 18,
		Offset = Vector2.new(-0.65, 0),
		Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, library.Theme.Surface),
			ColorSequenceKeypoint.new(0.28, Color3.fromRGB(221, 239, 255)),
			ColorSequenceKeypoint.new(0.54, Color3.fromRGB(245, 235, 255)),
			ColorSequenceKeypoint.new(0.78, Color3.fromRGB(225, 252, 244)),
			ColorSequenceKeypoint.new(1, library.Theme.SurfaceAlt),
		}),
		Transparency = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 0.55),
			NumberSequenceKeypoint.new(0.45, 0.18),
			NumberSequenceKeypoint.new(1, 0.62),
		}),
		Parent = animatedBackground,
	})
	library.AnimatedGradient = animatedGradient
	local gradientForward = true
	local gradientAlive = true
	table.insert(library._connections, {
		Disconnect = function()
			gradientAlive = false
		end,
	})
	local function playGradient()
		if not gradientAlive or not animatedGradient.Parent then
			return
		end
		gradientForward = not gradientForward
		local targetOffset = gradientForward and Vector2.new(0.65, 0.12) or Vector2.new(-0.65, -0.08)
		local targetRotation = gradientForward and 32 or 14
		local gradientTween =
			tween(animatedGradient, TweenInfo.new(5.8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
				Offset = targetOffset,
				Rotation = targetRotation,
			})
		local connection
		connection = gradientTween.Completed:Connect(function()
			if connection then
				connection:Disconnect()
			end
			playGradient()
		end)
	end
	playGradient()

	local textureImage
	local textureAsset
	if options.TextureAsset ~= false then
		textureAsset = getWindow11Asset(
			library,
			options.TextureAsset or options.TextureWindow11Asset or "moreui-liquid-texture",
			options.TexturePath or "Assets/moreui-liquid-texture.png"
		)
	end
	textureAsset = textureAsset or resolveLocalAsset(options.TexturePath or "Assets/moreui-liquid-texture.png")
	if not textureAsset and options.TextureUrl then
		textureAsset = downloadAsset(options.TextureUrl, options.TexturePath or "Assets/moreui-liquid-texture.png")
	end
	if textureAsset then
		textureImage = new("ImageLabel", {
			Name = "TextureOverlay",
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			Image = textureAsset,
			ImageTransparency = options.TextureTransparency or 0.72,
			ImageColor3 = options.TextureColor or Color3.fromRGB(255, 255, 255),
			ScaleType = Enum.ScaleType.Crop,
			ZIndex = 2,
			Parent = window,
		}, {
			corner(library.Theme.Radius + 2),
		})
		library.TextureOverlay = textureImage
	end

	local topbar = new("Frame", {
		Name = "Topbar",
		Size = UDim2.new(1, 0, 0, 70),
		BackgroundColor3 = library.Theme.Surface,
		BackgroundTransparency = 0.04,
		BorderSizePixel = 0,
		ZIndex = 3,
		Parent = window,
	}, {
		new("UIGradient", {
			Rotation = 90,
			Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), library.Theme.SurfaceAlt),
			Transparency = NumberSequence.new({
				NumberSequenceKeypoint.new(0, 0.22),
				NumberSequenceKeypoint.new(1, 0.52),
			}),
		}),
		stroke(library.Theme.Stroke, 0.26, 1),
	})
	applyControlTexture(library, topbar, {
		Radius = library.Theme.Radius + 2,
		TextureTransparency = 0.9,
	})
	library.Topbar = topbar

	local libraryIcon = defaultWindow11Option(options, "LibraryIcon", nil)
	local titleOffset = libraryIcon and 48 or 18
	if libraryIcon then
		if libraryIcon == "window" or libraryIcon == "windows" then
			createWindowLogo({
				Parent = topbar,
				Position = UDim2.fromOffset(18, 18),
				Size = UDim2.fromOffset(22, 22),
				Color = library.Theme.Accent,
				ZIndex = 5,
			})
		else
			createIcon(library, libraryIcon, {
				Parent = topbar,
				Position = UDim2.fromOffset(18, 18),
				Size = UDim2.fromOffset(22, 22),
				Color = library.Theme.Accent,
				ZIndex = 5,
			})
		end
	end

	local titleLabel = makeText({
		Name = "Title",
		Position = UDim2.fromOffset(titleOffset, 8),
		Size = UDim2.new(1, -(titleOffset + 286), 0, 25),
		Text = library.Title,
		TextColor3 = library.Theme.Text,
		TextSize = 16,
		TextTruncate = Enum.TextTruncate.AtEnd,
		FontFace = Font.new("rbxasset://fonts/families/BuilderSans.json", Enum.FontWeight.Bold),
		ZIndex = 5,
		Parent = topbar,
	})

	local subtitleLabel = makeText({
		Name = "Subtitle",
		Position = UDim2.fromOffset(titleOffset, 32),
		Size = UDim2.new(1, -(titleOffset + 286), 0, 20),
		Text = library.Subtitle,
		TextColor3 = library.Theme.MutedText,
		TextSize = 11,
		TextTruncate = Enum.TextTruncate.AtEnd,
		ZIndex = 5,
		Parent = topbar,
	})

	local userOptions = options.User or {}
	local userId = userOptions.UserId or (LocalPlayer and LocalPlayer.UserId) or 0
	local userName = userOptions.Name or (LocalPlayer and (LocalPlayer.DisplayName or LocalPlayer.Name)) or "User"
	local userRole = userOptions.Role or "Player"
	local avatarImage = userOptions.Avatar or makeAvatarUrl(userId)
	library.UserData = {
		UserId = userId,
		Name = userName,
		Role = userRole,
		Avatar = avatarImage,
		Tabs = userOptions.Tabs,
	}
	local userCard = makeButton({
		Name = "UserCard",
		AnchorPoint = Vector2.new(1, 0),
		Position = UDim2.new(1, -108, 0, 9),
		Size = UDim2.fromOffset(158, 42),
		Text = "",
		BackgroundColor3 = library.Theme.Control,
		BackgroundTransparency = library.Theme.ControlTransparency,
		TextColor3 = library.Theme.Text,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		ZIndex = 4,
		Parent = topbar,
	}, {
		corner(library.Theme.Radius + 2),
		stroke(library.Theme.Stroke, 0.26, 1),
	})
	applyGlass(userCard, library.Theme, library.Theme.Radius + 2, "soft", true)
	applyControlTexture(library, userCard, {
		Radius = library.Theme.Radius + 2,
		TextureTransparency = 0.88,
	})
	new("UIGradient", {
		Rotation = 12,
		Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
			ColorSequenceKeypoint.new(0.62, library.Theme.SurfaceAlt),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(229, 242, 255)),
		}),
		Transparency = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 0.12),
			NumberSequenceKeypoint.new(1, 0.38),
		}),
		Parent = userCard,
	})
	library.UserCard = userCard

	local avatar = new("ImageLabel", {
		Name = "Avatar",
		Position = UDim2.fromOffset(7, 6),
		Size = UDim2.fromOffset(30, 30),
		Image = avatarImage,
		BackgroundColor3 = library.Theme.AccentSoft,
		BorderSizePixel = 0,
		ZIndex = 5,
		Parent = userCard,
	}, {
		corner(8),
		stroke(library.Theme.Accent, 0.06, 2),
	})
	library.Avatar = avatar
	new("Frame", {
		Name = "StatusDot",
		Position = UDim2.fromOffset(31, 29),
		Size = UDim2.fromOffset(8, 8),
		BackgroundColor3 = library.Theme.Success,
		BorderSizePixel = 0,
		ZIndex = 7,
		Parent = userCard,
	}, { corner(4), stroke(Color3.fromRGB(255, 255, 255), 0.05, 1) })

	makeText({
		Name = "UserName",
		Position = UDim2.fromOffset(45, 5),
		Size = UDim2.new(1, -68, 0, 18),
		Text = userName,
		TextColor3 = library.Theme.Text,
		TextSize = 13,
		TextTruncate = Enum.TextTruncate.AtEnd,
		FontFace = Font.new("rbxasset://fonts/families/BuilderSans.json", Enum.FontWeight.Bold),
		ZIndex = 5,
		Parent = userCard,
	})
	makeText({
		Name = "UserRole",
		Position = UDim2.fromOffset(45, 22),
		Size = UDim2.new(1, -68, 0, 15),
		Text = userRole,
		TextColor3 = library.Theme.MutedText,
		TextSize = 10,
		TextTruncate = Enum.TextTruncate.AtEnd,
		ZIndex = 5,
		Parent = userCard,
	})
	createIcon(library, "lucide:chevron-down", {
		Parent = userCard,
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, -9, 0.5, 0),
		Size = UDim2.fromOffset(14, 14),
		Color = library.Theme.MutedText,
		ZIndex = 6,
	})
	addButtonMotion(userCard, library.Theme.Control, library.Theme.SurfaceAlt, library.Theme.Stroke)

	local controlRow = new("Frame", {
		Name = "WindowControls",
		AnchorPoint = Vector2.new(1, 0),
		Position = UDim2.new(1, 0, 0, 0),
		Size = UDim2.fromOffset(96, 48),
		BackgroundTransparency = 1,
		ZIndex = 5,
		Parent = topbar,
	}, {
		listLayout(0, true),
	})

	local minimize = makeButton({
		Name = "Minimize",
		Size = UDim2.fromOffset(48, 48),
		Text = "",
		TextSize = 20,
		TextColor3 = library.Theme.Text,
		BackgroundColor3 = library.Theme.SurfaceAlt,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ZIndex = 5,
		Parent = controlRow,
	})
	applyControlTexture(library, minimize, {
		Radius = 2,
		TextureTransparency = 0.92,
	})
	local minimizeIcon = createIcon(library, defaultWindow11Option(options, "MinimizeIcon", "lucide:minus"), {
		Parent = minimize,
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.fromOffset(15, 15),
		Color = library.Theme.Text,
		ZIndex = 6,
	})
	addTitlebarButtonMotion(
		minimize,
		minimizeIcon,
		library.Theme.SurfaceAlt,
		library.Theme.Stroke,
		library.Theme.StrokeStrong,
		library.Theme.Text,
		library.Theme.Text
	)

	local close = makeButton({
		Name = "Close",
		Size = UDim2.fromOffset(48, 48),
		Text = "",
		TextSize = 16,
		TextColor3 = library.Theme.Text,
		BackgroundColor3 = library.Theme.SurfaceAlt,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ZIndex = 5,
		Parent = controlRow,
	})
	applyControlTexture(library, close, {
		Radius = 2,
		TextureTransparency = 0.92,
	})
	local closeIcon = createIcon(library, defaultWindow11Option(options, "CloseIcon", "lucide:x"), {
		Parent = close,
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.fromOffset(15, 15),
		Color = library.Theme.Text,
		ZIndex = 6,
	})
	addTitlebarButtonMotion(
		close,
		closeIcon,
		library.Theme.SurfaceAlt,
		Color3.fromRGB(232, 70, 58),
		Color3.fromRGB(190, 42, 34),
		library.Theme.Text,
		Color3.fromRGB(255, 255, 255)
	)

	local tabbar = new("ScrollingFrame", {
		Name = "Tabbar",
		BackgroundColor3 = library.Theme.Surface,
		BackgroundTransparency = 0.07,
		BorderSizePixel = 0,
		ScrollBarThickness = 0,
		CanvasSize = UDim2.fromOffset(0, 0),
		ZIndex = 3,
		Parent = window,
	}, {
		corner(library.Theme.Radius + 2),
		stroke(library.Theme.Stroke, 0.24, 1),
		padding(10),
		listLayout(8),
	})
	applyGlass(tabbar, library.Theme, library.Theme.Radius + 2, "soft", true)
	applyControlTexture(library, tabbar, {
		Radius = library.Theme.Radius + 2,
		TextureTransparency = 0.88,
	})
	library.Sidebar = tabbar
	library.Tabbar = tabbar

	local pages = new("Frame", {
		Name = "Pages",
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		ZIndex = 3,
		Parent = window,
	})
	library.Pages = pages

	local pageBlurOverlay = new("Frame", {
		Name = "PageBlurOverlay",
		Size = UDim2.fromScale(1, 1),
		BackgroundColor3 = library.Theme.Surface,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Visible = false,
		ZIndex = 12,
		Parent = pages,
	}, {
		corner(library.Theme.Radius),
	})
	applyGlass(pageBlurOverlay, library.Theme, library.Theme.Radius, "soft")
	applyControlTexture(library, pageBlurOverlay, {
		Radius = library.Theme.Radius,
		TextureTransparency = 0.88,
	})
	pageBlurOverlay.BackgroundTransparency = 1
	library.PageBlurOverlay = pageBlurOverlay

	function library:_syncTabVisual(tab)
		if not tab or not tab.Button then
			return
		end
		local compact = self.SidebarCompact == true
		if tab.Label then
			tab.Label.Visible = not compact
		end
		if tab.IconImage then
			tab.IconImage.AnchorPoint = compact and Vector2.new(0.5, 0.5) or Vector2.new(0, 0)
			tab.IconImage.Position = compact and UDim2.fromScale(0.5, 0.5) or UDim2.fromOffset(12, 10)
			tab.IconImage.Size = compact and UDim2.fromOffset(20, 20) or UDim2.fromOffset(18, 18)
		end
	end

	local function updateShadow()
		shadow.AnchorPoint = window.AnchorPoint
		shadow.Position = window.Position
		shadow.Size =
			UDim2.new(window.Size.X.Scale, window.Size.X.Offset + 22, window.Size.Y.Scale, window.Size.Y.Offset + 22)
		softShadow.AnchorPoint = window.AnchorPoint
		softShadow.Position = UDim2.new(
			window.Position.X.Scale,
			window.Position.X.Offset + 3,
			window.Position.Y.Scale,
			window.Position.Y.Offset + 8
		)
		softShadow.Size = window.Size
	end

	function library:_layout(instant)
		local viewport = getViewport()
		local mobile = options.Mobile
		if mobile == nil then
			mobile = viewport.X <= 760
		end
		self.IsMobile = mobile

		local width
		local height
		local topInset = options.TopInset or 64
		if mobile then
			width = math.max(300, math.floor(viewport.X - 48))
			height = math.max(360, math.floor(viewport.Y - topInset - 14))
			height = math.min(height, options.MobileHeight or 600)
			window.AnchorPoint = Vector2.new(0.5, 0)
			self._openPosition = options.Position or UDim2.new(0.5, 0, 0, topInset)
			self._hiddenPosition = UDim2.new(0.5, 0, 1, height + 60)
			topbar.Size = UDim2.new(1, 0, 0, 60)
			tabbar.Position = UDim2.fromOffset(10, 70)
			tabbar.Size = UDim2.new(1, -20, 0, 48)
			tabbar.ScrollingDirection = Enum.ScrollingDirection.X
			tabbar.UIListLayout.FillDirection = Enum.FillDirection.Horizontal
			setCanvasToContent(tabbar, "X")
			pages.Position = UDim2.fromOffset(10, 128)
			pages.Size = UDim2.new(1, -20, 1, -138)
			userCard.Visible = false
			titleLabel.Size = UDim2.new(1, -(titleOffset + 110), 0, 25)
			subtitleLabel.Size = UDim2.new(1, -(titleOffset + 110), 0, 20)
			controlRow.Position = UDim2.new(1, 0, 0, 0)
			controlRow.Size = UDim2.fromOffset(88, 40)
			minimize.Size = UDim2.fromOffset(44, 40)
			close.Size = UDim2.fromOffset(44, 40)
			for _, tab in ipairs(self.Tabs) do
				tab.Button.Size = self.SidebarCompact and UDim2.fromOffset(42, 34) or UDim2.fromOffset(120, 34)
				self:_syncTabVisual(tab)
			end
		else
			local requested = options.Size or UDim2.fromOffset(640, 440)
			width = math.min(requested.X.Offset, math.floor(viewport.X - 80))
			height = math.min(requested.Y.Offset, math.floor(viewport.Y - topInset - 32))
			width = math.max(width, 560)
			height = math.max(height, 390)
			window.AnchorPoint = Vector2.new(0.5, 0)
			self._openPosition = options.Position or UDim2.new(0.5, 0, 0, topInset)
			self._hiddenPosition = UDim2.new(0.5, 0, 1, height + 80)
			topbar.Size = UDim2.new(1, 0, 0, 60)
			local sidebarWidth = self.SidebarCompact and 60 or 164
			local pageLeft = sidebarWidth + 24
			tabbar.Position = UDim2.fromOffset(12, 72)
			tabbar.Size = UDim2.new(0, sidebarWidth, 1, -84)
			tabbar.ScrollingDirection = Enum.ScrollingDirection.Y
			tabbar.UIListLayout.FillDirection = Enum.FillDirection.Vertical
			setCanvasToContent(tabbar, "Y")
			pages.Position = UDim2.fromOffset(pageLeft, 72)
			pages.Size = UDim2.new(1, -(pageLeft + 12), 1, -84)
			userCard.Visible = true
			titleLabel.Size = UDim2.new(1, -(titleOffset + 286), 0, 25)
			subtitleLabel.Size = UDim2.new(1, -(titleOffset + 286), 0, 20)
			userCard.Position = UDim2.new(1, -108, 0, 9)
			controlRow.Position = UDim2.new(1, 0, 0, 0)
			controlRow.Size = UDim2.fromOffset(92, 38)
			minimize.Size = UDim2.fromOffset(46, 38)
			close.Size = UDim2.fromOffset(46, 38)
			for _, tab in ipairs(self.Tabs) do
				tab.Button.Size = UDim2.new(1, 0, 0, self.SidebarCompact and 42 or 38)
				self:_syncTabVisual(tab)
			end
		end

		window.Size = UDim2.fromOffset(width, height)
		window.Position = self.Open and self._openPosition or self._hiddenPosition
		updateShadow()
		if instant then
			return
		end
	end

	function library:SetOpen(open, instant)
		self.Open = open == true
		window.Visible = true
		shadow.Visible = true
		softShadow.Visible = true
		if self.BackgroundBlur then
			self.BackgroundBlur.Enabled = true
		end

		local scale = window:FindFirstChild("WindowScale")
		if scale then
			scale.Scale = self.Open and 0.985 or 1
			tween(scale, WindowAnim, { Scale = self.Open and 1 or 0.985 })
		end

		local targetPosition = self.Open and self._openPosition or self._hiddenPosition
		local targetShadow = self.Open and (options.Dark and 0.54 or 0.8) or 1
		local targetSoftShadow = self.Open and (options.Dark and 0.76 or 0.86) or 1
		local targetBlurSize = self.Open and self._openBlurSize or 0
		if instant then
			window.Position = targetPosition
			shadow.Position = targetPosition
			shadow.ImageTransparency = targetShadow
			if self.BackgroundBlur then
				self.BackgroundBlur.Size = targetBlurSize
			end
			softShadow.Position = UDim2.new(
				targetPosition.X.Scale,
				targetPosition.X.Offset + 3,
				targetPosition.Y.Scale,
				targetPosition.Y.Offset + 8
			)
			softShadow.BackgroundTransparency = targetSoftShadow
			if not self.Open then
				window.Visible = false
				shadow.Visible = false
				softShadow.Visible = false
				if self.BackgroundBlur then
					self.BackgroundBlur.Enabled = false
				end
			end
		else
			tween(window, WindowAnim, {
				Position = targetPosition,
				BackgroundTransparency = self.Open and library.Theme.GlassTransparency or 1,
			})
			tween(shadow, WindowAnim, {
				Position = targetPosition,
				ImageTransparency = targetShadow,
			})
			tween(softShadow, WindowAnim, {
				Position = UDim2.new(
					targetPosition.X.Scale,
					targetPosition.X.Offset + 3,
					targetPosition.Y.Scale,
					targetPosition.Y.Offset + 8
				),
				BackgroundTransparency = targetSoftShadow,
			})
			if self.BackgroundBlur then
				tween(self.BackgroundBlur, WindowAnim, { Size = targetBlurSize })
			end
		end

		task.delay(0.32, function()
			if not self.Open and window.Parent then
				window.Visible = false
				shadow.Visible = false
				softShadow.Visible = false
				if self.BackgroundBlur then
					self.BackgroundBlur.Enabled = false
				end
			end
		end)
	end

	function library:Toggle()
		self:SetOpen(not self.Open)
	end

	function library:Show()
		self:SetOpen(true)
	end

	function library:Hide()
		self:SetOpen(false)
	end

	function library:SetWindowPosition(position)
		self._openPosition = position
		if self.Open then
			window.Position = position
			updateShadow()
		end
	end

	openButton.MouseButton1Click:Connect(function()
		library:Toggle()
	end)
	userCard.MouseButton1Click:Connect(function()
		library:ShowUserTabs()
	end)
	minimize.MouseButton1Click:Connect(function()
		library:Hide()
	end)
	close.MouseButton1Click:Connect(function()
		if options.DestroyOnClose then
			library:Destroy()
		else
			library:Hide()
		end
	end)

	if options.ToggleKey then
		table.insert(
			library._connections,
			UserInputService.InputBegan:Connect(function(input, processed)
				if processed then
					return
				end
				if input.KeyCode == options.ToggleKey then
					library:Toggle()
				end
			end)
		)
	end

	library:_layout(true)
	if library.Open then
		window.Position = library._hiddenPosition
		shadow.Position = library._hiddenPosition
		softShadow.Position = library._hiddenPosition
		library:SetOpen(true, options.Instant == true)
	else
		library:SetOpen(false, true)
	end

	local camera = workspace.CurrentCamera
	if camera then
		table.insert(
			library._connections,
			camera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
				library:_layout(true)
			end)
		)
	end

	return library
end

function MoreUI:Notify(options)
	options = options or {}
	local theme = self.Theme or Theme
	local duration = options.Duration or 4

	local card = new("Frame", {
		Name = "Notification",
		Size = UDim2.new(1, 0, 0, 0),
		BackgroundColor3 = theme.Surface,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		ZIndex = 61,
		Parent = self.NotificationLayer,
	}, {
		padding(12),
	})
	applyGlass(card, theme, 14, "strong")
	applyControlTexture(self, card, {
		Radius = 14,
		TextureTransparency = 0.88,
	})

	createIcon(self, options.Icon or "lucide:bell", {
		Parent = card,
		Position = UDim2.fromOffset(0, 3),
		Size = UDim2.fromOffset(20, 20),
		Color = options.Color or theme.Accent,
		ZIndex = 62,
	})
	makeText({
		Name = "Title",
		Position = UDim2.fromOffset(28, 0),
		Size = UDim2.new(1, -34, 0, 22),
		Text = options.Title or "Notification",
		TextColor3 = theme.Text,
		TextSize = 15,
		FontFace = Font.new("rbxasset://fonts/families/BuilderSans.json", Enum.FontWeight.Bold),
		ZIndex = 62,
		Parent = card,
	})
	makeText({
		Name = "Content",
		Position = UDim2.fromOffset(28, 25),
		Size = UDim2.new(1, -34, 0, 42),
		Text = options.Content or "",
		TextColor3 = theme.MutedText,
		TextSize = 13,
		TextYAlignment = Enum.TextYAlignment.Top,
		ZIndex = 62,
		Parent = card,
	})

	tween(card, WindowAnim, { Size = UDim2.new(1, 0, 0, 88) })
	task.delay(duration, function()
		if card.Parent then
			tween(card, Smooth, { Size = UDim2.new(1, 0, 0, 0), BackgroundTransparency = 1 })
			task.wait(0.24)
			card:Destroy()
		end
	end)
end

function MoreUI:ShowLoading(options)
	options = options or {}
	local theme = self.Theme or Theme
	local parent = self.Window or self.ScreenGui
	if not parent then
		return nil
	end

	local overlay = new("Frame", {
		Name = "LoadingOverlay",
		Size = UDim2.fromScale(1, 1),
		BackgroundColor3 = Color3.fromRGB(8, 10, 14),
		BackgroundTransparency = 0.86,
		BorderSizePixel = 0,
		ZIndex = 50,
		Parent = parent,
	})

	local card = new("Frame", {
		Name = "LoadingCard",
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = options.Size or UDim2.fromOffset(286, 118),
		BackgroundColor3 = theme.Surface,
		BorderSizePixel = 0,
		ZIndex = 51,
		Parent = overlay,
	}, {
		corner(16),
		stroke(theme.Stroke, 0.2, 1),
	})
	applyGlass(card, theme, 16, "strong")
	applyControlTexture(self, card, {
		Radius = 16,
		TextureTransparency = 0.88,
	})
	local cardScale = new("UIScale", { Scale = 0.96, Parent = card })
	tween(cardScale, Smooth, { Scale = 1 })

	local spinner = new("Frame", {
		Name = "Spinner",
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.fromOffset(24, 58),
		Size = UDim2.fromOffset(38, 38),
		BackgroundTransparency = 1,
		ZIndex = 52,
		Parent = card,
	})
	for index = 1, 8 do
		local angle = math.rad((index - 1) * 45)
		new("Frame", {
			Name = "Dot",
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromOffset(19 + math.cos(angle) * 15, 19 + math.sin(angle) * 15),
			Size = UDim2.fromOffset(5, 5),
			BackgroundColor3 = theme.Accent,
			BackgroundTransparency = 0.15 + index * 0.07,
			BorderSizePixel = 0,
			ZIndex = 53,
			Parent = spinner,
		}, { corner(3) })
	end

	makeText({
		Name = "LoadingTitle",
		Position = UDim2.fromOffset(78, 26),
		Size = UDim2.new(1, -96, 0, 28),
		Text = options.Title or "Loading",
		TextColor3 = theme.Text,
		TextSize = 16,
		TextTruncate = Enum.TextTruncate.AtEnd,
		FontFace = Font.new("rbxasset://fonts/families/BuilderSans.json", Enum.FontWeight.Bold),
		ZIndex = 52,
		Parent = card,
	})
	local message = makeText({
		Name = "LoadingMessage",
		Position = UDim2.fromOffset(78, 54),
		Size = UDim2.new(1, -96, 0, 42),
		Text = options.Content or options.Message or "Please wait...",
		TextColor3 = theme.MutedText,
		TextSize = 13,
		TextWrapped = true,
		TextYAlignment = Enum.TextYAlignment.Top,
		ZIndex = 52,
		Parent = card,
	})

	local alive = true
	local function spin()
		if not alive or not spinner.Parent then
			return
		end
		spinner.Rotation = 0
		local spinTween = tween(spinner, TweenInfo.new(0.9, Enum.EasingStyle.Linear), { Rotation = 360 })
		local connection
		connection = spinTween.Completed:Connect(function()
			if connection then
				connection:Disconnect()
			end
			spin()
		end)
	end
	spin()

	local loading = { Instance = overlay, Card = card }
	function loading:SetText(text)
		message.Text = tostring(text or "")
	end
	function loading:Close()
		alive = false
		if overlay.Parent then
			tween(cardScale, Fast, { Scale = 0.96 })
			tween(overlay, Fast, { BackgroundTransparency = 1 })
			task.delay(0.14, function()
				if overlay.Parent then
					overlay:Destroy()
				end
			end)
		end
	end
	return loading
end

function MoreUI:Dialog(options)
	options = options or {}
	local theme = self.Theme or Theme
	local parent = self.Window or self.ScreenGui
	if not parent then
		return nil
	end

	local overlay = new("Frame", {
		Name = "DialogOverlay",
		Size = UDim2.fromScale(1, 1),
		BackgroundColor3 = Color3.fromRGB(8, 10, 14),
		BackgroundTransparency = options.OverlayTransparency or 0.84,
		BorderSizePixel = 0,
		ZIndex = 55,
		Parent = parent,
	})
	local card = new("Frame", {
		Name = "Dialog",
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = options.Size or UDim2.fromOffset(360, 186),
		BackgroundColor3 = theme.Surface,
		BorderSizePixel = 0,
		ZIndex = 56,
		Parent = overlay,
	}, {
		corner(16),
		stroke(theme.Stroke, 0.18, 1),
	})
	applyGlass(card, theme, 16, "strong")
	applyControlTexture(self, card, {
		Radius = 16,
		TextureTransparency = 0.88,
	})
	local scale = new("UIScale", { Scale = 0.96, Parent = card })
	tween(scale, Smooth, { Scale = 1 })

	if options.Icon then
		createIcon(self, options.Icon, {
			Parent = card,
			Position = UDim2.fromOffset(18, 20),
			Size = UDim2.fromOffset(22, 22),
			Color = theme.Accent,
			ZIndex = 57,
		})
	end
	local left = options.Icon and 50 or 20
	makeText({
		Name = "DialogTitle",
		Position = UDim2.fromOffset(left, 16),
		Size = UDim2.new(1, -left - 20, 0, 28),
		Text = options.Title or "Dialog",
		TextColor3 = theme.Text,
		TextSize = 17,
		TextTruncate = Enum.TextTruncate.AtEnd,
		FontFace = Font.new("rbxasset://fonts/families/BuilderSans.json", Enum.FontWeight.Bold),
		ZIndex = 57,
		Parent = card,
	})
	makeText({
		Name = "DialogContent",
		Position = UDim2.fromOffset(20, 54),
		Size = UDim2.new(1, -40, 0, 70),
		Text = options.Content or options.Message or "",
		TextColor3 = theme.MutedText,
		TextSize = 13,
		TextWrapped = true,
		TextYAlignment = Enum.TextYAlignment.Top,
		ZIndex = 57,
		Parent = card,
	})

	local dialog = { Instance = overlay, Card = card }
	function dialog:Close()
		if overlay.Parent then
			tween(scale, Fast, { Scale = 0.96 })
			tween(overlay, Fast, { BackgroundTransparency = 1 })
			task.delay(0.14, function()
				if overlay.Parent then
					overlay:Destroy()
				end
			end)
		end
	end

	local actions = options.Actions or options.Buttons
	if not actions or #actions == 0 then
		actions = {
			{
				Text = options.ConfirmText or "OK",
				Accent = true,
				Callback = options.Callback,
			},
		}
	end
	local buttonWidth = math.max(86, math.floor((320 - (#actions - 1) * 8) / #actions))
	for index, action in ipairs(actions) do
		local button = makeButton({
			Name = "Action" .. index,
			AnchorPoint = Vector2.new(1, 1),
			Position = UDim2.new(1, -20 - (#actions - index) * (buttonWidth + 8), 1, -16),
			Size = UDim2.fromOffset(buttonWidth, 34),
			Text = tostring(action.Text or action.Title or "OK"),
			TextColor3 = action.Accent == false and theme.Text or theme.AccentText,
			TextSize = 13,
			BackgroundColor3 = action.Accent == false and theme.Control or theme.Accent,
			BackgroundTransparency = action.Accent == false and theme.ControlTransparency or 0,
			ZIndex = 57,
			Parent = card,
		}, {
			corner(9),
			stroke(theme.Stroke, action.Accent == false and 0.26 or 1, 1),
		})
		applyControlTexture(self, button, {
			Radius = 9,
			TextureTransparency = 0.9,
		})
		addButtonMotion(
			button,
			button.BackgroundColor3,
			action.Accent == false and theme.SurfaceAlt or theme.AccentHover
		)
		button.MouseButton1Click:Connect(function()
			safeCall(action.Callback or action.OnClick, dialog)
			if action.Close ~= false then
				dialog:Close()
			end
		end)
	end
	return dialog
end

function MoreUI:Popup(options)
	options = options or {}
	options.Size = options.Size or UDim2.fromOffset(330, 168)
	options.Title = options.Title or "Popup"
	return self:Dialog(options)
end

function MoreUI:ShowUserTabs(options)
	options = options or {}
	local library = self
	local theme = self.Theme or Theme
	local parent = self.Window or self.ScreenGui
	if not parent then
		return nil
	end
	if self.UserTabsController and self.UserTabsController.Close then
		self.UserTabsController:Close()
		return self.UserTabsController
	end

	local userData = self.UserData or {}
	local userName = options.Name or userData.Name or "User"
	local userRole = options.Role or userData.Role or "Player"
	local avatarImage = options.Avatar or userData.Avatar or makeAvatarUrl(userData.UserId or 0)
	local toggleKey = (self._options or {}).ToggleKey
	local toggleLabel = typeof(toggleKey) == "EnumItem" and toggleKey.Name or tostring(toggleKey or "None")
	local flagCount = 0
	for _ in pairs(self.Flags or {}) do
		flagCount = flagCount + 1
	end
	local tabs = options.Tabs
		or userData.Tabs
		or {
			{
				Title = "Profile",
				Icon = "lucide:user",
				Lines = {
					{ Icon = "lucide:user", Title = "Display", Value = userName },
					{ Icon = "lucide:users", Title = "User ID", Value = tostring(userData.UserId or 0) },
				},
			},
			{
				Title = "Session",
				Icon = "lucide:keyboard",
				Lines = {
					{
						Icon = "lucide:keyboard",
						Title = "Toggle",
						Value = toggleLabel,
					},
					{ Icon = "lucide:app-window", Title = "Layout", Value = self.IsMobile and "Mobile" or "Desktop" },
				},
			},
			{
				Title = "Config",
				Icon = "lucide:save",
				Lines = {
					{ Icon = "lucide:sliders", Title = "Flags", Value = tostring(flagCount) },
					{ Icon = "lucide:palette", Title = "Theme", Value = "Window 11 Glass" },
				},
			},
		}

	local panel = new("Frame", {
		Name = "UserTabsPanel",
		AnchorPoint = self.IsMobile and Vector2.new(0.5, 0) or Vector2.new(1, 0),
		Position = self.IsMobile and UDim2.new(0.5, 0, 0, 64) or UDim2.new(1, -104, 0, 58),
		Size = self.IsMobile and UDim2.new(1, -40, 0, 224) or UDim2.fromOffset(292, 224),
		BackgroundColor3 = theme.Surface,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		ZIndex = 46,
		Parent = parent,
	}, { corner(18), stroke(theme.Stroke, 0.18, 1) })
	applyGlass(panel, theme, 18, "strong")
	applyControlTexture(self, panel, {
		Radius = 18,
		TextureTransparency = 0.88,
	})
	local panelScale = new("UIScale", { Scale = 0.96, Parent = panel })
	tween(panelScale, Smooth, { Scale = 1 })

	new("ImageLabel", {
		Name = "Avatar",
		Position = UDim2.fromOffset(16, 14),
		Size = UDim2.fromOffset(42, 42),
		Image = avatarImage,
		BackgroundColor3 = theme.AccentSoft,
		BorderSizePixel = 0,
		ZIndex = 47,
		Parent = panel,
	}, { corner(12), stroke(theme.Accent, 0.08, 2) })
	makeText({
		Position = UDim2.fromOffset(70, 13),
		Size = UDim2.new(1, -118, 0, 24),
		Text = userName,
		TextColor3 = theme.Text,
		TextSize = 15,
		TextTruncate = Enum.TextTruncate.AtEnd,
		FontFace = Font.new("rbxasset://fonts/families/BuilderSans.json", Enum.FontWeight.Bold),
		ZIndex = 47,
		Parent = panel,
	})
	makeText({
		Position = UDim2.fromOffset(70, 36),
		Size = UDim2.new(1, -118, 0, 18),
		Text = userRole,
		TextColor3 = theme.MutedText,
		TextSize = 11,
		TextTruncate = Enum.TextTruncate.AtEnd,
		ZIndex = 47,
		Parent = panel,
	})

	local closeButton = makeButton({
		AnchorPoint = Vector2.new(1, 0),
		Position = UDim2.new(1, -12, 0, 12),
		Size = UDim2.fromOffset(30, 30),
		Text = "",
		BackgroundColor3 = theme.Control,
		BackgroundTransparency = theme.ControlTransparency,
		ZIndex = 47,
		Parent = panel,
	}, { corner(9), stroke(theme.Stroke, 0.3, 1) })
	createIcon(self, "lucide:x", {
		Parent = closeButton,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromOffset(14, 14),
		Color = theme.Text,
		ZIndex = 48,
	})
	addButtonMotion(closeButton, theme.Control, theme.SurfaceAlt)

	local tabStrip = new("Frame", {
		Position = UDim2.fromOffset(14, 70),
		Size = UDim2.new(1, -28, 0, 38),
		BackgroundColor3 = theme.Control,
		BackgroundTransparency = theme.ControlTransparency,
		ZIndex = 47,
		Parent = panel,
	}, { corner(12), padding(4), listLayout(6, true) })
	applyControlTexture(self, tabStrip, {
		Radius = 12,
		TextureTransparency = 0.9,
	})

	local pages = new("Frame", {
		Position = UDim2.fromOffset(14, 118),
		Size = UDim2.new(1, -28, 1, -132),
		BackgroundTransparency = 1,
		ZIndex = 47,
		Parent = panel,
	})
	local tabObjects = {}
	local function selectTab(selected)
		for _, tab in ipairs(tabObjects) do
			tab.Page.Visible = tab == selected
			tween(tab.Button, Fast, {
				BackgroundColor3 = tab == selected and theme.Accent or theme.Control,
				BackgroundTransparency = tab == selected and 0 or theme.ControlTransparency,
			})
			if tab.Icon then
				tween(tab.Icon, Fast, { ImageColor3 = tab == selected and theme.AccentText or theme.Text })
			end
		end
	end

	for index, tabInfo in ipairs(tabs) do
		local tabButton = makeButton({
			Size = UDim2.new(1 / math.max(#tabs, 1), -4, 1, 0),
			Text = "",
			BackgroundColor3 = theme.Control,
			BackgroundTransparency = theme.ControlTransparency,
			ZIndex = 48,
			Parent = tabStrip,
		}, { corner(9) })
		local tabIcon = createIcon(self, tabInfo.Icon or "lucide:user", {
			Parent = tabButton,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromOffset(17, 17),
			Color = theme.Text,
			ZIndex = 49,
		})
		local page = new("Frame", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			Visible = false,
			ZIndex = 48,
			Parent = pages,
		}, { listLayout(7) })
		for _, line in ipairs(tabInfo.Lines or {}) do
			local lineInfo = typeof(line) == "table" and line or { Title = tostring(line), Value = "" }
			local row = new("Frame", {
				Size = UDim2.new(1, 0, 0, 34),
				BackgroundColor3 = theme.Control,
				BackgroundTransparency = theme.ControlTransparency,
				BorderSizePixel = 0,
				ZIndex = 49,
				Parent = page,
			}, { corner(10), stroke(theme.Stroke, 0.34, 1) })
			applyControlTexture(self, row, {
				Radius = 10,
				TextureTransparency = 0.91,
			})
			if lineInfo.Icon then
				createIcon(self, lineInfo.Icon, {
					Parent = row,
					Position = UDim2.fromOffset(10, 8),
					Size = UDim2.fromOffset(16, 16),
					Color = theme.Accent,
					ZIndex = 50,
				})
			end
			local left = lineInfo.Icon and 34 or 10
			makeText({
				Position = UDim2.fromOffset(left, 0),
				Size = UDim2.new(0.48, -left, 1, 0),
				Text = lineInfo.Title or "",
				TextColor3 = theme.Text,
				TextSize = 12,
				TextTruncate = Enum.TextTruncate.AtEnd,
				ZIndex = 50,
				Parent = row,
			})
			makeText({
				AnchorPoint = Vector2.new(1, 0),
				Position = UDim2.new(1, -10, 0, 0),
				Size = UDim2.new(0.52, -12, 1, 0),
				Text = tostring(lineInfo.Value or ""),
				TextColor3 = theme.MutedText,
				TextSize = 12,
				TextXAlignment = Enum.TextXAlignment.Right,
				TextTruncate = Enum.TextTruncate.AtEnd,
				ZIndex = 50,
				Parent = row,
			})
		end
		local tabObject = { Button = tabButton, Icon = tabIcon, Page = page }
		table.insert(tabObjects, tabObject)
		tabButton.MouseButton1Click:Connect(function()
			selectTab(tabObject)
		end)
		if index == 1 then
			task.defer(selectTab, tabObject)
		end
	end

	local controller = { Instance = panel, Tabs = tabObjects }
	function controller:Close()
		if panel.Parent then
			library.UserTabsController = nil
			tween(panelScale, Fast, { Scale = 0.96 })
			tween(panel, Fast, { BackgroundTransparency = 1 })
			task.delay(0.14, function()
				if panel.Parent then
					panel:Destroy()
				end
			end)
		end
	end
	closeButton.MouseButton1Click:Connect(function()
		controller:Close()
	end)
	self.UserTabsController = controller
	return controller
end

function MoreUI:ShowKeybindMenu(options)
	options = options or {}
	local theme = self.Theme or Theme
	local parent = self.Window or self.ScreenGui
	if not parent then
		return nil
	end
	local keys = options.Keys
		or {
			Enum.KeyCode.RightShift,
			Enum.KeyCode.LeftShift,
			Enum.KeyCode.E,
			Enum.KeyCode.Q,
			Enum.KeyCode.F,
			Enum.KeyCode.R,
			Enum.KeyCode.X,
			Enum.KeyCode.C,
			Enum.KeyCode.V,
			Enum.KeyCode.Z,
		}

	local overlay = new("Frame", {
		Name = "KeybindMenuOverlay",
		Size = UDim2.fromScale(1, 1),
		BackgroundColor3 = Color3.fromRGB(8, 10, 14),
		BackgroundTransparency = 0.88,
		BorderSizePixel = 0,
		ZIndex = 58,
		Parent = parent,
	})
	local card = new("Frame", {
		Name = "KeybindMenu",
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromOffset(330, 232),
		BackgroundColor3 = theme.Surface,
		BorderSizePixel = 0,
		ZIndex = 59,
		Parent = overlay,
	}, {
		corner(18),
		stroke(theme.Stroke, 0.18, 1),
	})
	applyGlass(card, theme, 18, "strong")
	applyControlTexture(self, card, {
		Radius = 18,
		TextureTransparency = 0.88,
	})
	local scale = new("UIScale", { Scale = 0.96, Parent = card })
	tween(scale, Smooth, { Scale = 1 })

	makeText({
		Position = UDim2.fromOffset(18, 14),
		Size = UDim2.new(1, -54, 0, 28),
		Text = options.Title or "Keybind",
		TextColor3 = theme.Text,
		TextSize = 17,
		TextTruncate = Enum.TextTruncate.AtEnd,
		FontFace = Font.new("rbxasset://fonts/families/BuilderSans.json", Enum.FontWeight.Bold),
		ZIndex = 60,
		Parent = card,
	})
	local close = makeButton({
		AnchorPoint = Vector2.new(1, 0),
		Position = UDim2.new(1, -12, 0, 12),
		Size = UDim2.fromOffset(30, 30),
		Text = "×",
		TextColor3 = theme.Text,
		TextSize = 18,
		BackgroundColor3 = theme.Control,
		BackgroundTransparency = theme.ControlTransparency,
		BorderSizePixel = 0,
		ZIndex = 60,
		Parent = card,
	}, { corner(9), stroke(theme.Stroke, 0.3, 1) })

	local grid = new("Frame", {
		Position = UDim2.fromOffset(18, 54),
		Size = UDim2.new(1, -36, 1, -72),
		BackgroundTransparency = 1,
		ZIndex = 60,
		Parent = card,
	}, {
		new("UIGridLayout", {
			CellSize = UDim2.fromOffset(88, 38),
			CellPadding = UDim2.fromOffset(9, 9),
			SortOrder = Enum.SortOrder.LayoutOrder,
		}),
	})

	local menu = { Instance = overlay, Card = card }
	function menu:Close()
		if overlay.Parent then
			tween(scale, Fast, { Scale = 0.96 })
			tween(overlay, Fast, { BackgroundTransparency = 1 })
			task.delay(0.14, function()
				if overlay.Parent then
					overlay:Destroy()
				end
			end)
		end
	end
	close.MouseButton1Click:Connect(function()
		menu:Close()
	end)
	for index, key in ipairs(keys) do
		local label = typeof(key) == "EnumItem" and key.Name or tostring(key)
		local button = makeButton({
			LayoutOrder = index,
			Text = label,
			TextColor3 = theme.Text,
			TextSize = 13,
			BackgroundColor3 = key == options.Current and theme.AccentSoft or theme.Control,
			BackgroundTransparency = key == options.Current and 0.08 or theme.ControlTransparency,
			BorderSizePixel = 0,
			ZIndex = 61,
			Parent = grid,
		}, { corner(10), stroke(key == options.Current and theme.Accent or theme.Stroke, 0.24, 1) })
		applyControlTexture(self, button, {
			Radius = 10,
			TextureTransparency = 0.86,
		})
		addButtonMotion(button, button.BackgroundColor3, theme.SurfaceAlt)
		button.MouseButton1Click:Connect(function()
			safeCall(options.Callback, key)
			menu:Close()
		end)
	end
	return menu
end

function MoreUI:CreateTab(name, icon)
	if typeof(name) == "table" then
		icon = name.Icon
		name = name.Name or name.Title or "Tab"
	end

	local theme = self.Theme
	local tab = {
		Name = name,
		Icon = icon,
		Library = self,
		Elements = {},
		Selected = false,
	}

	local button = makeButton({
		Name = name .. "Button",
		Size = self.IsMobile and (self.SidebarCompact and UDim2.fromOffset(42, 36) or UDim2.fromOffset(132, 36))
			or UDim2.new(1, 0, 0, self.SidebarCompact and 42 or 40),
		Text = "",
		TextColor3 = theme.Text,
		BackgroundColor3 = theme.Surface,
		BackgroundTransparency = 0.32,
		ZIndex = 4,
		Parent = self.Tabbar,
	}, {
		corner(theme.Radius),
	})
	applyControlTexture(self, button, {
		Radius = theme.Radius,
		TextureTransparency = 0.9,
	})
	tab.Button = button

	local iconImage = createIcon(self, icon or name, {
		Parent = button,
		Position = self.SidebarCompact and UDim2.fromScale(0.5, 0.5) or UDim2.fromOffset(12, 10),
		AnchorPoint = self.SidebarCompact and Vector2.new(0.5, 0.5) or Vector2.new(0, 0),
		Size = UDim2.fromOffset(18, 18),
		Color = theme.Text,
		TextSize = 17,
		ZIndex = 5,
	})
	local label = makeText({
		Name = "Label",
		Position = UDim2.fromOffset(38, 0),
		Size = UDim2.new(1, -46, 1, 0),
		Text = name,
		TextColor3 = theme.Text,
		TextSize = 14,
		TextTruncate = Enum.TextTruncate.AtEnd,
		ZIndex = 5,
		Parent = button,
	})
	label.Visible = not self.SidebarCompact
	tab.IconImage = iconImage
	tab.Label = label

	local pageHolder = new("Frame", {
		Name = name .. "PageHolder",
		Position = UDim2.fromScale(0, 0),
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		Visible = false,
		ZIndex = 3,
		Parent = self.Pages,
	})
	getOrCreateScale(pageHolder, "PageScale")
	tab.Holder = pageHolder

	local page = new("ScrollingFrame", {
		Name = name .. "Page",
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ScrollBarImageColor3 = theme.StrokeStrong,
		ScrollBarThickness = 3,
		CanvasSize = UDim2.fromOffset(0, 0),
		ZIndex = 4,
		Parent = pageHolder,
	}, {
		padding(2),
		listLayout(10),
	})
	tab.Page = page
	setCanvasToContent(page, "Y")

	function tab:Select()
		if self.Selected then
			return
		end

		if self.Library.SelectedTab then
			playPageBlur(self.Library)
		end

		for _, other in ipairs(self.Library.Tabs) do
			local otherHolder = other.Holder or other.Page
			if otherHolder.Visible and other ~= self then
				local oldScale = getOrCreateScale(otherHolder, "PageScale")
				otherHolder.ZIndex = 3
				tween(otherHolder, Smooth, {
					Position = UDim2.fromOffset(0, -18),
				})
				tween(other.Page, Smooth, { ScrollBarImageTransparency = 1 })
				tween(oldScale, Smooth, { Scale = 0.982 })
				task.delay(0.22, function()
					if otherHolder and otherHolder.Parent and not other.Selected then
						otherHolder.Visible = false
						otherHolder.Position = UDim2.fromScale(0, 0)
						other.Page.ScrollBarImageTransparency = 0
						local resetScale = otherHolder:FindFirstChild("PageScale")
						if resetScale then
							resetScale.Scale = 1
						end
					end
				end)
			elseif other ~= self then
				otherHolder.Visible = false
			end
			other.Selected = false
			tween(other.Button, Fast, {
				BackgroundColor3 = theme.Surface,
				BackgroundTransparency = 0.32,
			})
			local otherLabel = other.Button:FindFirstChild("Label")
			if otherLabel then
				tween(otherLabel, Fast, { TextColor3 = theme.Text })
			end
		end

		self.Selected = true
		local holder = self.Holder or self.Page
		holder.Visible = true
		holder.Position = UDim2.fromOffset(0, 22)
		holder.ZIndex = 4
		self.Page.CanvasPosition = Vector2.new(0, 0)
		self.Page.ScrollBarImageTransparency = 1
		local pageScale = getOrCreateScale(holder, "PageScale")
		pageScale.Scale = 0.986
		tween(self.Button, Smooth, {
			BackgroundColor3 = theme.Accent,
			BackgroundTransparency = 0,
		})
		tween(label, Fast, { TextColor3 = theme.AccentText })
		self.Library.SelectedTab = self
		tween(holder, Smooth, {
			Position = UDim2.fromScale(0, 0),
		})
		tween(self.Page, Smooth, { ScrollBarImageTransparency = 0 })
		tween(pageScale, Smooth, { Scale = 1 })
	end

	button.MouseButton1Click:Connect(function()
		tab:Select()
	end)
	button.MouseEnter:Connect(function()
		if not tab.Selected then
			tween(button, Fast, {
				BackgroundColor3 = theme.SurfaceAlt,
				BackgroundTransparency = 0.14,
			})
		end
	end)
	button.MouseLeave:Connect(function()
		if not tab.Selected then
			tween(button, Fast, {
				BackgroundColor3 = theme.Surface,
				BackgroundTransparency = 0.32,
			})
		end
	end)

	table.insert(self.Tabs, tab)
	if self.IsMobile then
		button.Size = self.SidebarCompact and UDim2.fromOffset(42, 36) or UDim2.fromOffset(132, 36)
		setCanvasToContent(self.Tabbar, "X")
	else
		button.Size = UDim2.new(1, 0, 0, self.SidebarCompact and 42 or 40)
		setCanvasToContent(self.Tabbar, "Y")
	end
	self:_syncTabVisual(tab)
	if not self.SelectedTab then
		tab:Select()
	end

	function tab:CreateSection(titleText, sectionOptions)
		return self.Library:_createContainer(self.Page, titleText, sectionOptions)
	end

	function tab:AddParagraph(options)
		return self:CreateSection(options.Section or options.Title or "Info"):AddParagraph(options)
	end

	function tab:AddButton(options)
		return self:CreateSection(options.Section or "Actions"):AddButton(options)
	end

	function tab:AddHighlightButton(options)
		return self:CreateSection(options.Section or "Actions"):AddHighlightButton(options)
	end

	function tab:AddButtonLink(options)
		return self:CreateSection(options.Section or "Actions"):AddButtonLink(options)
	end

	function tab:AddToggle(options)
		return self:CreateSection(options.Section or "Toggles"):AddToggle(options)
	end

	function tab:AddSlider(options)
		return self:CreateSection(options.Section or "Sliders"):AddSlider(options)
	end

	function tab:AddDropdown(options)
		return self:CreateSection(options.Section or "Dropdowns"):AddDropdown(options)
	end

	function tab:AddTextbox(options)
		return self:CreateSection(options.Section or "Inputs"):AddTextbox(options)
	end

	function tab:AddKeybind(options)
		return self:CreateSection(options.Section or "Keybinds"):AddKeybind(options)
	end

	function tab:AddColorPicker(options)
		return self:CreateSection(options.Section or "Colors"):AddColorPicker(options)
	end

	function tab:AddCard(options)
		return self:CreateSection(options.Section or "Cards"):AddCard(options)
	end

	function tab:AddGroupBox(options)
		return self:CreateSection(options.Section or "GroupBox"):AddGroupBox(options)
	end

	function tab:AddGroupTabs(options)
		return self:CreateSection(options.Section or "Group Tabs"):AddGroupTabs(options)
	end

	return tab
end

function MoreUI:_register(flag, element)
	if flag then
		self.Elements[flag] = element
		self.Flags[flag] = element.Value
	end
end

function MoreUI:_rowBase(parent, height, options)
	options = options or {}
	local theme = self.Theme
	local className = options.Clickable and "TextButton" or "Frame"
	local props = {
		Size = UDim2.new(1, 0, 0, height),
		BackgroundColor3 = options.Color or theme.Control,
		BackgroundTransparency = options.Transparency or theme.ControlTransparency,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		ZIndex = 4,
		Parent = parent,
	}
	if options.Clickable then
		props.Text = ""
		props.AutoButtonColor = false
	end
	local row = new(className, props, {
		corner(options.Radius or theme.Radius),
		stroke(theme.Stroke, 0.32, 1),
	})
	if options.Glass then
		applyGlass(row, theme, options.Radius or theme.Radius, options.Strength, options.NoReflection)
	end
	applyControlTexture(self, row, {
		Radius = options.Radius or theme.Radius,
		Texture = options.Texture,
		ControlTexture = options.ControlTexture,
		TextureTransparency = options.TextureTransparency,
	})
	return row
end

function MoreUI:_createContainer(parent, titleText, options)
	options = options or {}
	if typeof(titleText) == "table" then
		options = titleText
		titleText = options.Title or "Group"
	end

	local theme = self.Theme
	local container = {
		Library = self,
		Title = titleText or "Section",
	}

	local frame = new("Frame", {
		Name = tostring(container.Title) .. (options.Kind or "Container"),
		Size = UDim2.new(1, -4, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = options.Color or theme.Surface,
		BorderSizePixel = 0,
		ClipsDescendants = false,
		ZIndex = 3,
		Parent = parent,
	}, {
		padding(options.Padding or 12),
		listLayout(options.Gap or 9),
	})
	if options.Glass == false then
		frame.BackgroundTransparency = options.Transparency or 0.06
		if not frame:FindFirstChildOfClass("UICorner") then
			corner(options.Radius or theme.Radius).Parent = frame
		end
		if not frame:FindFirstChildOfClass("UIStroke") then
			stroke(theme.Stroke, 0.28, 1).Parent = frame
		end
	else
		applyGlass(frame, theme, options.Radius or theme.Radius, options.Strength or "soft", true)
	end
	applyControlTexture(self, frame, {
		Radius = options.Radius or theme.Radius,
		Texture = options.Texture,
		ControlTexture = options.ControlTexture,
		TextureTransparency = options.TextureTransparency or 0.9,
	})
	container.Frame = frame

	local header = new("Frame", {
		Name = "Header",
		Size = UDim2.new(1, 0, 0, options.Icon and 26 or 24),
		BackgroundTransparency = 1,
		ZIndex = 4,
		Parent = frame,
	})
	if options.Icon then
		createIcon(self, options.Icon, {
			Parent = header,
			Position = UDim2.fromOffset(0, 3),
			Size = UDim2.fromOffset(18, 18),
			Color = theme.Accent,
			ZIndex = 5,
		})
	end
	makeText({
		Name = "Title",
		Position = options.Icon and UDim2.fromOffset(26, 0) or UDim2.fromOffset(0, 0),
		Size = options.Icon and UDim2.new(1, -26, 1, 0) or UDim2.fromScale(1, 1),
		Text = container.Title,
		TextColor3 = theme.Text,
		TextSize = options.TitleSize or 15,
		TextTruncate = Enum.TextTruncate.AtEnd,
		FontFace = Font.new("rbxasset://fonts/families/BuilderSans.json", Enum.FontWeight.Bold),
		ZIndex = 5,
		Parent = header,
	})

	local content = new("Frame", {
		Name = "Content",
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		ZIndex = 4,
		Parent = frame,
	}, {
		listLayout(options.InnerGap or 8),
	})
	container.Content = content

	self:_attachElementMethods(container, content)
	return container
end

function MoreUI:_attachElementMethods(container, content)
	local library = self
	local theme = self.Theme

	function container:AddParagraph(options)
		options = options or {}
		local row = library:_rowBase(content, options.Height or 76, { Glass = options.Glass ~= false })
		if options.Icon then
			createIcon(library, options.Icon, {
				Parent = row,
				Position = UDim2.fromOffset(12, 12),
				Size = UDim2.fromOffset(20, 20),
				Color = options.Color or theme.Accent,
				ZIndex = 5,
			})
		end
		makeText({
			Position = options.Icon and UDim2.fromOffset(42, 8) or UDim2.fromOffset(12, 8),
			Size = options.Icon and UDim2.new(1, -54, 0, 22) or UDim2.new(1, -24, 0, 22),
			Text = options.Title or "Paragraph",
			TextColor3 = theme.Text,
			TextSize = 14,
			TextTruncate = Enum.TextTruncate.AtEnd,
			FontFace = Font.new("rbxasset://fonts/families/BuilderSans.json", Enum.FontWeight.Bold),
			ZIndex = 5,
			Parent = row,
		})
		local body = makeText({
			Position = options.Icon and UDim2.fromOffset(42, 31) or UDim2.fromOffset(12, 31),
			Size = options.Icon and UDim2.new(1, -54, 1, -37) or UDim2.new(1, -24, 1, -37),
			Text = options.Content or options.Text or "",
			TextColor3 = theme.MutedText,
			TextSize = 13,
			TextYAlignment = Enum.TextYAlignment.Top,
			ZIndex = 5,
			Parent = row,
		})
		return {
			Instance = row,
			Set = function(_, text)
				body.Text = tostring(text)
			end,
		}
	end

	function container:AddDivider(options)
		options = options or {}
		local row = new("Frame", {
			Size = UDim2.new(1, 0, 0, options.Height or 12),
			BackgroundTransparency = 1,
			Parent = content,
		})
		new("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.new(1, -8, 0, 1),
			BackgroundColor3 = options.Color or theme.Stroke,
			BackgroundTransparency = options.Transparency or 0.15,
			BorderSizePixel = 0,
			Parent = row,
		})
		return { Instance = row }
	end

	function container:AddButton(options)
		options = options or {}
		local row = library:_rowBase(content, options.Height or 46, { Transparency = 1 })
		local button = makeButton({
			Position = UDim2.fromOffset(6, 5),
			Size = UDim2.new(1, -12, 1, -10),
			Text = "",
			TextColor3 = theme.AccentText,
			BackgroundColor3 = options.Color or theme.Accent,
			BorderSizePixel = 0,
			ZIndex = 5,
			Parent = row,
		}, {
			corner(11),
		})
		applyControlTexture(library, button, {
			Radius = 11,
			TextureTransparency = 0.9,
		})
		if options.TextureAsset then
			applyWindowAssetTexture(library, button, options.TextureAsset, {
				Radius = 11,
				Transparency = options.TextureTransparency or 0.88,
			})
		end
		if options.Icon then
			createIcon(library, options.Icon, {
				Parent = button,
				Position = UDim2.fromOffset(14, 9),
				Size = UDim2.fromOffset(18, 18),
				Color = theme.AccentText,
				ZIndex = 6,
			})
		end
		makeText({
			Position = options.Icon and UDim2.fromOffset(40, 0) or UDim2.fromOffset(0, 0),
			Size = options.Icon and UDim2.new(1, -50, 1, 0) or UDim2.fromScale(1, 1),
			Text = options.Text or options.Title or "Button",
			TextColor3 = theme.AccentText,
			TextSize = 14,
			TextXAlignment = options.Icon and Enum.TextXAlignment.Left or Enum.TextXAlignment.Center,
			TextTruncate = Enum.TextTruncate.AtEnd,
			ZIndex = 6,
			Parent = button,
		})
		addButtonMotion(button, options.Color or theme.Accent, options.HoverColor or theme.AccentHover)
		button.MouseButton1Click:Connect(function()
			safeCall(options.Callback)
		end)
		return { Instance = row, Button = button }
	end

	function container:AddHighlightButton(options)
		options = options or {}
		options.Color = options.Color or theme.Accent
		options.Height = options.Height or 52
		local element = container:AddButton(options)
		new("Frame", {
			Position = UDim2.fromOffset(8, 11),
			Size = UDim2.new(0, 3, 1, -22),
			BackgroundColor3 = options.HighlightColor or Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 0.18,
			BorderSizePixel = 0,
			ZIndex = 7,
			Parent = element.Button,
		}, { corner(2) })
		return element
	end

	function container:AddButtonLink(options)
		options = options or {}
		local buttons = options.Buttons or options.Items or {}
		local buttonHeight = options.ButtonHeight or 40
		local holder = library:_rowBase(content, options.Height or (#buttons * buttonHeight + 12), {
			Transparency = 1,
			Texture = false,
		})
		holder.ClipsDescendants = true
		local shell = new("Frame", {
			Position = UDim2.fromOffset(6, 6),
			Size = UDim2.new(1, -12, 1, -12),
			BackgroundColor3 = options.Color or theme.Control,
			BackgroundTransparency = options.Transparency or theme.ControlTransparency,
			BorderSizePixel = 0,
			ClipsDescendants = true,
			ZIndex = 5,
			Parent = holder,
		}, { corner(options.Radius or 12), stroke(theme.Stroke, 0.24, 1) })
		applyGlass(shell, theme, options.Radius or 12, "soft", true)
		applyWindowAssetTexture(library, shell, options.TextureAsset or "button-link-texture", {
			Radius = options.Radius or 12,
			Transparency = options.TextureTransparency or 0.76,
		})
		local stack = new("Frame", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			ZIndex = 7,
			Parent = shell,
		}, { listLayout(0) })
		local created = { Instance = holder, Shell = shell, Buttons = {} }
		local function getLinkedTexture(index, total, itemOptions)
			if itemOptions.TextureAsset then
				return itemOptions.TextureAsset
			end
			if total <= 1 then
				return options.SingleTextureAsset or options.TopTextureAsset or "button-link-top"
			end
			if index == 1 then
				return options.TopTextureAsset or "button-link-top"
			end
			if index == total then
				return options.BottomTextureAsset or "button-link-bottom"
			end
			return options.CenterTextureAsset or "button-link-center"
		end
		for index, rawItem in ipairs(buttons) do
			local item = typeof(rawItem) == "table" and rawItem or { Text = tostring(rawItem), Value = rawItem }
			local itemColor = item.Color
			local button = makeButton({
				Size = UDim2.new(1, 0, 0, buttonHeight),
				Text = "",
				BackgroundColor3 = itemColor or theme.SurfaceAlt,
				BackgroundTransparency = itemColor and 0.72 or 1,
				TextColor3 = itemColor and theme.AccentText or theme.Text,
				BorderSizePixel = 0,
				ClipsDescendants = true,
				ZIndex = 8,
				Parent = stack,
			})
			applyWindowAssetTexture(library, button, getLinkedTexture(index, #buttons, item), {
				Radius = 0,
				Transparency = item.TextureTransparency or options.ItemTextureTransparency or 0.78,
			})
			local hover = new("Frame", {
				Name = "Hover",
				Size = UDim2.fromScale(1, 1),
				BackgroundColor3 = item.HoverColor or options.HoverColor or theme.AccentSoft,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ZIndex = 9,
				Parent = button,
			})
			if index < #buttons then
				new("Frame", {
					Name = "Separator",
					AnchorPoint = Vector2.new(0, 1),
					Position = UDim2.new(0, 42, 1, 0),
					Size = UDim2.new(1, -52, 0, 1),
					BackgroundColor3 = theme.Stroke,
					BackgroundTransparency = 0.18,
					BorderSizePixel = 0,
					ZIndex = 11,
					Parent = button,
				})
			end
			if item.Icon then
				createIcon(library, item.Icon, {
					Parent = button,
					Position = UDim2.fromOffset(14, math.floor((buttonHeight - 18) / 2)),
					Size = UDim2.fromOffset(18, 18),
					Color = itemColor and theme.AccentText or theme.Accent,
					ZIndex = 12,
				})
			end
			makeText({
				Position = item.Icon and UDim2.fromOffset(42, 0) or UDim2.fromOffset(14, 0),
				Size = item.Icon and UDim2.new(1, -54, 1, 0) or UDim2.new(1, -28, 1, 0),
				Text = item.Text or item.Title or ("Button " .. index),
				TextColor3 = itemColor and theme.AccentText or theme.Text,
				TextSize = 14,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextTruncate = Enum.TextTruncate.AtEnd,
				ZIndex = 12,
				Parent = button,
			})
			button.MouseEnter:Connect(function()
				tween(hover, Fast, { BackgroundTransparency = itemColor and 0.82 or 0.7 })
			end)
			button.MouseLeave:Connect(function()
				tween(hover, Fast, { BackgroundTransparency = 1 })
			end)
			button.MouseButton1Down:Connect(function()
				tween(hover, Fast, { BackgroundTransparency = itemColor and 0.74 or 0.58 })
			end)
			button.MouseButton1Click:Connect(function()
				tween(hover, Fast, { BackgroundTransparency = 1 })
				safeCall(item.Callback or options.Callback, item, index, rawItem)
			end)
			table.insert(created.Buttons, button)
		end
		return created
	end

	function container:AddCard(options)
		options = options or {}
		local row = library:_rowBase(content, options.Height or 92, {
			Glass = true,
			Clickable = options.Callback ~= nil,
			Color = options.Color or theme.Control,
		})
		if options.Callback then
			addButtonMotion(row, options.Color or theme.Control, theme.SurfaceAlt, theme.Stroke)
			row.MouseButton1Click:Connect(function()
				safeCall(options.Callback)
			end)
		end
		new("Frame", {
			Position = UDim2.fromOffset(0, 14),
			Size = UDim2.new(0, 3, 1, -28),
			BackgroundColor3 = options.Accent or theme.Accent,
			BorderSizePixel = 0,
			ZIndex = 5,
			Parent = row,
		}, { corner(2) })
		if options.Icon then
			createIcon(library, options.Icon, {
				Parent = row,
				Position = UDim2.fromOffset(16, 14),
				Size = UDim2.fromOffset(22, 22),
				Color = options.Accent or theme.Accent,
				ZIndex = 5,
			})
		end
		local left = options.Icon and 48 or 16
		makeText({
			Position = UDim2.fromOffset(left, 12),
			Size = UDim2.new(1, -left - 16, 0, 24),
			Text = options.Title or "Card",
			TextColor3 = theme.Text,
			TextSize = 15,
			TextTruncate = Enum.TextTruncate.AtEnd,
			FontFace = Font.new("rbxasset://fonts/families/BuilderSans.json", Enum.FontWeight.Bold),
			ZIndex = 5,
			Parent = row,
		})
		makeText({
			Position = UDim2.fromOffset(left, 37),
			Size = UDim2.new(1, -left - 16, 1, -45),
			Text = options.Content or options.Text or "",
			TextColor3 = theme.MutedText,
			TextSize = 13,
			TextYAlignment = Enum.TextYAlignment.Top,
			ZIndex = 5,
			Parent = row,
		})
		return { Instance = row }
	end

	function container:AddToggle(options)
		options = options or {}
		local flag = options.Flag
		local value = options.Default == true
		local windowOptions = library._options or {}
		local onImageAsset = getIconAsset(
			library,
			options.ToggleOnImage
				or options.ToggleOnAsset
				or defaultWindow11Option(windowOptions, "ToggleOnImage", windowOptions.ToggleOnAsset),
			96
		)
		local offImageAsset = getIconAsset(
			library,
			options.ToggleOffImage
				or options.ToggleOffAsset
				or defaultWindow11Option(windowOptions, "ToggleOffImage", windowOptions.ToggleOffAsset),
			96
		)
		local wantsImageSwitch = options.ToggleStyle == "image" or windowOptions.ToggleStyle == "image"
		local useImageSwitch = wantsImageSwitch and onImageAsset ~= nil and offImageAsset ~= nil
		local row = library:_rowBase(content, options.Height or 48, { Glass = true })
		makeText({
			Position = UDim2.fromOffset(14, 0),
			Size = UDim2.new(1, -84, 1, 0),
			Text = options.Title or "Toggle",
			TextColor3 = theme.Text,
			TextSize = 14,
			TextTruncate = Enum.TextTruncate.AtEnd,
			ZIndex = 5,
			Parent = row,
		})

		local switch = makeButton({
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, -14, 0.5, 0),
			Size = UDim2.fromOffset(46, 24),
			Text = "",
			BackgroundColor3 = theme.StrokeStrong,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = 5,
			Parent = row,
		}, {
			corner(12),
		})
		local onTrack
		local offTrack
		local knob
		local onIcon
		local offIcon

		if useImageSwitch then
			offTrack = new("ImageLabel", {
				Name = "OffImage",
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				Image = offImageAsset,
				ImageColor3 = Color3.fromRGB(255, 255, 255),
				ImageTransparency = value and 1 or 0,
				ScaleType = Enum.ScaleType.Stretch,
				ZIndex = 6,
				Parent = switch,
			})
			onTrack = new("ImageLabel", {
				Name = "OnImage",
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				Image = onImageAsset,
				ImageColor3 = Color3.fromRGB(255, 255, 255),
				ImageTransparency = value and 0 or 1,
				ScaleType = Enum.ScaleType.Stretch,
				ZIndex = 7,
				Parent = switch,
			})
		else
			local showToggleIcons = options.ShowToggleIcons == true or windowOptions.ShowToggleIcons == true
			new("Frame", {
				Name = "ToggleShadow",
				Position = UDim2.fromOffset(0, 1),
				Size = UDim2.fromScale(1, 1),
				BackgroundColor3 = Color3.fromRGB(0, 0, 0),
				BackgroundTransparency = 0.9,
				BorderSizePixel = 0,
				ZIndex = 4,
				Parent = switch,
			}, { corner(12) })
			offTrack = new("Frame", {
				Name = "OffTrack",
				Size = UDim2.fromScale(1, 1),
				BackgroundColor3 = value and theme.AccentSoft or Color3.fromRGB(226, 232, 240),
				BackgroundTransparency = value and 0.22 or 0.04,
				BorderSizePixel = 0,
				ZIndex = 5,
				Parent = switch,
			}, { corner(12), stroke(theme.Stroke, 0.26, 1) })
			applyControlTexture(library, offTrack, {
				Radius = 12,
				TextureTransparency = 0.9,
			})
			onTrack = new("Frame", {
				Name = "OnTrack",
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = value and UDim2.fromScale(0.5, 0.5) or UDim2.new(1, -12, 0.5, 0),
				Size = value and UDim2.fromScale(1, 1) or UDim2.fromOffset(24, 24),
				BackgroundColor3 = theme.AccentHover,
				BackgroundTransparency = value and 0 or 1,
				BorderSizePixel = 0,
				ZIndex = 6,
				Parent = switch,
			}, { corner(12) })
			applyControlTexture(library, onTrack, {
				Radius = 12,
				TextureTransparency = 0.9,
			})
			knob = new("Frame", {
				Size = UDim2.fromOffset(18, 18),
				Position = value and UDim2.fromOffset(25, 3) or UDim2.fromOffset(3, 3),
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BorderSizePixel = 0,
				ZIndex = 7,
				Parent = switch,
			}, { corner(9), stroke(Color3.fromRGB(255, 255, 255), 0.45, 1) })
			new("UIScale", {
				Name = "KnobScale",
				Scale = 1,
				Parent = knob,
			})
			applyControlTexture(library, knob, {
				Radius = 9,
				TextureTransparency = 0.88,
			})
			if showToggleIcons then
				onIcon = createIcon(
					library,
					options.ToggleOnIcon or defaultWindow11Option(windowOptions, "ToggleOnIcon", "lucide:check"),
					{
						Parent = knob,
						Position = UDim2.fromScale(0.5, 0.5),
						AnchorPoint = Vector2.new(0.5, 0.5),
						Size = UDim2.fromOffset(10, 10),
						Color = theme.Accent,
						ZIndex = 8,
					}
				)
				offIcon = createIcon(
					library,
					options.ToggleOffIcon or defaultWindow11Option(windowOptions, "ToggleOffIcon", "lucide:x"),
					{
						Parent = knob,
						Position = UDim2.fromScale(0.5, 0.5),
						AnchorPoint = Vector2.new(0.5, 0.5),
						Size = UDim2.fromOffset(10, 10),
						Color = theme.StrokeStrong,
						ZIndex = 8,
					}
				)
			end
		end

		local element = { Instance = row, Value = value }
		function element:Set(newValue)
			value = newValue == true
			element.Value = value
			if flag then
				library.Flags[flag] = value
			end
			if useImageSwitch then
				tween(onTrack, Smooth, { ImageTransparency = value and 0 or 1 })
				tween(offTrack, Smooth, { ImageTransparency = value and 1 or 0 })
			else
				tween(offTrack, Smooth, {
					BackgroundColor3 = value and theme.AccentSoft or Color3.fromRGB(226, 232, 240),
					BackgroundTransparency = value and 0.22 or 0.04,
				})
				tween(onTrack, Smooth, {
					Position = value and UDim2.fromScale(0.5, 0.5) or UDim2.new(1, -12, 0.5, 0),
					Size = value and UDim2.fromScale(1, 1) or UDim2.fromOffset(24, 24),
					BackgroundTransparency = value and 0 or 1,
				})
				tween(knob, Smooth, { Position = value and UDim2.fromOffset(25, 3) or UDim2.fromOffset(3, 3) })
				local knobScale = knob:FindFirstChild("KnobScale")
				if knobScale then
					tween(knobScale, Fast, { Scale = 0.9 })
					task.delay(0.08, function()
						if knobScale.Parent then
							tween(knobScale, Fast, { Scale = 1 })
						end
					end)
				end
				if onIcon then
					tween(onIcon, Fast, { ImageTransparency = value and 0 or 1 })
				end
				if offIcon then
					tween(offIcon, Fast, { ImageTransparency = value and 1 or 0 })
				end
			end
			safeCall(options.Callback, value)
		end
		if not useImageSwitch then
			if onIcon then
				onIcon.ImageTransparency = value and 0 or 1
			end
			if offIcon then
				offIcon.ImageTransparency = value and 1 or 0
			end
		end

		switch.MouseButton1Click:Connect(function()
			element:Set(not value)
		end)
		row.InputBegan:Connect(function(input)
			if
				input.UserInputType == Enum.UserInputType.MouseButton1
				or input.UserInputType == Enum.UserInputType.Touch
			then
				element:Set(not value)
			end
		end)
		library:_register(flag, element)
		return element
	end

	function container:AddCheckbox(options)
		options = options or {}
		local flag = options.Flag
		local value = options.Default == true
		local row = library:_rowBase(content, options.Height or 48, { Glass = true })
		makeText({
			Position = UDim2.fromOffset(50, 0),
			Size = UDim2.new(1, -62, 1, 0),
			Text = options.Title or "Checkbox",
			TextColor3 = theme.Text,
			TextSize = 14,
			TextTruncate = Enum.TextTruncate.AtEnd,
			ZIndex = 5,
			Parent = row,
		})
		local box = makeButton({
			Position = UDim2.fromOffset(14, 12),
			Size = UDim2.fromOffset(24, 24),
			Text = value and "✓" or "",
			TextColor3 = theme.AccentText,
			TextSize = 16,
			BackgroundColor3 = value and theme.Accent or theme.Control,
			BorderSizePixel = 0,
			ZIndex = 5,
			Parent = row,
		}, { corner(7), stroke(theme.Stroke, 0.18, 1) })
		applyControlTexture(library, box, {
			Radius = 7,
			TextureTransparency = 0.9,
		})
		local element = { Instance = row, Value = value }
		function element:Set(newValue)
			value = newValue == true
			element.Value = value
			if flag then
				library.Flags[flag] = value
			end
			box.Text = value and "✓" or ""
			tween(box, Smooth, { BackgroundColor3 = value and theme.Accent or theme.Control })
			safeCall(options.Callback, value)
		end
		box.MouseButton1Click:Connect(function()
			element:Set(not value)
		end)
		library:_register(flag, element)
		return element
	end

	function container:AddSlider(options)
		options = options or {}
		local min = options.Min or 0
		local max = options.Max or 100
		if max == min then
			max = min + 1
		end
		local decimals = options.Decimals or 0
		local value = math.clamp(options.Default or min, min, max)
		local flag = options.Flag
		local row = library:_rowBase(content, options.Height or 70, { Glass = true })

		makeText({
			Position = UDim2.fromOffset(14, 7),
			Size = UDim2.new(1, -96, 0, 24),
			Text = options.Title or "Slider",
			TextColor3 = theme.Text,
			TextSize = 14,
			TextTruncate = Enum.TextTruncate.AtEnd,
			ZIndex = 5,
			Parent = row,
		})
		local valueLabel = makeText({
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.new(1, -14, 0, 7),
			Size = UDim2.fromOffset(76, 24),
			Text = tostring(value),
			TextColor3 = theme.MutedText,
			TextXAlignment = Enum.TextXAlignment.Right,
			ZIndex = 5,
			Parent = row,
		})
		local rail = new("Frame", {
			Position = UDim2.fromOffset(14, 44),
			Size = UDim2.new(1, -28, 0, 8),
			BackgroundColor3 = Color3.fromRGB(224, 232, 242),
			BorderSizePixel = 0,
			ZIndex = 5,
			Parent = row,
		}, { corner(4) })
		applyControlTexture(library, rail, {
			Radius = 4,
			TextureTransparency = 0.92,
		})
		applyWindowAssetTexture(library, rail, options.TextureAsset or "slider-texture", {
			Radius = 4,
			Transparency = options.RailTextureTransparency or 0.82,
		})
		local fill = new("Frame", {
			Size = UDim2.fromScale((value - min) / (max - min), 1),
			BackgroundColor3 = theme.AccentHover,
			BorderSizePixel = 0,
			ZIndex = 6,
			Parent = rail,
		}, {
			corner(4),
			new("UIGradient", {
				Name = "SliderSheet",
				Rotation = 0,
				Offset = Vector2.new(-0.65, 0),
				Color = ColorSequence.new({
					ColorSequenceKeypoint.new(0, theme.Accent),
					ColorSequenceKeypoint.new(0.48, Color3.fromRGB(120, 210, 255)),
					ColorSequenceKeypoint.new(1, theme.AccentHover),
				}),
			}),
		})
		applyControlTexture(library, fill, {
			Radius = 4,
			TextureTransparency = 0.88,
		})
		applyWindowAssetTexture(library, fill, options.TextureAsset or "slider-texture", {
			Radius = 4,
			Transparency = options.FillTextureTransparency or 0.78,
		})
		local sliderGradient = fill:FindFirstChild("SliderSheet")
		local sliderAlive = true
		table.insert(library._connections, {
			Disconnect = function()
				sliderAlive = false
			end,
		})
		local function playSliderSheet()
			if not sliderAlive or not sliderGradient or not sliderGradient.Parent then
				return
			end
			sliderGradient.Offset = Vector2.new(-0.65, 0)
			local sheetTween =
				tween(sliderGradient, TweenInfo.new(1.9, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
					Offset = Vector2.new(0.65, 0),
				})
			local connection
			connection = sheetTween.Completed:Connect(function()
				if connection then
					connection:Disconnect()
				end
				playSliderSheet()
			end)
		end
		playSliderSheet()
		local thumb = new("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale((value - min) / (max - min), 0.5),
			Size = UDim2.fromOffset(22, 22),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BorderSizePixel = 0,
			ZIndex = 7,
			Parent = rail,
		}, { corner(11), stroke(theme.Accent, 0, 2) })
		new("Frame", {
			Name = "ThumbGlow",
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromOffset(9, 9),
			BackgroundColor3 = theme.Accent,
			BackgroundTransparency = 0.2,
			BorderSizePixel = 0,
			ZIndex = 8,
			Parent = thumb,
		}, { corner(5) })
		local thumbScale = new("UIScale", {
			Name = "ThumbScale",
			Scale = 1,
			Parent = thumb,
		})
		applyControlTexture(library, thumb, {
			Radius = 11,
			TextureTransparency = 0.86,
		})
		applyWindowAssetTexture(library, thumb, options.TextureAsset or "slider-texture", {
			Radius = 11,
			Transparency = options.KnobTextureTransparency or 0.84,
		})

		local element = { Instance = row, Value = value }
		local dragging = false
		local function round(n)
			local mult = 10 ^ decimals
			return math.floor(n * mult + 0.5) / mult
		end
		function element:Set(newValue)
			value = math.clamp(round(tonumber(newValue) or min), min, max)
			element.Value = value
			if flag then
				library.Flags[flag] = value
			end
			local alpha = (value - min) / (max - min)
			valueLabel.Text = tostring(value)
			tween(fill, Smooth, { Size = UDim2.fromScale(alpha, 1) })
			tween(thumb, Smooth, { Position = UDim2.fromScale(alpha, 0.5) })
			safeCall(options.Callback, value)
		end
		local function updateFromX(x)
			local alpha = math.clamp((x - rail.AbsolutePosition.X) / rail.AbsoluteSize.X, 0, 1)
			element:Set(min + (max - min) * alpha)
		end
		rail.InputBegan:Connect(function(input)
			if
				input.UserInputType == Enum.UserInputType.MouseButton1
				or input.UserInputType == Enum.UserInputType.Touch
			then
				dragging = true
				tween(thumbScale, Fast, { Scale = 1.08 })
				updateFromX(input.Position.X)
			end
		end)
		table.insert(
			library._connections,
			UserInputService.InputChanged:Connect(function(input)
				if
					dragging
					and (
						input.UserInputType == Enum.UserInputType.MouseMovement
						or input.UserInputType == Enum.UserInputType.Touch
					)
				then
					updateFromX(input.Position.X)
				end
			end)
		)
		table.insert(
			library._connections,
			UserInputService.InputEnded:Connect(function(input)
				if
					input.UserInputType == Enum.UserInputType.MouseButton1
					or input.UserInputType == Enum.UserInputType.Touch
				then
					dragging = false
					tween(thumbScale, Fast, { Scale = 1 })
				end
			end)
		)
		library:_register(flag, element)
		return element
	end

	function container:AddStepper(options)
		options = options or {}
		local windowOptions = library._options or {}
		local min = options.Min or 0
		local max = options.Max or 100
		local step = options.Step or 1
		local value = math.clamp(options.Default or min, min, max)
		local flag = options.Flag
		local row = library:_rowBase(content, options.Height or 54, { Glass = true })
		makeText({
			Position = UDim2.fromOffset(14, 0),
			Size = UDim2.new(1, -158, 1, 0),
			Text = options.Title or "Stepper",
			TextColor3 = theme.Text,
			TextSize = 14,
			TextTruncate = Enum.TextTruncate.AtEnd,
			ZIndex = 5,
			Parent = row,
		})
		local valueLabel = makeText({
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, -58, 0.5, 0),
			Size = UDim2.fromOffset(60, 32),
			Text = tostring(value),
			TextColor3 = theme.Text,
			TextXAlignment = Enum.TextXAlignment.Center,
			ZIndex = 5,
			Parent = row,
		})
		local minus = makeButton({
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, -118, 0.5, 0),
			Size = UDim2.fromOffset(34, 32),
			Text = "",
			TextColor3 = theme.Text,
			BackgroundColor3 = theme.Control,
			ZIndex = 5,
			Parent = row,
		}, { corner(9), stroke(theme.Stroke, 0.22, 1) })
		applyControlTexture(library, minus, {
			Radius = 9,
			TextureTransparency = 0.9,
		})
		createIcon(
			library,
			options.MinusIcon
				or options.StepperMinusIcon
				or defaultWindow11Option(windowOptions, "StepperMinusIcon", "lucide:minus"),
			{
				Parent = minus,
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Size = UDim2.fromOffset(15, 15),
				Color = theme.Text,
				ZIndex = 6,
			}
		)
		local plus = makeButton({
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, -14, 0.5, 0),
			Size = UDim2.fromOffset(34, 32),
			Text = "",
			TextColor3 = theme.Text,
			BackgroundColor3 = theme.Control,
			ZIndex = 5,
			Parent = row,
		}, { corner(9), stroke(theme.Stroke, 0.22, 1) })
		applyControlTexture(library, plus, {
			Radius = 9,
			TextureTransparency = 0.9,
		})
		createIcon(
			library,
			options.PlusIcon
				or options.StepperPlusIcon
				or defaultWindow11Option(windowOptions, "StepperPlusIcon", "lucide:plus"),
			{
				Parent = plus,
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Size = UDim2.fromOffset(15, 15),
				Color = theme.Text,
				ZIndex = 6,
			}
		)
		local element = { Instance = row, Value = value }
		function element:Set(newValue)
			value = math.clamp(tonumber(newValue) or min, min, max)
			element.Value = value
			valueLabel.Text = tostring(value)
			if flag then
				library.Flags[flag] = value
			end
			safeCall(options.Callback, value)
		end
		minus.MouseButton1Click:Connect(function()
			element:Set(value - step)
		end)
		plus.MouseButton1Click:Connect(function()
			element:Set(value + step)
		end)
		library:_register(flag, element)
		return element
	end

	function container:AddDropdown(options)
		options = options or {}
		local values = options.Values or options.Options or {}
		local multi = options.Multi == true or options.Mode == "Multi" or options.Type == "Multi"
		local style = options.Style or options.Mode or options.Type or "single"
		local cardStyle = string.lower(tostring(style)) == "card" or options.Cards == true
		local flag = options.Flag
		local selected = {}
		local value = options.Default or values[1]
		if multi then
			value = {}
			for _, item in ipairs(options.Default or {}) do
				selected[item] = true
				table.insert(value, item)
			end
		end
		local expanded = false
		local row = library:_rowBase(content, 52, { Glass = true })
		row.ClipsDescendants = true

		local function itemTitle(item)
			if typeof(item) == "table" then
				return item.Title or item.Name or item.Text or tostring(item.Value or "Option")
			end
			return tostring(item)
		end
		local function itemValue(item)
			if typeof(item) == "table" then
				return item.Value or item.Id or item.Name or item.Title or item.Text or tostring(item)
			end
			return item
		end
		local function itemDesc(item)
			if typeof(item) == "table" then
				return item.Desc or item.Description or item.Subtitle
			end
			return nil
		end
		local function displayValue()
			if multi then
				local text = {}
				for _, item in ipairs(values) do
					local current = itemValue(item)
					if selected[current] then
						table.insert(text, itemTitle(item))
					end
				end
				return #text > 0 and table.concat(text, ", ") or "None"
			end
			for _, item in ipairs(values) do
				if itemValue(item) == value then
					return itemTitle(item)
				end
			end
			return itemTitle(value or "None")
		end
		if not multi and typeof(value) == "table" then
			value = itemValue(value)
		end

		local button = makeButton({
			Position = UDim2.fromOffset(8, 8),
			Size = UDim2.new(1, -16, 0, 36),
			Text = "",
			BackgroundColor3 = theme.Control,
			BackgroundTransparency = theme.ControlTransparency,
			ZIndex = 5,
			Parent = row,
		}, {
			corner(10),
			stroke(theme.Stroke, 0.24, 1),
		})
		applyControlTexture(library, button, {
			Radius = 10,
			TextureTransparency = 0.8,
		})
		applyWindowAssetTexture(library, button, options.TextureAsset or "dropdown-texture", {
			Radius = 10,
			Transparency = options.TextureTransparency or 0.8,
		})
		local displayLabel = makeText({
			Position = UDim2.fromOffset(12, 0),
			Size = UDim2.new(1, -42, 1, 0),
			Text = string.format("%s: %s", options.Title or "Dropdown", displayValue()),
			TextColor3 = theme.Text,
			TextSize = 14,
			TextTruncate = Enum.TextTruncate.AtEnd,
			ZIndex = 6,
			Parent = button,
		})
		makeText({
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.new(1, -12, 0, 0),
			Size = UDim2.fromOffset(18, 36),
			Text = "⌄",
			TextColor3 = theme.MutedText,
			TextXAlignment = Enum.TextXAlignment.Center,
			TextSize = 18,
			ZIndex = 6,
			Parent = button,
		})

		local optionsFrame = new("Frame", {
			Position = UDim2.fromOffset(8, 50),
			Size = UDim2.new(1, -16, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			ZIndex = 5,
			Parent = row,
		}, { listLayout(6) })

		local element = { Instance = row, Value = value }
		function element:Set(newValue)
			if multi then
				selected = {}
				value = {}
				local newValues = typeof(newValue) == "table" and newValue or {}
				for _, item in ipairs(newValues) do
					selected[item] = true
					table.insert(value, item)
				end
			else
				value = newValue
			end
			element.Value = value
			displayLabel.Text = string.format("%s: %s", options.Title or "Dropdown", displayValue())
			if flag then
				library.Flags[flag] = value
			end
			safeCall(options.Callback, value)
		end
		function element:SetDisplay(text)
			displayLabel.Text = tostring(text)
		end
		function element:Refresh(newValues, keepValue)
			values = newValues or {}
			for _, child in ipairs(optionsFrame:GetChildren()) do
				if child:IsA("GuiButton") then
					child:Destroy()
				end
			end
			for _, item in ipairs(values) do
				local title = itemTitle(item)
				local currentValue = itemValue(item)
				local desc = itemDesc(item)
				local height = cardStyle and 58 or 34
				local optionButton = makeButton({
					Size = UDim2.new(1, 0, 0, height),
					Text = "",
					TextColor3 = theme.Text,
					BackgroundColor3 = theme.Control,
					BackgroundTransparency = theme.ControlTransparency,
					ZIndex = 6,
					Parent = optionsFrame,
				}, { corner(9) })
				applyControlTexture(library, optionButton, {
					Radius = 9,
					TextureTransparency = cardStyle and 0.82 or 0.86,
				})
				applyWindowAssetTexture(library, optionButton, options.TextureAsset or "dropdown-texture", {
					Radius = 9,
					Transparency = cardStyle and 0.78 or 0.84,
				})
				local left = 12
				if typeof(item) == "table" and item.Thumbnail then
					new("ImageLabel", {
						Position = UDim2.fromOffset(10, 9),
						Size = UDim2.fromOffset(40, 40),
						BackgroundColor3 = theme.AccentSoft,
						Image = item.Thumbnail,
						BorderSizePixel = 0,
						ZIndex = 7,
						Parent = optionButton,
					}, { corner(8), stroke(theme.Stroke, 0.28, 1) })
					left = 60
				elseif typeof(item) == "table" and item.Icon then
					createIcon(library, item.Icon, {
						Parent = optionButton,
						Position = UDim2.fromOffset(14, cardStyle and 19 or 9),
						Size = UDim2.fromOffset(16, 16),
						Color = theme.Accent,
						ZIndex = 7,
					})
					left = 38
				end
				makeText({
					Position = UDim2.fromOffset(left, cardStyle and 8 or 0),
					Size = UDim2.new(1, multi and -(left + 42) or -(left + 12), 0, cardStyle and 23 or height),
					Text = title,
					TextColor3 = theme.Text,
					TextSize = 13,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextTruncate = Enum.TextTruncate.AtEnd,
					ZIndex = 7,
					Parent = optionButton,
				})
				if cardStyle and desc then
					makeText({
						Position = UDim2.fromOffset(left, 30),
						Size = UDim2.new(1, -(left + 12), 0, 20),
						Text = tostring(desc),
						TextColor3 = theme.MutedText,
						TextSize = 11,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextTruncate = Enum.TextTruncate.AtEnd,
						ZIndex = 7,
						Parent = optionButton,
					})
				end
				local check
				if multi then
					check = new("Frame", {
						AnchorPoint = Vector2.new(1, 0.5),
						Position = UDim2.new(1, -12, 0.5, 0),
						Size = UDim2.fromOffset(18, 18),
						BackgroundColor3 = selected[currentValue] and theme.Accent or theme.Control,
						BackgroundTransparency = selected[currentValue] and 0 or 0.24,
						BorderSizePixel = 0,
						ZIndex = 7,
						Parent = optionButton,
					}, { corner(5), stroke(theme.Stroke, 0.3, 1) })
				end
				addButtonMotion(optionButton, theme.Control, theme.SurfaceAlt)
				optionButton.MouseButton1Click:Connect(function()
					if multi then
						selected[currentValue] = not selected[currentValue]
						local out = {}
						for _, valueItem in ipairs(values) do
							local valueKey = itemValue(valueItem)
							if selected[valueKey] then
								table.insert(out, valueKey)
							end
						end
						element:Set(out)
						if check then
							tween(check, Fast, {
								BackgroundColor3 = selected[currentValue] and theme.Accent or theme.Control,
								BackgroundTransparency = selected[currentValue] and 0 or 0.24,
							})
						end
					else
						element:Set(currentValue)
						expanded = false
						tween(row, Smooth, { Size = UDim2.new(1, 0, 0, 52) })
					end
				end)
			end
			if not keepValue then
				if multi then
					element:Set({})
				else
					element:Set(itemValue(values[1]))
				end
			end
		end
		element:Refresh(values, true)
		button.MouseButton1Click:Connect(function()
			expanded = not expanded
			local optionHeight = cardStyle and 64 or 40
			local targetHeight = expanded and (58 + (#values * optionHeight)) or 52
			tween(row, Smooth, { Size = UDim2.new(1, 0, 0, targetHeight) })
		end)
		library:_register(flag, element)
		return element
	end

	function container:AddMultiDropdown(options)
		options = options or {}
		return container:AddDropdown({
			Title = options.Title or "Multi Dropdown",
			Values = options.Values or options.Options or {},
			Default = options.Default or {},
			Flag = options.Flag,
			Callback = options.Callback,
			Multi = true,
			Style = options.Style,
			Cards = options.Cards,
		})
	end

	function container:AddTextbox(options)
		options = options or {}
		local flag = options.Flag
		local row = library:_rowBase(content, options.Height or 56, { Glass = true })
		makeText({
			Position = UDim2.fromOffset(14, 0),
			Size = UDim2.new(0.4, -14, 1, 0),
			Text = options.Title or "Textbox",
			TextColor3 = theme.Text,
			TextSize = 14,
			TextTruncate = Enum.TextTruncate.AtEnd,
			ZIndex = 5,
			Parent = row,
		})
		local box = new("TextBox", {
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, -10, 0.5, 0),
			Size = UDim2.new(0.6, -12, 0, 36),
			Text = options.Default or "",
			PlaceholderText = options.Placeholder or "Type...",
			TextColor3 = theme.Text,
			PlaceholderColor3 = theme.MutedText,
			BackgroundColor3 = theme.Control,
			BackgroundTransparency = theme.ControlTransparency,
			BorderSizePixel = 0,
			ClearTextOnFocus = false,
			FontFace = Font.new("rbxasset://fonts/families/BuilderSans.json", Enum.FontWeight.Medium),
			TextSize = 14,
			ZIndex = 5,
			Parent = row,
		}, {
			corner(10),
			stroke(theme.Stroke, 0.24, 1),
			padding(10),
		})
		applyControlTexture(library, box, {
			Radius = 10,
			TextureTransparency = 0.86,
		})
		local element = { Instance = row, Value = box.Text }
		function element:Set(text)
			element.Value = tostring(text)
			box.Text = element.Value
			if flag then
				library.Flags[flag] = element.Value
			end
			safeCall(options.Callback, element.Value)
		end
		box.FocusLost:Connect(function(enterPressed)
			if options.SubmitOnly and not enterPressed then
				return
			end
			element:Set(box.Text)
		end)
		library:_register(flag, element)
		return element
	end

	function container:AddKeybind(options)
		options = options or {}
		local flag = options.Flag
		local value = options.Default or Enum.KeyCode.RightControl
		local listening = false
		local row = library:_rowBase(content, options.Height or 52, { Glass = true })
		makeText({
			Position = UDim2.fromOffset(14, 0),
			Size = UDim2.new(1, -138, 1, 0),
			Text = options.Title or "Keybind",
			TextColor3 = theme.Text,
			TextSize = 14,
			TextTruncate = Enum.TextTruncate.AtEnd,
			ZIndex = 5,
			Parent = row,
		})
		local button = makeButton({
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, -10, 0.5, 0),
			Size = UDim2.fromOffset(116, 34),
			Text = value.Name,
			TextColor3 = theme.Text,
			BackgroundColor3 = theme.Control,
			BackgroundTransparency = theme.ControlTransparency,
			ZIndex = 5,
			Parent = row,
		}, {
			corner(10),
			stroke(theme.Stroke, 0.24, 1),
		})
		applyControlTexture(library, button, {
			Radius = 10,
			TextureTransparency = 0.86,
		})
		addButtonMotion(button, theme.Control, theme.SurfaceAlt)
		local element = { Instance = row, Value = value }
		function element:Set(keyCode)
			value = keyCode
			element.Value = value
			button.Text = value.Name
			if flag then
				library.Flags[flag] = value
			end
			safeCall(options.Changed, value)
		end
		button.MouseButton1Click:Connect(function()
			if
				options.MobileMenu ~= false and (library.IsMobile or UserInputService.TouchEnabled or options.ForceMenu)
			then
				library:ShowKeybindMenu({
					Title = options.Title or "Keybind",
					Current = value,
					Keys = options.Keys,
					Callback = function(keyCode)
						listening = false
						element:Set(keyCode)
					end,
				})
			else
				listening = true
				button.Text = "..."
			end
		end)
		table.insert(
			library._connections,
			UserInputService.InputBegan:Connect(function(input, processed)
				if listening and input.KeyCode ~= Enum.KeyCode.Unknown then
					listening = false
					element:Set(input.KeyCode)
					return
				end
				if not processed and input.KeyCode == value then
					safeCall(options.Callback, value)
				end
			end)
		)
		library:_register(flag, element)
		return element
	end

	function container:AddColorPicker(options)
		options = options or {}
		local flag = options.Flag
		local value = options.Default or theme.Accent
		local palette = options.Colors
			or {
				Color3.fromRGB(0, 120, 212),
				Color3.fromRGB(16, 124, 16),
				Color3.fromRGB(196, 43, 28),
				Color3.fromRGB(136, 23, 152),
				Color3.fromRGB(255, 185, 0),
				Color3.fromRGB(0, 153, 188),
			}
		local row = library:_rowBase(content, options.Height or 150, { Glass = true })
		makeText({
			Position = UDim2.fromOffset(14, 6),
			Size = UDim2.new(1, -88, 0, 24),
			Text = options.Title or "Color",
			TextColor3 = theme.Text,
			TextSize = 14,
			TextTruncate = Enum.TextTruncate.AtEnd,
			ZIndex = 5,
			Parent = row,
		})
		local preview = new("Frame", {
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.new(1, -14, 0, 9),
			Size = UDim2.fromOffset(54, 22),
			BackgroundColor3 = value,
			BorderSizePixel = 0,
			ZIndex = 5,
			Parent = row,
		}, {
			corner(7),
			stroke(theme.StrokeStrong, 0.1, 1),
		})
		applyControlTexture(library, preview, {
			Radius = 7,
			TextureTransparency = 0.92,
		})
		local swatches = new("Frame", {
			Position = UDim2.fromOffset(14, 40),
			Size = UDim2.new(1, -28, 0, 36),
			BackgroundTransparency = 1,
			ZIndex = 5,
			Parent = row,
		}, { listLayout(8, true) })
		local inputRow = new("Frame", {
			Position = UDim2.fromOffset(14, 90),
			Size = UDim2.new(1, -28, 0, 42),
			BackgroundTransparency = 1,
			ZIndex = 5,
			Parent = row,
		}, { listLayout(8, true) })

		local boxes = {}
		local function makeRgbBox(label, channel)
			local boxHolder = new("Frame", {
				Size = UDim2.new(1 / 3, -6, 1, 0),
				BackgroundTransparency = 1,
				ZIndex = 5,
				Parent = inputRow,
			})
			makeText({
				Position = UDim2.fromOffset(0, 0),
				Size = UDim2.fromOffset(18, 34),
				Text = label,
				TextColor3 = theme.MutedText,
				TextSize = 12,
				TextXAlignment = Enum.TextXAlignment.Center,
				ZIndex = 6,
				Parent = boxHolder,
			})
			local box = new("TextBox", {
				Position = UDim2.fromOffset(22, 0),
				Size = UDim2.new(1, -22, 0, 34),
				Text = "0",
				TextColor3 = theme.Text,
				BackgroundColor3 = theme.Control,
				BackgroundTransparency = theme.ControlTransparency,
				BorderSizePixel = 0,
				ClearTextOnFocus = false,
				FontFace = Font.new("rbxasset://fonts/families/BuilderSans.json", Enum.FontWeight.Medium),
				TextSize = 13,
				ZIndex = 6,
				Parent = boxHolder,
			}, {
				corner(8),
				stroke(theme.Stroke, 0.24, 1),
				padding(8),
			})
			applyControlTexture(library, box, {
				Radius = 8,
				TextureTransparency = 0.86,
			})
			boxes[channel] = box
			return box
		end

		makeRgbBox("R", "R")
		makeRgbBox("G", "G")
		makeRgbBox("B", "B")

		local element = { Instance = row, Value = value }
		local updatingBoxes = false
		local function toByte(channel)
			return math.clamp(math.floor(channel * 255 + 0.5), 0, 255)
		end
		local function updateBoxes(color)
			updatingBoxes = true
			boxes.R.Text = tostring(toByte(color.R))
			boxes.G.Text = tostring(toByte(color.G))
			boxes.B.Text = tostring(toByte(color.B))
			updatingBoxes = false
		end
		function element:Set(color)
			if typeof(color) == "table" then
				color = Color3.fromRGB(color[1] or 255, color[2] or 255, color[3] or 255)
			end
			if typeof(color) ~= "Color3" then
				return
			end
			value = color
			element.Value = value
			preview.BackgroundColor3 = value
			updateBoxes(value)
			if flag then
				library.Flags[flag] = value
			end
			safeCall(options.Callback, value)
		end
		local function setFromBoxes()
			if updatingBoxes then
				return
			end
			element:Set(
				Color3.fromRGB(
					math.clamp(tonumber(boxes.R.Text) or 0, 0, 255),
					math.clamp(tonumber(boxes.G.Text) or 0, 0, 255),
					math.clamp(tonumber(boxes.B.Text) or 0, 0, 255)
				)
			)
		end
		for _, box in pairs(boxes) do
			box.FocusLost:Connect(setFromBoxes)
		end
		for _, color in ipairs(palette) do
			local swatch = makeButton({
				Size = UDim2.fromOffset(34, 34),
				Text = "",
				BackgroundColor3 = color,
				ZIndex = 5,
				Parent = swatches,
			}, {
				corner(10),
				stroke(theme.StrokeStrong, 0, 1),
			})
			addButtonMotion(swatch, color, color)
			swatch.MouseButton1Click:Connect(function()
				element:Set(color)
			end)
		end
		element:Set(value)
		library:_register(flag, element)
		return element
	end

	function container:AddProgress(options)
		options = options or {}
		local value = math.clamp(options.Default or options.Value or 0, 0, 1)
		local flag = options.Flag
		local row = library:_rowBase(content, options.Height or 60, { Glass = true })
		makeText({
			Position = UDim2.fromOffset(14, 4),
			Size = UDim2.new(1, -28, 0, 24),
			Text = options.Title or "Progress",
			TextColor3 = theme.Text,
			TextSize = 14,
			TextTruncate = Enum.TextTruncate.AtEnd,
			ZIndex = 5,
			Parent = row,
		})
		local rail = new("Frame", {
			Position = UDim2.fromOffset(14, 38),
			Size = UDim2.new(1, -28, 0, 8),
			BackgroundColor3 = theme.Stroke,
			BorderSizePixel = 0,
			ZIndex = 5,
			Parent = row,
		}, { corner(4) })
		applyControlTexture(library, rail, {
			Radius = 4,
			TextureTransparency = 0.92,
		})
		local fill = new("Frame", {
			Size = UDim2.fromScale(value, 1),
			BackgroundColor3 = options.Color or theme.Accent,
			BorderSizePixel = 0,
			ZIndex = 6,
			Parent = rail,
		}, { corner(4) })
		applyControlTexture(library, fill, {
			Radius = 4,
			TextureTransparency = 0.92,
		})
		local element = { Instance = row, Value = value }
		function element:Set(newValue)
			value = math.clamp(tonumber(newValue) or 0, 0, 1)
			element.Value = value
			if flag then
				library.Flags[flag] = value
			end
			tween(fill, Smooth, { Size = UDim2.fromScale(value, 1) })
			safeCall(options.Callback, value)
		end
		library:_register(flag, element)
		return element
	end

	function container:AddSegmented(options)
		options = options or {}
		local values = options.Values or { "One", "Two" }
		local value = options.Default or values[1]
		local flag = options.Flag
		local row = library:_rowBase(content, options.Height or 58, { Glass = true })
		local holder = new("Frame", {
			Position = UDim2.fromOffset(8, 8),
			Size = UDim2.new(1, -16, 1, -16),
			BackgroundTransparency = 1,
			ZIndex = 5,
			Parent = row,
		}, { listLayout(6, true) })
		local buttons = {}
		local element = { Instance = row, Value = value }
		function element:Set(newValue)
			value = newValue
			element.Value = value
			for item, button in pairs(buttons) do
				tween(button, Fast, {
					BackgroundColor3 = item == value and theme.Accent or theme.Control,
					TextColor3 = item == value and theme.AccentText or theme.Text,
				})
			end
			if flag then
				library.Flags[flag] = value
			end
			safeCall(options.Callback, value)
		end
		for _, item in ipairs(values) do
			local segment = makeButton({
				Size = UDim2.new(1 / #values, -4, 1, 0),
				Text = tostring(item),
				TextColor3 = item == value and theme.AccentText or theme.Text,
				BackgroundColor3 = item == value and theme.Accent or theme.Control,
				BackgroundTransparency = item == value and 0 or theme.ControlTransparency,
				ZIndex = 6,
				Parent = holder,
			}, { corner(10), stroke(theme.Stroke, 0.32, 1) })
			applyControlTexture(library, segment, {
				Radius = 10,
				TextureTransparency = 0.88,
			})
			buttons[item] = segment
			addButtonMotion(segment, segment.BackgroundColor3, theme.SurfaceAlt)
			segment.MouseButton1Click:Connect(function()
				element:Set(item)
			end)
		end
		library:_register(flag, element)
		return element
	end

	function container:AddGroupBox(options)
		options = options or {}
		if typeof(options) ~= "table" then
			options = { Title = tostring(options) }
		end
		return library:_createContainer(content, options.Title or "GroupBox", {
			Kind = "GroupBox",
			Icon = options.Icon,
			Radius = options.Radius or theme.Radius,
			Padding = options.Padding or 10,
			Gap = options.Gap or 8,
			InnerGap = options.InnerGap or 7,
			TitleSize = options.TitleSize or 14,
			Glass = options.Glass,
			Color = options.Color,
			Transparency = options.Transparency,
		})
	end

	function container:AddGroupTabs(options)
		options = options or {}
		local iconOnly = options.IconOnly == true or options.Compact == true or options.CompactTabs == true
		local holder = library:_rowBase(content, options.Height or 0, {
			Glass = true,
			Radius = 14,
			NoReflection = true,
			Texture = false,
		})
		holder.Size = UDim2.new(1, 0, 0, 0)
		holder.AutomaticSize = Enum.AutomaticSize.Y
		padding(10).Parent = holder
		listLayout(8).Parent = holder

		local titleRow = new("Frame", {
			Size = UDim2.new(1, 0, 0, 24),
			BackgroundTransparency = 1,
			ZIndex = 5,
			Parent = holder,
		})
		if options.Icon then
			createIcon(library, options.Icon, {
				Parent = titleRow,
				Position = UDim2.fromOffset(0, 3),
				Size = UDim2.fromOffset(18, 18),
				Color = theme.Accent,
				ZIndex = 6,
			})
		end
		makeText({
			Position = options.Icon and UDim2.fromOffset(26, 0) or UDim2.fromOffset(0, 0),
			Size = options.Icon and UDim2.new(1, -26, 1, 0) or UDim2.fromScale(1, 1),
			Text = options.Title or "Group Tabs",
			TextColor3 = theme.Text,
			TextSize = 14,
			TextTruncate = Enum.TextTruncate.AtEnd,
			FontFace = Font.new("rbxasset://fonts/families/BuilderSans.json", Enum.FontWeight.Bold),
			ZIndex = 6,
			Parent = titleRow,
		})

		local tabButtons = new("Frame", {
			Size = UDim2.new(1, 0, 0, 36),
			BackgroundColor3 = theme.Surface,
			BackgroundTransparency = 0.22,
			ZIndex = 5,
			Parent = holder,
		}, { corner(12), padding(4), listLayout(6, true) })
		applyGlass(tabButtons, theme, 12, "soft", true)
		applyControlTexture(library, tabButtons, {
			Radius = 12,
			TextureTransparency = 0.9,
		})
		local pages = new("Frame", {
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			ZIndex = 5,
			Parent = holder,
		}, { listLayout(6) })

		local groupTabs = {
			Instance = holder,
			Tabs = {},
			SelectedTab = nil,
		}

		function groupTabs:AddTab(tabOptions, tabIcon)
			if typeof(tabOptions) ~= "table" then
				tabOptions = { Title = tostring(tabOptions), Icon = tabIcon }
			end
			local tabName = tabOptions.Title or tabOptions.Name or "Tab"
			local tabIconOnly = tabOptions.IconOnly
			if tabIconOnly == nil then
				tabIconOnly = iconOnly
			end
			local tabButton = makeButton({
				Size = UDim2.new(0, tabOptions.Width or (tabIconOnly and 42 or 118), 1, 0),
				Text = "",
				BackgroundColor3 = theme.Control,
				BackgroundTransparency = theme.ControlTransparency,
				TextColor3 = theme.Text,
				ZIndex = 6,
				Parent = tabButtons,
			}, { corner(10), stroke(theme.Stroke, 0.34, 1) })
			applyControlTexture(library, tabButton, {
				Radius = 10,
				TextureTransparency = 0.88,
			})
			if tabOptions.Icon then
				createIcon(library, tabOptions.Icon, {
					Parent = tabButton,
					Position = tabIconOnly and UDim2.fromScale(0.5, 0.5) or UDim2.fromOffset(10, 9),
					AnchorPoint = tabIconOnly and Vector2.new(0.5, 0.5) or Vector2.new(0, 0),
					Size = UDim2.fromOffset(tabIconOnly and 18 or 16, tabIconOnly and 18 or 16),
					Color = theme.Text,
					ZIndex = 7,
				})
			end
			makeText({
				Position = tabOptions.Icon and UDim2.fromOffset(32, 0) or UDim2.fromOffset(0, 0),
				Size = tabOptions.Icon and UDim2.new(1, -38, 1, 0) or UDim2.fromScale(1, 1),
				Text = tabName,
				TextColor3 = theme.Text,
				TextSize = 13,
				TextXAlignment = tabOptions.Icon and Enum.TextXAlignment.Left or Enum.TextXAlignment.Center,
				TextTruncate = Enum.TextTruncate.AtEnd,
				Visible = not tabIconOnly,
				ZIndex = 7,
				Parent = tabButton,
			})
			local page = new("Frame", {
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				Visible = false,
				ZIndex = 5,
				Parent = pages,
			}, { listLayout(7) })
			local group = {
				Name = tabName,
				Button = tabButton,
				Page = page,
				Selected = false,
			}
			library:_attachElementMethods(group, page)
			function group:Select()
				for _, other in ipairs(groupTabs.Tabs) do
					other.Selected = false
					other.Page.Visible = false
					tween(other.Button, Fast, {
						BackgroundColor3 = theme.Control,
						BackgroundTransparency = theme.ControlTransparency,
					})
				end
				self.Selected = true
				self.Page.Visible = true
				groupTabs.SelectedTab = self
				tween(self.Button, Smooth, {
					BackgroundColor3 = theme.Accent,
					BackgroundTransparency = 0,
				})
			end
			tabButton.MouseButton1Click:Connect(function()
				group:Select()
			end)
			table.insert(groupTabs.Tabs, group)
			if not groupTabs.SelectedTab then
				group:Select()
			end
			return group
		end

		return groupTabs
	end
end

function MoreUI:GetFlag(flag)
	return self.Flags[flag]
end

function MoreUI:SetFlag(flag, value)
	local element = self.Elements[flag]
	if element and element.Set then
		element:Set(value)
	else
		self.Flags[flag] = value
	end
end

function MoreUI:GetConfig()
	local data = {}
	for flag, value in pairs(self.Flags) do
		if typeof(value) == "EnumItem" then
			data[flag] = value.Name
		elseif typeof(value) == "Color3" then
			data[flag] = { math.floor(value.R * 255), math.floor(value.G * 255), math.floor(value.B * 255) }
		else
			data[flag] = value
		end
	end
	return data
end

function MoreUI:LoadConfig(data)
	for flag, value in pairs(data or {}) do
		local element = self.Elements[flag]
		if element and element.Set then
			if typeof(element.Value) == "EnumItem" and typeof(value) == "string" then
				local key = Enum.KeyCode[value]
				if key then
					element:Set(key)
				end
			elseif typeof(element.Value) == "Color3" and typeof(value) == "table" then
				element:Set(Color3.fromRGB(value[1] or 255, value[2] or 255, value[3] or 255))
			else
				element:Set(value)
			end
		else
			self.Flags[flag] = value
		end
	end
end

function MoreUI:SaveToFile(fileName)
	if not writefile then
		warn("[MoreUI] writefile is not available in this environment.")
		return false
	end
	local name = fileName or "MoreUIConfig.json"
	writefile(name, HttpService:JSONEncode(self:GetConfig()))
	return true
end

function MoreUI:LoadFromFile(fileName)
	if not readfile or not isfile then
		warn("[MoreUI] readfile/isfile is not available in this environment.")
		return false
	end
	local name = fileName or "MoreUIConfig.json"
	if not isfile(name) then
		return false
	end
	local ok, data = pcall(function()
		return HttpService:JSONDecode(readfile(name))
	end)
	if ok then
		self:LoadConfig(data)
		return true
	end
	return false
end

function MoreUI:Destroy()
	for _, connection in ipairs(self._connections or {}) do
		connection:Disconnect()
	end
	if self.BackgroundBlur then
		self.BackgroundBlur:Destroy()
		self.BackgroundBlur = nil
	end
	if self.ScreenGui then
		self.ScreenGui:Destroy()
	end
end

return MoreUI
